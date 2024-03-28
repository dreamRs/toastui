
#' @title Shiny bindings for [calendar()]
#'
#' @description Output and render functions for using [calendar()] within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId Output variable to read from.
#' @param width,height Must be a valid CSS unit (like `100%`,
#'   `400px`, `auto`) or a number, which will be coerced to a
#'   string and have `px` appended.
#' @param expr An expression that generates a calendar
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with `quote()`)? This
#'   is useful if you want to save an expression in a variable.
#'
#' @return Output element that can be included in UI. Render function to create output in server.
#'
#' @details # Special inputs
#' The following `input` values will be accessible in the server:
#' * **input$outputId_add** : contain data about schedule added via the creation popup. Javascript event: `beforeCreateSchedule`.
#' * **input$outputId_schedules** : contain data about last schedule added. Javascript event: `afterRenderSchedule`.
#' * **input$outputId_click** : contain data about schedule user click on. Javascript event: `clickSchedule`.
#' * **input$outputId_delete** : contain data about schedule deleted by user via creation popup. Javascript event: `beforeDeleteSchedule`.
#' * **input$outputId_update** : contain data about schedule updated by user via creation popup. Javascript event: `beforeUpdateSchedule`.
#' * **input$outputId_dates** : start and end date represented in the calendar.
#'
#' To use them you need to replace `outputId` by the id you've used to create the calendar.
#' If you use one of the above javascript event in [cal_events()], the input won't be accessible.
#'
#' @name calendar-shiny
#'
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#'
#' @export
#'
#' @example examples/shiny-calendar.R
calendarOutput <- function(outputId, width = "100%", height = "600px"){
  shinyWidgetOutput(outputId, "calendar", width, height, package = "toastui")
}

#' @rdname calendar-shiny
#' @export
renderCalendar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, calendarOutput, env, quoted = TRUE)
}



#' @title Shiny bindings for [datagrid()]
#'
#' @description Output and render functions for using [datagrid()] within Shiny
#' applications and interactive Rmd documents.
#'
#' @inheritParams renderCalendar
#'
#' @return Output element that can be included in UI. Render function to create output in server.
#'
#' @details # Special inputs
#' The following `input` values will be accessible in the server:
#' * **input$outputId_data** : contain the data displayed in grid, only available when `datagrid(data_as_input = TRUE)` or when using [grid_editor()]
#' * **input$outputId_validation** : contain results of validation rules applied to data, only available when using `validation` argument in [grid_editor()]
#'
#' These other inputs can be defined using other functions:
#' * *row selection*: giving row selected with checkboxes or radio buttons in `inputId` defined in [grid_selection_row()]
#' * *cell selection*: giving cell selected with mouse in `inputId` defined in [grid_selection_cell()]
#' * *cell clicked*: giving row index and column name of cell clicked in `inputId` defined in [grid_click()]
#'
#' @name datagrid-shiny
#'
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#'
#' @export
#'
#' @example examples/shiny-datagrid.R
datagridOutput <- function(outputId, width = "100%", height = "400px"){
  shinyWidgetOutput(outputId, "datagrid", width, height, package = "toastui", inline = FALSE)
}

#' @rdname datagrid-shiny
#' @export
renderDatagrid <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, datagridOutput, env, quoted = TRUE)
}

#' @rdname datagrid-shiny
#' @export
renderDatagrid2 <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, datagridOutput2, env, quoted = TRUE)
}

#' @rdname datagrid-shiny
#' @export
datagridOutput2 <- function(outputId, width = "100%", height = "auto") {
  shinyWidgetOutput(outputId, "datagrid", width, height, package = "toastui", inline = FALSE)
}



#' @title Shiny bindings for [chart()]
#'
#' @description Output and render functions for using [chart()] within Shiny
#' applications and interactive Rmd documents.
#'
#' @inheritParams renderCalendar
#'
#' @return Output element that can be included in UI. Render function to create output in server.
#'
#' @name chart-shiny
#'
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#'
#' @export
#'
#' @example examples/shiny-chart.R
chartOutput <- function(outputId, width = "100%", height = "400px"){
  shinyWidgetOutput(outputId, "chart", width, height, package = "toastui", inline = FALSE)
}

#' @rdname chart-shiny
#' @export
renderChart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, datagridOutput, env, quoted = TRUE)
}
