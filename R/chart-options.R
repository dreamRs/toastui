
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
  check_chart(.chart)
  .chart$x$config$options <- modifyList(
    x = .chart$x$config$options, 
    val = list(...)
  )
  .chart
}


#' Chart labs
#'
#' @param .chart A \code{chart} htmlwidget.
#' @param title Text for main title.
#' @param x Text for x-axis title.
#' @param y Text for y-axis title.
#'
#' @return A \code{chart} htmlwidget.
#' @export
#'
#' @examples
#' chart(mtcars, caes(x = mpg, y = wt), type = "scatter") %>%
#'   chart_labs(
#'     title = "Main title",
#'     x = "X axis",
#'     y = "Y axis"
#'   )
chart_labs <- function(.chart, title = NULL, x = NULL, y = NULL) {
  check_chart(.chart)
  if (!is.null(title)) {
    .chart$x$config$options$chart$title <- list(
      text = title
    )
  }
  if (!is.null(x)) {
    .chart$x$config$options$xAxis$title <- list(
      text = x
    )
  }
  if (!is.null(y)) {
    .chart$x$config$options$yAxis$title <- list(
      text = y
    )
  }
  .chart
}