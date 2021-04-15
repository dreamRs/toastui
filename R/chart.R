
#' Interactive charts
#'
#' @param data 
#' @param mapping 
#' @param type 
#' @param ... 
#' @param options 
#' @param height 
#' @param width 
#' @param elementId 
#'
#' @return A \code{chart} htmlwidget.
#' @export
#'
#' @example examples/ex-chart.R
chart <- function(data,
                  mapping = NULL, 
                  type = c("column", "bar", "area", "line",
                           "scatter", "bubble", "boxPlot", 
                           "heatmap", "treemap",
                           "radialBar", "pie", "gauge"),
                  ...,
                  options = list(),
                  height = NULL, 
                  width = NULL, 
                  elementId = NULL) {
  type <- match.arg(type)
  if (!is.list(options))
    stop("options must be a list")
  if (is.null(height))
    options$chart$height <- "auto"
  if (is.null(width))
    options$chart$width <- "auto"
  if (!is.null(mapping)) {
    data <- construct_serie(data, mapping, type)
  }
  createWidget(
    name = "chart",
    x = list(
      config = list(
        type = paste0(type, "Chart"),
        data = data,
        options = options
      )
    ),
    width = width,
    height = height,
    package = "toastui",
    elementId = elementId,
    sizingPolicy = sizingPolicy(
      defaultWidth = "100%",
      defaultHeight = "100%",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "100%",
      knitr.figure = FALSE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = "350px",
      browser.fill = TRUE,
      viewer.suppress = FALSE,
      browser.external = TRUE,
      padding = 0
    )
  )
}



#' Shiny bindings for \code{chart}
#'
#' Output and render functions for using \code{\link{chart}} within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a chart.
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name chart-shiny
#'
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#'
#' @export
#' 
#' @example examples/shiny-chart.R
chartOutput <- function(outputId, width = "100%", height = "400px"){
  htmlwidgets::shinyWidgetOutput(outputId, "chart", width, height, package = "toastui", inline = FALSE)
}

#' @rdname chart-shiny
#' @export
renderChart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, datagridOutput, env, quoted = TRUE)
}

