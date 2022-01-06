
#' Format column content
#'
#' @param grid A table created with [datagrid()].
#' @param column Name of the column to format.
#' @param formatter Either an R function or a JavaScript function wrapped in [JS()].
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @importFrom htmltools findDependencies
#' @importFrom htmlwidgets JS
#'
#' @example examples/ex-grid_format.R
grid_format <- function(grid,
                        column,
                        formatter) {
  check_grid(grid, "grid_format")
  stopifnot(is.character(column) & length(column) == 1)
  if (is.function(formatter)) {
    data_fmt <- grid$x$data
    formatted <- formatter(data_fmt[[column]])
    if (is_tag(formatted)) {
      dependencies <- findDependencies(formatted)
      grid <- add_dependencies(grid, dependencies)
      formatted <- lapply(formatted, as.character)
    }
    grid_columns(
      grid = grid,
      columns = column,
      renderer = list(
        type = JS("datagrid.renderer.format"),
        options = list(
          formatted = unlist(formatted, use.names = FALSE)
        )
      )
    )
  } else {
    grid_columns(
      grid = grid,
      columns = column,
      formatter = formatter
    )
  }
}


