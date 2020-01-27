#' @title Interactive table with tui-grid
#'
#' @description Create interactive table : sortable, filterable,
#'  editable with the JavaScript library \href{https://ui.toast.com/tui-grid/}{tui-grid}.
#'
#' @param data A \code{data.frame} or something convertible en \code{data.frame}.
#' @param ... Arguments passed to the \code{Grid} JavaScript method : \url{https://nhn.github.io/tui.grid/latest/Grid}.
#' @param sortable Logical, allow to sort columns.
#' @param pagination Number of rows per page to display, default to \code{NULL} (no pagination).
#' @param filters Logical, allow to filter columns.
#' @param theme Set styles for the entire table.
#' @param width,height Width and height of the table in a CSS unit or a numeric.
#' @param elementId Use an explicit element ID for the widget.
#'
#' @importFrom htmlwidgets createWidget
#' @importFrom utils modifyList
#'
#' @export
tuigrid <- function(data, ...,
                    sortable = TRUE, pagination = NULL,
                    filters = FALSE,
                    theme = c("clean", "striped", "default"),
                    width = NULL, height = NULL,
                    elementId = NULL) {

  data <- as.data.frame(data)
  theme <- match.arg(theme)

  filters <- simple_filters(data)

  options <- list(
    columns = lapply(
      X = names(data),
      FUN = function(x) {
        dropNulls(list(
          header = x,
          name = x,
          sortable = isTRUE(sortable),
          filter = if (isTRUE(filters)) filters[[x]]
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

  x <- list(
    data_df = data,
    nrow = nrow(data),
    ncol = ncol(data),
    data = unname(data),
    colnames = names(data),
    options = options,
    theme = theme,
    themeOptions = list(),
    filters = filters
  )

  # create widget
  htmlwidgets::createWidget(
    name = "tuigridr",
    x,
    width = width,
    height = height,
    package = "tuigridr",
    elementId = elementId,
    preRenderHook = function(widget) {
      widget$x$data_df <- NULL
      widget
    },
    sizingPolicy = htmlwidgets::sizingPolicy(
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
}

tuigridr_html <- function(id, style, class, ...) {
  htmltools::tags$div(
    id = id, class = class, style = style,
    htmltools::tags$div(
      id = paste0(id, "-container"), class = class, style = style, ...
    )
  )
}

#' Shiny bindings for tuigridr
#'
#' Output and render functions for using tuigridr within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a tuigridr
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name tuigridr-shiny
#'
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#'
#' @export
tuigridOutput <- function(outputId, width = "100%", height = "auto"){
  htmlwidgets::shinyWidgetOutput(outputId, "tuigridr", width, height, package = "tuigridr", inline = FALSE)
}

#' @rdname tuigridr-shiny
#' @export
renderTuigrid <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, tuigridOutput, env, quoted = TRUE)
}
