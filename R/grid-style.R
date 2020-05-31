
#' Set grid row style
#'
#' @param grid A grid created with \code{\link{tuigrid}}.
#' @param expr An expression giving position of row. Must return a logical vector.
#' @param background Background color.
#' @param color Text color.
#' @param ... Other CSS properties.
#' @param class CSS class to apply to the row.
#'
#' @return A \code{tuidgridr} htmlwidget.
#' @export
#'
#' @importFrom rlang enquo eval_tidy
#'
#' @example examples/ex-grid_row_style.R
grid_row_style <- function(grid, expr, background = NULL, color = NULL, ..., class = NULL) {
  expr <- enquo(expr)
  if(!inherits(grid, "tuigridr")){
    stop("grid must be an object built with tuigridr().")
  }
  rowKey <- eval_tidy(expr, data = grid$x$data_df)
  if (!is.logical(rowKey))
    stop("grid_row_style: expr must evaluate to a logical vector!")
  rowKey <- which(rowKey) - 1
  if (is.null(class)) {
    class <- paste0("tuigridr-row-", sample.int(1e12, 1))
  }
  styles <- dropNulls(list(
    background = background,
    color = color, ...
  ))
  styles <- sprintf("%s:%s", names(styles), unlist(styles, use.names = FALSE))
  styles <- paste(styles, collapse = ";")
  styles <- sprintf(".%s{%s}", class, styles)
  grid$x$rowClass <- append(
    x = grid$x$rowClass,
    values = list(list(
      rowKey = rowKey,
      class = class,
      styles = styles
    ))
  )
  return(grid)
}





#' Set grid cell style
#'
#' @param grid A grid created with \code{\link{tuigrid}}.
#' @param expr An expression giving position of row. Must return a logical vector.
#' @param column Name of column (variable name) to identify cells to style.
#' @param background Background color.
#' @param color Text color.
#' @param ... Other CSS properties.
#' @param class CSS class to apply to the row.
#'
#' @return A \code{tuidgridr} htmlwidget.
#' @export
#'
#' @importFrom rlang enquo eval_tidy
#'
#' @example examples/ex-grid_cell_style.R
grid_cell_style <- function(grid, expr, column, background = NULL, color = NULL, ..., class = NULL) {
  if (!is.character(column) | length(column) != 1)
    stop("grid_cell_style: column must be a character of length one.")
  expr <- enquo(expr)
  if(!inherits(grid, "tuigridr")){
    stop("grid_cell_style: grid must be a tuigridr object.")
  }
  rowKey <- eval_tidy(expr, data = grid$x$data_df)
  if (!is.logical(rowKey))
    stop("grid_cell_style: expr must evaluate to a logical vector!")
  rowKey <- which(rowKey) - 1
  if (is.null(class)) {
    class <- paste0("tuigridr-cell-", sample.int(1e12, 1))
  }
  styles <- dropNulls(list(
    background = background,
    color = color, ...
  ))
  styles <- sprintf("%s:%s", names(styles), unlist(styles, use.names = FALSE))
  styles <- paste(styles, collapse = ";")
  styles <- sprintf(".%s{%s}", class, styles)
  grid$x$cellClass <- append(
    x = grid$x$cellClass,
    values = list(list(
      rowKey = rowKey,
      class = class,
      column = column,
      styles = styles
    ))
  )
  return(grid)
}

