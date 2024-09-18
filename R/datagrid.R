#' @title Interactive tables with tui-grid
#'
#' @description Create interactive tables : sortable, filterable,
#'  editable with the JavaScript library [tui-grid](https://ui.toast.com/tui-grid/).
#'
#' @param data A `data.frame` or something convertible in `data.frame`.
#' @param ... Arguments passed to the `Grid` [JavaScript method](https://nhn.github.io/tui.grid/latest/Grid/).
#' @param sortable Logical, allow to sort columns.
#' @param pagination Number of rows per page to display, default to `NULL` (no pagination).
#' @param filters Logical, allow to filter columns.
#' @param colnames Alternative colnames to be displayed in the header.
#' @param colwidths Width for the columns, can be `"auto"` (width is determined by column's content)
#'  or a single or numeric vector to set the width in pixel. Use `NULL` to disable and use default behavior.
#' @param align Alignment for columns content: `"auto"` (numeric and date on right, other on left), `"right"`,
#'  `"center"` or `"left"`. Use `NULL` to ignore.
#' @param theme Predefined theme to be used.
#' @param draggable Whether to enable to drag the row for changing the order of rows.
#' @param data_as_input Should the `data` be available in an input `input$<ID>_data` server-side?
#' @param contextmenu Display or not a context menu when using right click in the grid.
#'  Can also be a list of custom options, see [tui-grid documentation](https://nhn.github.io/tui.grid/latest/tutorial-example27-export/)
#'  for examples.
#' @param datepicker_locale Custome locale texts for datepicker editor, see example in [grid_editor_date()].
#' @param guess_colwidths_opts Options when `colwidths = "guess"`, see [guess_colwidths_options()].
#' @param width,height Width and height of the table in a CSS unit or a numeric.
#' @param elementId Use an explicit element ID for the widget.
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#' @importFrom utils modifyList
#'
#' @export
#'
#' @seealso [datagridOutput()] / [renderDatagrid()] for usage in Shiny applications.
#'
#' @return A `datagrid` htmlwidget.
#'
#' @example examples/ex-datagrid.R
datagrid <- function(data = list(),
                     ...,
                     sortable = TRUE,
                     pagination = NULL,
                     filters = FALSE,
                     colnames = NULL,
                     colwidths = "fit",
                     align = "auto",
                     theme = c("clean", "striped", "default"),
                     draggable = FALSE,
                     data_as_input = FALSE,
                     contextmenu = FALSE,
                     datepicker_locale = NULL,
                     guess_colwidths_opts = guess_colwidths_options(),
                     width = NULL,
                     height = NULL,
                     elementId = NULL) {

  data <- as.data.frame(data)
  theme <- match.arg(theme)

  filters_type <- simple_filters(data)

  if (!is.vector(colnames)) {
    colnames <- names(data)
  } else if (!identical(length(colnames), ncol(data))) {
    warning(
      "datagrid: if provided, 'colnames' must be a vector of same length as number of cols in data.",
      call. = FALSE
    )
    colnames <- names(data)
  }

  options <- list(
    columns = lapply(
      X = seq_along(names(data)),
      FUN = function(i) {
        nm <- names(data)[i]
        dropNulls(list(
          header = colnames[i],
          name = nm,
          sortable = isTRUE(sortable),
          filter = if (isTRUE(filters)) filters_type[[nm]]
        ))
      }
    ),
    bodyHeight = "fitToParent",
    draggable = draggable,
    usageStatistics = getOption("toastuiUsageStatistics", default = FALSE)
  )

  options <- modifyList(x = options, val = list(...), keep.null = FALSE)
  if (!isTRUE(contextmenu))
    options <- c(options, list(contextMenu = NULL))

  if (!is.null(pagination)) {
    options$pageOptions <- list(
      perPage = pagination,
      useClient = TRUE
    )
    options$bodyHeight <- "auto"
  }

  if (is.null(options$rowHeight))
    options$rowHeight <- "auto"

  x <- dropNulls(list(
    data_df = data,
    nrow = nrow(data),
    ncol = ncol(data),
    data = data,
    colnames = names(data),
    options = options,
    theme = theme,
    themeOptions = getOption(
      x = "datagrid.theme",
      default = list(
        cell = list(
          normal = list(
            showHorizontalBorder = TRUE
          )
        )
      )
    ),
    language = getOption("datagrid.language", default = "en"),
    languageOptions = getOption("datagrid.language.options", default = list()),
    filters = filters,
    rowAttributes = list(),
    updateEditOnClick = NULL,
    validationInput = FALSE,
    dataAsInput = data_as_input,
    dragInput = isTRUE(draggable),
    datepicker_locale = datepicker_locale
  ))

  # create widget
  widget <- createWidget(
    name = "datagrid",
    x = x,
    width = width,
    height = height,
    package = "toastui",
    elementId = elementId,
    preRenderHook = function(widget) {
      widget$x$data_df <- NULL
      widget$x$data <- unname(widget$x$data)
      widget
    },
    sizingPolicy = sizingPolicy(
      defaultWidth = "100%",
      defaultHeight = "auto",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "auto",
      viewer.fill = TRUE,
      viewer.suppress = FALSE,
      viewer.padding = 0,
      knitr.figure = FALSE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = `if`(identical(options$bodyHeight, "auto"), "auto", "600px"),
      browser.fill = TRUE,
      browser.external = TRUE
    )
  )
  if (!is.null(align)) {
    align <- match.arg(align, choices = c("auto", "left", "right", "center"))
    if (identical(align, "auto")) {
      widget <- grid_columns(
        grid = widget,
        align = get_align(data)
      )
    } else {
      widget <- grid_columns(
        grid = widget,
        align = align
      )
    }
  }
  if (identical(colwidths, "guess")) {
    widget <- grid_columns(
      grid = widget,
      minWidth = nchar_cols(
        data = data,
        add_header = isTRUE(sortable) * 10 + isTRUE(filters) * 10,
        min_width = guess_colwidths_opts$min_width,
        max_width = guess_colwidths_opts$max_width,
        mul = guess_colwidths_opts$mul,
        add = guess_colwidths_opts$add
      ),
      whiteSpace = "normal",
      renderer = list(
        styles = list(
          wordBreak = "normal"
        )
      )
    )
  } else if (identical(colwidths, "fit")) {
    widget <- grid_columns(
      grid = widget,
      columns = names(data),
      width = NULL,
      whiteSpace = "normal",
      renderer = list(
        styles = list(
          wordBreak = "normal"
        )
      )
    )
  } else {
    widget <- grid_columns(
      grid = widget,
      columns = names(data),
      width = colwidths
    )
  }
  return(widget)
}


#' @importFrom htmltools tags
datagrid_html <- function(id, style, class, ...) {
  tags$div(
    id = id,
    class = class,
    style = style,
    style = "margin-bottom: 15px;",
    ...,
    tags$div(
      id = paste0(id, "-container")
    )
  )
}


#' Options for guessing columns widths
#'
#' @param min_width Minimal width.
#' @param max_width Maximal width.
#' @param mul Multiplicative constant.
#' @param add Additive constant
#'
#' @return a `list` of options to use in [datagrid()].
#' @export
#'
#' @examples
#' datagrid(rolling_stones_50, colwidths = "guess")
#' datagrid(
#'   rolling_stones_50,
#'   colwidths = "guess",
#'   guess_colwidths_opts= guess_colwidths_options(mul = 2)
#' )
guess_colwidths_options <- function(min_width = 70, max_width = 400, mul = 1, add = 0) {
  list(
    min_width = min_width,
    max_width = max_width,
    mul = mul,
    add = add
  )
}
