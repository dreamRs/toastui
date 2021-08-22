
#' @title Header options
#'
#' @description Properties to modify grid's header, like creating grouped header.
#'
#' @param grid A table created with [datagrid()].
#' @param complexColumns \code{list}. This options creates new parent
#'  headers of the multiple columns which includes the headers of
#'  specified columns, and sets up the hierarchy.
#' @param columns \code{list}. Options for column's header.
#' @param align Horizontal alignment of the header content.
#'  Available values are 'left', 'center', 'right'.
#' @param valign Vertical alignment of the row header content.
#'  Available values are 'top', 'middle', 'bottom'.
#' @param height Numeric. The height of the header area.
#' @param ... Named arguments to merge columns under a common header,
#'  e.g. \code{newcol = c("col1", "col2")}.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @name grid-header
#'
#' @example examples/ex-grid_header.R
grid_header <- function(grid, complexColumns = NULL, columns = NULL, align = NULL, valign = NULL, height = NULL) {
  check_grid(grid, "grid_header")
  .widget_options2(
    grid, name_opt = "header",
    l = dropNulls(list(
      complexColumns = complexColumns,
      columns = columns,
      align = align, valign = valign,
      height = height
    ))
  )
}

#' @export
#'
#' @rdname grid-header
grid_complex_header <- function(grid, ..., height = 80) {
  check_grid(grid, "grid_complex_header")
  args <- list(...)
  if (!all(nzchar(names(args))))
    stop("grid_complex_header: all arguments in '...' must be named!", call. = FALSE)
  grid_header(
    grid = grid,
    complexColumns = lapply(
      X = seq_along(args),
      FUN = function(i) {
        list(
          header = names(args)[i],
          name = names(args)[i],
          childNames = args[[i]]
        )
      }
    ),
    height = height
  )
}










