
#' Row selection (in shiny)
#'
#' @param grid A table created with \code{\link{tuigrid}}.
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label in header row.
#' @param return Value that will be accessible via \code{input} :
#'  a \code{data.frame} with selected row(s) or just the index of rows.
#' @param width Width of the column.
#'
#' @return A \code{tuidgridr} htmlwidget.
#' @export
#'
#' @example examples/ex-grid_row_selection.R
grid_row_selection <- function(grid, inputId, label = NULL,
                               return = c("data", "index"),
                               width = NULL) {
  return <- match.arg(return)
  if(!inherits(grid, "tuigridr")){
    stop("grid must be an object built with tuigridr().")
  }
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




