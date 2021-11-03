
#' @title Render HTMLwidgets in Grid
#'
#' @description Create small charts in a column.
#'
#' @param grid A grid created with [datagrid()].
#' @param column Column data are stored and where to render widgets.
#' @param renderer A \code{function} that will create an HTMLwidget.
#' @param height Height of the row (applies to all table).
#' @param styles A \code{list} of CSS parameters to apply to the cells where widgets are rendered.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @importFrom htmltools as.tags findDependencies validateCssUnit
#'
#' @example examples/ex-grid_sparkline.R
grid_sparkline <- function(grid,
                           column,
                           renderer,
                           height = "40px",
                           styles = NULL) {
  check_grid(grid, "grid_sparkline")
  height <- validateCssUnit(height)
  if (!is.function(renderer))
    stop("grid_sparkline: `renderer` must be a function", call. = FALSE)
  if (!is.character(column) | length(column) != 1)
    stop("grid_sparkline: `column` must be a character of length one.", call. = FALSE)
  rendered <- lapply(
    X = grid$x$data_df[[column]],
    FUN = renderer
  )
  if (is_htmlwidget(rendered)) {
    grid <- add_dependencies(grid, findDependencies(rendered))
    rendered <- lapply(
      X = rendered,
      FUN = function(x) {
        x$height <- height
        x <- as.tags(x)
        as.character(x)
      }
    )
  }
  grid$x$options$rowHeight <- height
  if (!is.null(styles)) {
    if (is.list(styles)) {
      styles <- make_styles(styles, NULL)
    }
    if (!is.character(styles))
      stop("`styles` must be a list or a string", call. = FALSE)
  }
  grid_columns(
    grid = grid,
    columns = column,
    className = "datagrid-sparkline-cell",
    renderer = list(
      type = htmlwidgets::JS("datagrid.renderer.htmlwidgets"),
      options = list(
        rendered = unlist(rendered, use.names = FALSE),
        styles = styles
      )
    )
  )
}
