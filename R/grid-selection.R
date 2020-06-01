
#' Row selection (in shiny)
#'
#' @param grid A table created with \code{\link{datagrid}}.
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label in header row.
#' @param return Value that will be accessible via \code{input} :
#'  a \code{data.frame} with selected row(s) or just the index of rows.
#' @param width Width of the column.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#'
#' @example examples/ex-grid_row_selection.R
grid_row_selection <- function(grid, 
                               inputId, 
                               label = NULL,
                               return = c("data", "index"),
                               width = NULL) {
  check_grid(grid, "grid_row_selection")
  return <- match.arg(return)
  if (!is.null(grid$x$rowSelection)) {
    stop("grid_row_selection: you can only have one type of selection at the same time.")
  }
  config <- dropNulls(list(
    type = "checkbox",
    header = label,
    width = width
  ))
  if (is.null(grid$x$options$rowHeaders)) {
    grid$x$options$rowHeaders <- list(config)
  } else {
    grid$x$options$rowHeaders <- list(
      grid$x$options$rowHeaders,
      config
    )
  }
  grid$x$rowSelection <- list(
    id = inputId,
    returnValue = return,
    label = label
  )
  return(grid)
}


#' Cell selection (in shiny)
#'
#' @param grid A table created with \code{\link{datagrid}}.
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param selectionUnit The unit of selection on grid.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#'
#' @example examples/ex-grid_cell_selection.R
grid_cell_selection <- function(grid, inputId, selectionUnit = c("cell", "row")) {
  check_grid(grid, "grid_cell_selection")
  selectionUnit <- match.arg(selectionUnit)
  grid$x$options$selectionUnit <- selectionUnit
  grid$x$cellSelection <- list(
    id = inputId,
    returnValue = selectionUnit
  )
  return(grid)
}



#' Click event (in shiny)
#'
#' @param grid A table created with \code{\link{datagrid}}.
#' @param inputId The \code{input} slot that will be used to access the value.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#'
#' @example examples/ex-grid_click.R
grid_click <- function(grid, inputId) {
  check_grid(grid, "grid_click")
  grid$x$clickEvent <- list(
    id = inputId
  )
  return(grid)
}



