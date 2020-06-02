
#' Grid editor options
#'
#' @param grid A table created with \code{\link{datagrid}}.
#' @param editingEvent If set to \code{"click"}, editable cell in
#'  the view-mode will be changed to edit-mode by a single click.
#' @param updateOnClick Use an \code{actionButton} inputId to send
#'  edited data to the server only on click.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#'
#' @examples
grid_editor_opts <- function(grid,
                             editingEvent = c("dblclick", "click"),
                             updateOnClick = NULL) {
  check_grid(grid, "grid_editor_opts")
  grid$x$options$editingEvent <- match.arg(editingEvent)
  grid$x$updateEditOnClick <- updateOnClick
  return(grid)
}


#' @title Grid editor for columns
#' 
#' @description Allow to edit content of columns with different inputs,
#'  then retrieve value server-side in shiny application with \code{input$<outputId>_data}.
#'
#' @param grid A table created with \code{\link{datagrid}}.
#' @param column Column for which to activate the editable content.
#' @param type Type of editor: \code{"text"}, \code{"checkbox"},
#'  \code{"select"}, \code{"radio"} or \code{"password"}.
#' @param choices Vector of choices, required for \code{"checkbox"},
#'  \code{"select"} and \code{"radio"} type.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#' 
#' @seealso \code{\link{grid_editor_date}} for a date picker.
#'
#' @example examples/ex-grid_editor.R
grid_editor <- function(grid,
                        column,
                        type = c("text", "checkbox", "select", "radio", "password"),
                        choices = NULL) {
  check_grid(grid, "grid_editor")
  type <- match.arg(type)
  if (type %in% c("checkbox", "select", "radio") & is.null(choices))
    stop("grid_editor: choices must be specified for checkbox, select and radio types", call. = FALSE)
  if (type %in% c("text", "password")) {
    grid_columns(
      grid = grid,
      vars = column,
      editor = list(
        type = type
      )
    )
  } else if (type %in% c("checkbox", "select", "radio")) {
    grid_columns(
      grid = grid,
      vars = column,
      editor = list(
        type = type,
        options = list(
          listItems = lapply(
            X = choices,
            FUN = function(x) {
              list(text = x, value = x)
            }
          )
        )
      )
    )
  }
}






#' @title Grid editor for date/time columns
#' 
#' @description Allow to edit content of columns with a calendar and time picker,
#'  then retrieve value server-side in shiny application with \code{input$<outputId>_data}.
#'
#' @param grid A table created with \code{\link{datagrid}}.
#' @param column Column for which to activate the date picker.
#' @param format Date format, default is \code{"yyyy-MM-dd"}.
#' @param type Type of selection: date, month or year.
#' @param timepicker Add a timepicker.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#' 
#' @seealso \code{\link{grid_editor}} for normal inputs.
#'
#' @example examples/ex-grid_editor_date.R
grid_editor_date <- function(grid,
                             column,
                             format = "yyyy-MM-dd",
                             type = c("date", "month", "year"),
                             timepicker = c("none", "tab", "normal")) {
  check_grid(grid, "grid_editor")
  type <- match.arg(type)
  timepicker <- match.arg(timepicker)
  options <- list(format = format)
  if (type %in% c("month", "year")) {
    options$type <- type
  }
  if (timepicker == "tab") {
    options$timepicker <- list(
      layoutType = "tab",
      inputType = "spinbox"
    )
  }
  if (timepicker == "normal") {
    options$timepicker <- TRUE
  }
  grid_columns(
    grid = grid,
    vars = column,
    editor = list(
      type = "datePicker",
      options = options
    )
  )
}

