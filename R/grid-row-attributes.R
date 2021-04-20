
#' Merge rows
#'
#' @param grid A grid created with \code{\link{datagrid}}.
#' @param vars Variable(s) in which merge consecutives rows.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @importFrom stats setNames
#'
#' @example examples/ex-grid_row_merge.R
grid_row_merge <- function(grid, vars) {
  check_grid(grid, "grid_row_merge")
  if (any(!vars %in% grid$x$colnames))
    stop("Invalid var(s) name supplied.")
  for (var in vars) {
    vec <- grid$x$data_df[[var]]
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
                var
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
