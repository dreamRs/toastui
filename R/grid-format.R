
#' Format column content
#'
#' @param grid A table created with \code{\link{datagrid}}.
#' @param column Name of the column to format.
#' @param formatter Either an R function or a JavaScript function wraped in \code{JS}.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#' 
#' @importFrom htmltools resolveDependencies findDependencies
#'
#' @example examples/ex-grid_format.R
grid_format <- function(grid,
                        column,
                        formatter) {
  check_grid(grid, "grid_column_format")
  stopifnot(is.character(column) & length(column) == 1)
  if (is.function(formatter)) {
    data_fmt <- grid$x$data
    formatted <- formatter(data_fmt[[column]])
    if (is_tag(formatted)) {
      dependencies <- resolveDependencies(findDependencies(formatted))
      if (length(dependencies) > 0) {
        grid$dependencies <- c(
          grid$dependencies,
          dependencies
        )
      }
      formatted <- lapply(formatted, as.character)
    }
    grid_columns(
      grid = grid,
      vars = column,
      renderer = list(
        type = htmlwidgets::JS("DatagridFormatRenderer"),
        options = list(
          formatted = unlist(formatted, use.names = FALSE)
        )
      )
    )
  } else {
    grid_columns(
      grid = grid,
      vars = column,
      formatter = formatter
    )
  }
}


