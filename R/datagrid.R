#' @title Interactive tables with tui-grid
#'
#' @description Create interactive tables : sortable, filterable,
#'  editable with the JavaScript library \href{https://ui.toast.com/tui-grid/}{tui-grid}.
#'
#' @param data A \code{data.frame} or something convertible in \code{data.frame}.
#' @param ... Arguments passed to the \code{Grid} JavaScript method : \url{https://nhn.github.io/tui.grid/latest/Grid}.
#' @param sortable Logical, allow to sort columns.
#' @param pagination Number of rows per page to display, default to \code{NULL} (no pagination).
#' @param filters Logical, allow to filter columns.
#' @param cols_width Width for the columns, can be \code{"auto"} (width is determined by column's content)
#'  or a single or numeric vector to set the width in pixel. Use \code{NULL} to disable and have equal width columns.
#' @param theme Set styles for the entire table.
#' @param width,height Width and height of the table in a CSS unit or a numeric.
#' @param elementId Use an explicit element ID for the widget.
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#' @importFrom utils modifyList
#'
#' @export
#' 
#' @return A \code{datagrid} htmlwidget.
#' 
#' @example examples/ex-datagrid.R
datagrid <- function(data, ...,
                     sortable = TRUE,
                     pagination = NULL,
                     filters = FALSE,
                     cols_width = "auto",
                     theme = c("clean", "striped", "default"),
                     width = NULL,
                     height = NULL,
                     elementId = NULL) {

  data <- as.data.frame(data)
  theme <- match.arg(theme)

  filters_type <- simple_filters(data)

  options <- list(
    columns = lapply(
      X = names(data),
      FUN = function(x) {
        dropNulls(list(
          header = x,
          name = x,
          sortable = isTRUE(sortable),
          filter = if (isTRUE(filters)) filters_type[[x]]
        ))
      }
    ),
    bodyHeight = "fitToParent"
  )

  options <- modifyList(x = options, val = list(...), keep.null = FALSE)

  if (!is.null(pagination)) {
    options$pageOptions <- list(
      perPage = pagination,
      useClient = TRUE
    )
    options$bodyHeight <- "auto"
  }

  if (is.null(options$rowHeight))
    options$rowHeight <- "auto"

  x <- list(
    data_df = data,
    nrow = nrow(data),
    ncol = ncol(data),
    data = unname(data),
    colnames = names(data),
    options = options,
    theme = theme,
    themeOptions = list(),
    filters = filters,
    rowAttributes = list()
  )

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
      widget
    },
    sizingPolicy = sizingPolicy(
      defaultWidth = "100%",
      defaultHeight = "auto",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "auto",
      viewer.fill = TRUE,
      viewer.suppress = FALSE,
      knitr.figure = FALSE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = "600px",
      browser.fill = TRUE,
      browser.external = TRUE
    )
  )
  if (identical(cols_width, "auto")) {
    widget <- grid_columns(
      grid = widget,
      minWidth = nchar_cols(
        data = data,
        add_header = isTRUE(sortable) * 10 + isTRUE(filters) * 10
      ),
      whiteSpace = "pre-line"
    )
  } else if (is.numeric(cols_width)) {
    widget <- grid_columns(
      grid = widget,
      width = cols_width
    )
  }
  return(widget)
}


#' @importFrom htmltools tags
datagrid_html <- function(id, style, class, ...) {
  tags$div(
    id = id, class = class, style = style,
    tags$div(
      id = paste0(id, "-container"), class = class, style = style, ...
    )
  )
}

#' Shiny bindings for \code{datagrid}
#'
#' Output and render functions for using \code{\link{datagrid}} within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a datagrid.
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name datagrid-shiny
#'
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#'
#' @export
datagridOutput <- function(outputId, width = "100%", height = "400px"){
  htmlwidgets::shinyWidgetOutput(outputId, "datagrid", width, height, package = "toastui", inline = FALSE)
}

#' @rdname datagrid-shiny
#' @export
renderDatagrid <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, datagridOutput, env, quoted = TRUE)
}
