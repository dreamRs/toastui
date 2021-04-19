
#' Chart options
#'
#' @param chart A \code{chart} htmlwidget.
#' @param ... Named list of options, options depends on chart's type,
#'  see common options [here](https://github.com/nhn/tui.chart/blob/main/docs/en/common-chart-options.md).
#'
#' @return A \code{chart} htmlwidget.
#' @export
#'
#' @examples
chart_options <- function(chart, ...) {
  chart$x$config$options <- modifyList(
    x = chart$x$config$options, 
    val = list(...)
  )
  chart
}
