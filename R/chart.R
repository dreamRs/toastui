
#' Interactive charts
#'
#' @param data A `data.frame` if used with `mapping` otherwise a configuration `list`.
#' @param mapping Default list of aesthetic mappings to use for chart if `data` is a `data.frame`.
#' @param type Type of chart.
#' @param ... Optional arguments (currently not used).
#' @param options A `list` of options for the chart.
#' @param height,width Height and width for the chart.
#' @param elementId An optional id.
#'
#' @return A `chart` htmlwidget.
#'
#' @seealso [chartOutput()] / [renderChart()] for usage in Shiny applications.
#'
#' @export
#'
#' @importFrom rlang has_name as_label
#' @importFrom htmlwidgets createWidget sizingPolicy
#'
#' @example examples/ex-chart.R
chart <- function(data = list(),
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
  if (length(data) < 1) {
    data <- list(categories = list(), series = list())
    mapping <- NULL
  }
  if (!is.list(options))
    stop("options must be a list")
  if (is.null(height))
    options$chart$height <- "auto"
  if (is.null(width))
    options$chart$width <- "auto"
  if (identical(type, "gauge"))
    mapping <- list()
  if (!is.null(mapping)) {
    data <- construct_serie(data, mapping, type)
  }
  if (has_name(mapping, "colourValue") & is.null(options$series$useColorValue)) {
    options$series$useColorValue <- TRUE
  }
  if (is.null(options$xAxis$title) & !is.null(mapping$x)) {
    options$xAxis$title <- as_label(mapping$x)
  }
  if (is.null(options$yAxis$title) & !is.null(mapping$y)) {
    options$yAxis$title <- as_label(mapping$y)
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


