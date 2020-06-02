
#' @title Grid validation options for columns
#' 
#' @description Validate columns' content with rules, useful when content is editable.
#'
#' @param grid A table created with \code{\link{datagrid}}.
#' @param column Column for which to activate the content validation.
#' @param required If set to \code{TRUE}, the data of the column will be checked to be not empty.
#' @param type Type of data, can be \code{"string"} or \code{"number"}.
#' @param min For numeric values, the minimum acceptable value.
#' @param max For numeric values, the maximum acceptable value.
#' @param regExp A regular expression to validate content.
#' @param jsfun A \code{JS} function to validate content.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#' 
#' @importFrom htmlwidgets JS
#'
#' @example examples/ex-grid_validation.R
grid_validation <- function(grid,
                            column,
                            required = NULL,
                            type = NULL,
                            min = NULL,
                            max = NULL,
                            regExp = NULL,
                            jsfun = NULL) {
  check_grid(grid, "grid_validation")
  if (!is.null(regExp)) {
    regExp <- JS(paste0("/", regExp, "/"))
  }
  grid_columns(
    grid = grid,
    vars = column,
    validation = dropNulls(list(
      required = required,
      dataType = type,
      min = min,
      max = max,
      regExp = regExp,
      validatorFn = jsfun
    ))
  )
}
