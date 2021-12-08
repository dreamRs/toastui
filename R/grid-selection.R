
#' Row selection (in shiny)
#'
#' @param grid A table created with [datagrid()].
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param type Type of selection: \code{"checkbox"} (multiple rows) or \code{"radio"} (unique row).
#' @param return Value that will be accessible via \code{input} :
#'  a \code{data.frame} with selected row(s) or just the index of selected row(s).
#' @param width Width of the column.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @example examples/ex-grid_selection_row.R
grid_selection_row <- function(grid,
                               inputId,
                               type = c("checkbox", "radio"),
                               return = c("data", "index"),
                               width = NULL) {
  check_grid(grid, "grid_selection_row")
  return <- match.arg(return)
  type <- match.arg(type)
  if (!is.null(grid$x$rowSelection)) {
    stop("grid_selection_row: you can only have one type of selection at the same time.")
  }
  if (identical(type, "checkbox")) {
    config <- dropNulls(list(
      type = "checkbox",
      header = NULL,
      width = width
    ))
  } else {
    config <- dropNulls(list(
      type = 'checkbox',
      header = "<div></div>",
      renderer = list(
        type = htmlwidgets::JS("datagrid.renderer.radio")
      ),
      width = width
    ))
  }
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
    returnValue = return
  )
  return(grid)
}


#' Cell selection (in shiny)
#'
#' @param grid A table created with [datagrid()].
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param selectionUnit The unit of selection on grid.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @example examples/ex-grid_selection_cell.R
grid_selection_cell <- function(grid, inputId, selectionUnit = c("cell", "row")) {
  check_grid(grid, "grid_selection_cell")
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
#' @param grid A table created with [datagrid()].
#' @param inputId The \code{input} slot that will be used to access the value.
#'
#' @return A `datagrid` htmlwidget.
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



