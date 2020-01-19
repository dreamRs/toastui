
#' Header options
#'
#' @param tg A table created with \code{\link{tuigrid}}.
#' @param complexColumns \code{list}. This options creates new parent
#'  headers of the multiple columns which includes the headers of
#'  specified columns, and sets up the hierarchy.
#' @param align Horizontal alignment of the header content.
#'  Available values are 'left', 'center', 'right'.
#' @param valign Vertical alignment of the row header content.
#'  Available values are 'top', 'middle', 'bottom'.
#' @param height The height of the header area.
#'
#' @return A \code{tuidgridr} htmlwidget.
#' @export
#'
#' @example examples/ex-header.R
tg_header <- function(tg, complexColumns = NULL, align = NULL, valign = NULL, height = NULL) {
  .widget_options2(
    tg, name_opt = "header",
    l = dropNulls(list(
      complexColumns = complexColumns,
      align = align, valign = valign,
      height = height
    ))
  )
}

