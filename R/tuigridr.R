#' @title Interactive table with tui-grid
#'
#' @description Create interactive table : sortable, filterable,
#'  editable with the JavaScript library \href{https://ui.toast.com/tui-grid/}{tui-grid}.
#'
#' @param data A \code{data.frame} or something convertible en \code{data.frame}.
#'
#' @importFrom htmlwidgets createWidget
#'
#' @export
tuigrid <- function(data, width = NULL, height = NULL, elementId = NULL) {

  data <- as.data.frame(data)

  x <- list(
    nrow = nrow(data),
    ncol = ncol(data),
    data = jsonlite::toJSON(x = unname(data), matrix = "rowmajor"),
    colnames = names(data),
    options = list(
      columns = lapply(
        X = names(data),
        FUN = function(x) {
          list(
            header = x,
            name = x
          )
        }
      ),
      # data = jsonlite::toJSON(x = data, dataframe = "rows"),
      # data = jsonlite::toJSON(x = unname(data), matrix = "rowmajor"),
      pageOptions = list(
        useClient = TRUE,
        perPage = 10
      ),
      scrollY = FALSE
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = "tuigridr",
    x,
    width = width,
    height = height,
    package = "tuigridr",
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = "100%",
      defaultHeight = "100%",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "100%",
      viewer.fill = FALSE,
      viewer.suppress = FALSE,
      knitr.figure = FALSE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = "600px",
      browser.fill = FALSE,
      browser.external = TRUE
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
tuigridOutput <- function(outputId, width = "100%", height = "400px"){
  htmlwidgets::shinyWidgetOutput(outputId, "tuigridr", width, height, package = "tuigridr")
}

#' @rdname tuigridr-shiny
#' @export
renderTuigrid <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, tuigridrOutput, env, quoted = TRUE)
}
