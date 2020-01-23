
#' Row selection (in shiny)
#'
#' @param grid A table created with \code{\link{tuigrid}}.
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label in header row.
#' @param type Type of selection : \code{"checkbox"} (multiple) or \code{"radio"} (single).
#' @param return Value that will be accessible via \code{input} :
#'  a \code{data.frame} with selected row(s) or just the index of rows.
#' @param width Width of the column.
#'
#' @return A \code{tuidgridr} htmlwidget.
#' @export
#'
#' @example examples/ex-grid_row_selection.R
grid_row_selection <- function(grid, inputId, label = NULL,
                               type = c("checkbox", "radio"),
                               return = c("data", "index"),
                               width = NULL) {
  type <- match.arg(type)
  return <- match.arg(return)
  if(!inherits(grid, "tuigridr")){
    stop("grid must be a tuigridr object.")
  }
  config <- dropNulls(list(
    type = type,
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
  grid$x$rowSelectionId <- inputId
  grid$x$rowSelectionValue <- return
  return(grid)
}




