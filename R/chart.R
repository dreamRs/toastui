
chart <- function(data,
                  mapping = NULL, 
                  type = c("column", "bar", "area", "line",
                           "scatter", "bubble", "boxPlot", 
                           "heatmap", "treemap", "radialBar", "pie"),
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