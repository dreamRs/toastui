
#' Add summary area to grid
#'
#' @param grid A table created with \code{\link{datagrid}}.
#' @param columns Name of column (variable name) for which to add a summary.
#' @param stat Statistic to display: \code{"sum"}, \code{"min"}, \code{"max"} or \code{"avg"}. Can be several values.
#' @param digits Number of digits to display.
#' @param label Label to display next to statistic.
#' @param sep Separator between several statistics.
#' @param position The position of the summary area: \code{"bottom"} or \code{"top"}.
#' @param height The height of the summary area.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @example examples/ex-grid_summary.R
grid_summary <- function(grid,
                         columns,
                         stat = c("sum", "min", "max", "avg"),
                         digits = 0,
                         label = NULL,
                         sep = "<br>",
                         position = c("bottom", "top"), 
                         height = 40
                         ) {
  check_grid(grid, "grid_summary")
  stat <- match.arg(stat, several.ok = TRUE)
  position <- match.arg(position)
  columns <- check_grid_column(grid, columns)
  if (length(columns) > 1) {
    for (i in columns) {
      grid <- grid_summary(
        grid = grid,
        columns = i,
        stat = stat,
        label = label,
        sep = sep,
        position = position,
        height = height
      )
    }
    return(grid)
  }
  if (is.null(label)) {
    label <- paste0(stat, ": ")
  } else {
    stopifnot(length(stat) == length(label))
  }
  if (!is.null(digits)) {
    stat <- paste(stat, sprintf("toFixed(%s)", digits), sep = ".")
  }
  body <- sprintf("'%s' + valueMap.%s", label, stat)
  body <- paste(
    body,
    collapse = sprintf("+ '%s' +", sep)
  )
  fun <- JS("function(valueMap) { ", paste0("return ", body, ";"), " }")
  template <- list(template = fun)
  columnContent <- setNames(list(template), columns)
  if (is.null(grid$x$options$summary$columnContent)) {
    grid$x$options$summary <- list(
      columnContent = columnContent,
      position = position,
      height = height
    )
  } else {
    grid$x$options$summary$columnContent <- c(
      grid$x$options$summary$columnContent,
      columnContent
    )
  }
  return(grid)
}
