
#' Header options
#'
#' @param grid A table created with \code{\link{tuigrid}}.
#' @param complexColumns \code{list}. This options creates new parent
#'  headers of the multiple columns which includes the headers of
#'  specified columns, and sets up the hierarchy.
#' @param align Horizontal alignment of the header content.
#'  Available values are 'left', 'center', 'right'.
#' @param valign Vertical alignment of the row header content.
#'  Available values are 'top', 'middle', 'bottom'.
#' @param height Numeric. The height of the header area.
#'
#' @return A \code{tuidgridr} htmlwidget.
#' @export
#'
#' @example examples/ex-header.R
grid_header <- function(grid, complexColumns = NULL, align = NULL, valign = NULL, height = NULL) {
  .widget_options2(
    grid, name_opt = "header",
    l = dropNulls(list(
      complexColumns = complexColumns,
      align = align, valign = valign,
      height = height
    ))
  )
}

