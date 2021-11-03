
#' Merge rows
#'
#' @param grid A grid created with [datagrid()].
#' @param columns column(s) in which merge consecutive rows.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @importFrom stats setNames
#'
#' @example examples/ex-grid_row_merge.R
grid_row_merge <- function(grid, columns) {
  check_grid(grid)
  columns <- check_grid_column(grid, columns)
  for (column in columns) {
    vec <- grid$x$data_df[[column]]
    lengths <- rle(as.character(vec))$lengths
    starts <- cumsum(c(1, lengths))
    starts <- starts[-length(starts)]
    rowspan <- lapply(
      X = seq_along(vec),
      FUN = function(i) {
        if (i %in% starts) {
          len <- lengths[which(starts == i)]
          if (len > 1) {
            list(
              rowSpan = setNames(
                list(len),
                column
              )
            )
          } else {
            list()
          }
        } else {
          list()
        }
      }
    )
    if (length(grid$x$rowAttributes) < 1) {
      grid$x$rowAttributes <- rowspan
    } else {
      for (j in seq_along(grid$x$rowAttributes)) {
        grid$x$rowAttributes[[j]] <- modifyList(
          x = grid$x$rowAttributes[[j]],
          val = rowspan[[j]]
        )
      }
    }
  }
  return(grid)
}
