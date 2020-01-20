
#' @title Modify theme options
#'
#' @description Properties to customize grid theme, each argument
#'  is a list of parameters, see full list here :
#'  \url{https://nhn.github.io/tui.grid/latest/Grid#applyTheme}.
#'
#' @param grid A grid created with \code{\link{tuigrid}}.
#' @param row Styles for the table rows.
#' @param cell Styles for the table cells.
#' @param area Styles for the table areas.
#' @param outline Styles for the table outline.
#' @param selection Styles for a selection layer.
#' @param scrollbar Styles for scrollbars.
#' @param frozenBorder Styles for a frozen border.
#' @param ... Additional arguments.
#'
#' @return A \code{tuidgridr} htmlwidget.
#' @export
#'
#' @example examples/ex-theme.R
grid_theme <- function(grid, row = NULL, cell = NULL, area = NULL,
                       outline = NULL, selection = NULL, scrollbar = NULL,
                       frozenBorder = NULL, ...) {
  options <- dropNulls(list(
    row = row, cell = cell, area = area,
    outline = outline, selection = selection, scrollbar = scrollbar,
    frozenBorder = frozenBorder, ...
  ))
  .widget_options2(
    grid, name_opt = "themeOptions",
    l = options, modify_x = TRUE
  )
}








