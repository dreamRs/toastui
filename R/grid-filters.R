
simple_filters <- function(data) {
  lapply(
    X = data,
    FUN = function(x) {
      if (inherits(x, what = c("character", "factor"))) {
        x <- as.character(x)
        if (length(unique(x)) <= 50) {
          "select"
        } else {
          "text"
        }
      } else if (inherits(x, what = c("Date", "POSIXct"))) {
        list(type = "date", options = list(format = "yyyy-MM-dd"))
      } else if (inherits(x, what = c("numeric", "integer"))) {
        "number"
      } else {
        NULL
      }
    }
  )
}


#' Set filters options
#'
#' @param grid A table created with [datagrid()].
#' @param columns Name(s) of column in the data used in [datagrid()].
#' @param showApplyBtn Apply filters only when button is pressed.
#' @param showClearBtn Reset the filter that has already been applied.
#' @param operator Multi-option filter, the operator used against multiple rules : `"OR"` or `"AND"`.
#' @param format Date format.
#' @param type Type of filter : `"auto"`, `"text"`, `"number"`, `"date"` or `"select"`.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @example examples/ex-grid_filters.R
grid_filters <- function(grid,
                         columns,
                         showApplyBtn = NULL,
                         showClearBtn = NULL,
                         operator = NULL,
                         format = "yyyy-MM-dd",
                         type = "auto") {
  check_grid(grid)
  columns <- check_grid_column(grid, columns)
  type <- match.arg(type, several.ok = TRUE, choices = c("auto", "text", "date", "number", "select"))
  n_col <- length(columns)
  if (!is.null(showApplyBtn))
    showApplyBtn <- rep_len(x = showApplyBtn, length.out = n_col)
  if (!is.null(showClearBtn))
    showClearBtn <- rep_len(x = showClearBtn, length.out = n_col)
  if (!is.null(operator))
    operator <- rep_len(x = operator, length.out = n_col)
  if (!is.null(type))
    type <- rep_len(x = type, length.out = n_col)
  filters_type <- simple_filters(grid$x$data_df)
  for (column in columns) {
    i <- which(grid$x$colnames == column)
    j <- which(columns == column)
    if (identical(type[j], "auto")) {
      type[j] <- filters_type[[column]]
    }
    filtering <- dropNulls(list(
      type = type[j],
      options = if (type[j] == "date") list(format = format),
      showApplyBtn = showApplyBtn[j],
      showClearBtn = showClearBtn[j],
      operator = operator[j]
    ))
    if (length(filtering) > 1) {
      grid$x$options$columns[[i]]$filter <- filtering
    } else {
      grid$x$options$columns[[i]]$filter <- filtering$type
    }
  }
  return(grid)
}



