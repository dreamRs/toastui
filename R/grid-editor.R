
#' @title Grid editor for columns
#'
#' @description Allow to edit content of columns with different inputs,
#'  then retrieve value server-side in shiny application with `input$<outputId>_data`.
#'
#' @param grid A table created with [datagrid()].
#' @param column Column for which to activate the editable content.
#' @param type Type of editor: `"text"`, `"number"`, `"checkbox"`,
#'  `"select"`, `"radio"` or `"password"`.
#' @param choices Vector of choices, required for `"checkbox"`,
#'  `"select"` and `"radio"` type.
#' @param validation Rules to validate content edited, see [validateOpts()].
#' @param useListItemText If `choices` contains special characters (spaces, punctuation, ...)
#'  set this option to `TRUE`, you'll have to encode data in `column` to numeric as character (e.g. `"1"`, `"2"`, ...).
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @name grid-editor
#'
#' @seealso \code{\link{grid_editor_date}} for a date picker.
#'
#' @example examples/ex-grid_editor-shiny.R
grid_editor <- function(grid,
                        column,
                        type = c("text", "number", "checkbox", "select", "radio", "password"),
                        choices = NULL,
                        validation = validateOpts(),
                        useListItemText = FALSE) {
  check_grid(grid, "grid_editor")
  type <- match.arg(type)
  if (identical(type, "number")) {
    type <- "text"
    validation$type <- "number"
  }
  grid$x$dataAsInput <- TRUE
  if (length(validation) < 1) {
    validation <- NULL
  } else {
    grid$x$validationInput <- TRUE
  }
  if (type %in% c("checkbox", "select", "radio") & is.null(choices))
    stop("grid_editor: choices must be specified for checkbox, select and radio types", call. = FALSE)
  if (type %in% c("text", "password")) {
    grid_columns(
      grid = grid,
      columns = column,
      editor = list(
        type = type
      ),
      validation = validation
    )
  } else if (type %in% c("checkbox", "select", "radio")) {
    grid_columns(
      grid = grid,
      columns = column,
      formatter = if (useListItemText) "listItemText",
      editor = list(
        type = type,
        options = list(
          instantApply = TRUE,
          listItems = if (useListItemText) {
            lapply(
              X = seq_along(choices),
              FUN = function(i) {
                list(text = choices[i], value = as.character(i))
              }
            )
          } else {
            lapply(
              X = choices,
              FUN = function(x) {
                list(text = x, value = x)
              }
            )
          }
        )
      ),
      validation = validation
    )
  }
}




#' @param grid A table created with [datagrid()].
#' @param editingEvent If set to \code{"click"}, editable cell in
#'  the view-mode will be changed to edit-mode by a single click.
#' @param actionButtonId Use an \code{actionButton} inputId to send
#'  edited data to the server only when this button is clicked.
#'  This allows not to send all the changes made by the user to the server.
#' @param session Shiny session.
#'
#' @export
#'
#' @rdname grid-editor
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
grid_editor_opts <- function(grid,
                             editingEvent = c("dblclick", "click"),
                             actionButtonId = NULL,
                             session = shiny::getDefaultReactiveDomain()) {
  check_grid(grid, "grid_editor_opts")
  grid$x$options$editingEvent <- match.arg(editingEvent)
  if (!is.null(session))
    actionButtonId <- session$ns(actionButtonId)
  grid$x$updateEditOnClick <- actionButtonId
  return(grid)
}




#' @title Validation options
#'
#' @description Validate columns' content with rules, useful when content is editable.
#'
#' @param required If set to \code{TRUE}, the data of the column will be checked to be not empty.
#' @param type Type of data, can be \code{"string"} or \code{"number"}.
#' @param min For numeric values, the minimum acceptable value.
#' @param max For numeric values, the maximum acceptable value.
#' @param regExp A regular expression to validate content.
#' @param unique If set to \code{TRUE}, check the uniqueness on the data of the column.
#' @param jsfun A \code{JS} function to validate content.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @importFrom htmlwidgets JS
#'
#' @return a `list` of options to use in [grid_editor()].
#' @export
#'
#' @example examples/ex-grid_validation-shiny.R
validateOpts <- function(required = NULL,
                         type = NULL,
                         min = NULL,
                         max = NULL,
                         regExp = NULL,
                         unique = NULL,
                         jsfun = NULL) {
  if (!is.null(regExp)) {
    regExp <- JS(paste0("/", regExp, "/"))
  }
  dropNulls(list(
    required = required,
    dataType = type,
    min = min,
    max = max,
    regExp = regExp,
    unique = unique,
    validatorFn = jsfun
  ))
}


#' @title Grid editor for date/time columns
#'
#' @description Allow to edit content of columns with a calendar and time picker,
#'  then retrieve value server-side in shiny application with \code{input$<outputId>_data}.
#'
#' @param grid A table created with [datagrid()].
#' @param column Column for which to activate the date picker.
#' @param format Date format, default is \code{"yyyy-MM-dd"}.
#' @param type Type of selection: date, month or year.
#' @param timepicker Add a timepicker.
#' @param weekStartDay Start of the week : 'Sun' (default), 'Mon', ..., 'Sat'
#' @param language Either `"en"` or `"ko"` the builtin language, or `"custom"` to use texts defined in `datagrid(datepicker_locale = list(...))`, see example.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @seealso \code{\link{grid_editor}} for normal inputs.
#'
#' @example examples/ex-grid_editor_date.R
grid_editor_date <- function(grid,
                             column,
                             format = "yyyy-MM-dd",
                             type = c("date", "month", "year"),
                             timepicker = c("none", "tab", "normal"),
                             weekStartDay = NULL,
                             language = NULL) {
  check_grid(grid, "grid_editor")
  type <- match.arg(type)
  timepicker <- match.arg(timepicker)
  options <- dropNulls(list(format = format, language = language, weekStartDay = weekStartDay))
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
    columns = column,
    editor = list(
      type = "datePicker",
      options = options
    )
  )
}

