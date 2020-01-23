
#' Set grid row style
#'
#' @param grid A grid created with \code{\link{tuigrid}}.
#' @param expr An expression giving positionof row
#' @param background Background color.
#' @param color Text color.
#' @param ... CSS properties.
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
    stop("grid_row_style: grid must be a tuigridr object")
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
  if (is.null(grid$x$rowClass)) {
    grid$x$rowClass <- list(
      list(rowKey = rowKey, class = class, styles = styles)
    )
  } else {
    grid$x$rowClass <- c(
      grid$x$rowClass,
      list(list(rowKey = rowKey, class = class, styles = styles))
    )
  }
  return(grid)
}





