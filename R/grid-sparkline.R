
#' Title
#'
#' @param grid
#' @param column
#' @param renderer
#'
#' @return
#' @export
#'
#' @importFrom htmltools as.tags findDependencies validateCssUnit
#'
#' @examples
grid_sparkline <- function(grid,
                           column,
                           renderer,
                           height = "40px",
                           styles = NULL) {
  check_grid(grid, "grid_sparkline")
  height <- validateCssUnit(height)
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
    vars = column,
    renderer = list(
      type = htmlwidgets::JS("DatagridHTMLRenderer"),
      options = list(
        rendered = unlist(rendered, use.names = FALSE),
        padding = "4px 5px",
        styles = styles
      )
    )
  )
}

#' @importFrom htmltools resolveDependencies
add_dependencies <- function(widget, dependencies) {
  widget$dependencies <- htmltools::resolveDependencies(
    c(widget$dependencies, dependencies)
  )
  widget
}
