


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
        "date"
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
#' @param grid A table created with \code{\link{tuigrid}}.
#' @param vars Name(s) of column in the data used in \code{\link{tuigrid}}.
#' @param showApplyBtn Apply filters only when button is pressed.
#' @param showClearBtn Reset the filter that has already been applied.
#' @param operator Multi-option filter, the operator used against multiple rules : \code{"OR"} or \code{"AND"}.
#' @param format Date format.
#' @param type Type of filter : \code{"auto"}, \code{"text"}, \code{"number"}, \code{"date"} or \code{"select"}.
#'
#' @return A \code{tuidgridr} htmlwidget.
#' @export
#'
#' @example examples/ex-filters.R
grid_filters <- function(grid, vars,
                         showApplyBtn = NULL,
                         showClearBtn = NULL,
                         operator = NULL,
                         format = "yyyy-MM-dd",
                         type = "auto") {
  if(!inherits(grid, "tuigridr")){
    stop("grid must be an object built with tuigridr().")
  }
  var_diff <- setdiff(vars, grid$x$colnames)
  if (length(var_diff) > 0) {
    stop("Variable(s) ", paste(var_diff, collapse = ", "),
         " are not valid columns in data passed to tuigridr()")
  }
  type <- match.arg(type, several.ok = TRUE, choices = c("auto", "text", "date", "number", "select"))
  l_var <- length(vars)
  if (!is.null(showApplyBtn))
    showApplyBtn <- rep_len(x = showApplyBtn, length.out = l_var)
  if (!is.null(showClearBtn))
    showClearBtn <- rep_len(x = showClearBtn, length.out = l_var)
  if (!is.null(operator))
    operator <- rep_len(x = operator, length.out = l_var)
  if (!is.null(type))
    type <- rep_len(x = type, length.out = l_var)
  for (variable in vars) {
    i <- which(grid$x$colnames == variable)
    j <- which(vars == variable)
    if (identical(type[j], "auto")) {
      type[j] <- grid$x$filters[[variable]]
    }
    grid$x$options$columns[[i]]$filter <- dropNulls(list(
      type = type[j],
      format = if (type[j] == "date") format,
      showApplyBtn = showApplyBtn[j],
      showClearBtn = showClearBtn[j],
      operator = operator[j]
    ))
  }
  return(grid)
}



