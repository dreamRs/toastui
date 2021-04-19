
#' Chart options
#'
#' @param .chart A \code{chart} htmlwidget.
#' @param ... Named list of options, options depends on chart's type,
#'  see common options [here](https://github.com/nhn/tui.chart/blob/main/docs/en/common-chart-options.md).
#'
#' @return A \code{chart} htmlwidget.
#' @export
#' 
#' @importFrom utils modifyList
#'
#' @examples
#' chart(mtcars, caes(x = mpg, y = wt), type = "scatter") %>% 
#'   chart_options(
#'     chart = list(title = "A scatter chart")
#'   )
chart_options <- function(.chart, ...) {
  .chart$x$config$options <- modifyList(
    x = .chart$x$config$options, 
    val = list(...)
  )
  .chart
}
