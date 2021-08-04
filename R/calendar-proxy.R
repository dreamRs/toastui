
#' Proxy for calendar htmlwidget
#'
#' @param shinyId single-element character vector indicating the output ID of the
#'   chart to modify (if invoked from a Shiny module, the namespace will be added
#'   automatically).
#' @param session the Shiny session object to which the chart belongs; usually the
#'   default value will suffice.
#'
#' @return A `calendar_proxy` object.
#' 
#' @family calendar proxy methods
#' 
#' @export
#'
#' @importFrom shiny getDefaultReactiveDomain
#' 
#' @examples 
#' \dontrun{
#' 
#' # Consider having created a calendar widget with
#' calendarOutput("my_calendar") # UI
#' output$my_calendar <- renderCalendar({}) # Server
#' 
#' # Then you can call proxy methods in observer:
#' 
#' # set calendar proxy then call a cal_proxy_* function
#' calendar_proxy("my_calendar") %>% 
#'   cal_proxy_today()
#' 
#' # or directly
#' cal_proxy_today("my_calendar")
#' 
#' }
calendar_proxy <- function(shinyId, session = shiny::getDefaultReactiveDomain()) {
  if (is.null(session)) {
    stop("calendar_proxy must be called from the server function of a Shiny app")
  }
  if (!is.null(session$ns) && nzchar(session$ns(NULL)) && substring(shinyId, 1, nchar(session$ns(""))) != session$ns("")) {
    shinyId <- session$ns(shinyId)
  }
  structure(
    list(
      session = session,
      id = shinyId,
      x = list()
    ),
    class = c("calendar_proxy", "htmlwidgetProxy")
  )
}





#' @title Navigate into a calendar with Proxy
#'
#' @description Those functions allow to navigate in the calendar from the server in a Shiny application.
#'
#' @param proxy A [calendar_proxy()] `htmlwidget` object.
#' @param date A specific date to navigate to.
#'
#' @export
#'
#' @return A `calendar_proxy` object.
#'
#' @name calendar-proxy-navigate
#' @family calendar proxy methods
#'
#' @example examples/cal-proxy-nav.R
cal_proxy_next <- function(proxy) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-nav",
    where = "next"
  )
}

#' @export
#' @rdname calendar-proxy-navigate
cal_proxy_prev <- function(proxy) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-nav",
    where = "prev"
  )
}

#' @export
#' @rdname calendar-proxy-navigate
cal_proxy_today <- function(proxy) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-nav",
    where = "today"
  )
}

#' @export
#' @rdname calendar-proxy-navigate
cal_proxy_date <- function(proxy, date) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-nav",
    where = "date",
    date = date
  )
}



#' @title Change calendar view with Proxy
#'
#' @description This function allow to change the calendar view from the server in a Shiny application.
#'
#' @param proxy A [calendar_proxy()] `htmlwidget` object.
#' @param view The new view for the calendar: "day", "week" or "month".
#'
#' @export
#'
#' @return A `calendar_proxy` object.
#' 
#' @family calendar proxy methods
#'
#' @example examples/cal-proxy-view.R
cal_proxy_view <- function(proxy, view) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-view",
    view = view
  )
}



#' @title Create / Update / Delete schedule(s) with Proxy
#'
#' @description These functions allow to create new schedule(s), update existing
#'  ones and delete schedule in a calendar within the server in a Shiny application.
#'
#' @param proxy A [calendar_proxy()] `htmlwidget` object.
#' @param value A \code{list} with schedules data.
#'
#' @note Those functions are intended to be used with corresponding input value:
#'   * `input$<outputId>_add`: triggered when a schedule is added on calendar via creation popup.
#'   * `input$<outputId>_update`: triggered when an existing schedule is edited.
#'   * `input$<outputId>_deleted`: triggered when a schedule is deleted.
#'
#' @export
#'
#' @return A `calendar_proxy` object.
#'
#' @name calendar-proxy-schedule
#' @family calendar proxy methods
#'
#' @example examples/ex-proxy-schedule.R
cal_proxy_add <- function(proxy, value) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  if (!is.list(value))
    stop("cal_proxy_add: value must be a list", call. = FALSE)
  if (is.null(value$id)) {
    value$id <- paste0("shd_", genId(4, length(value[[1]])))
  } else {
    value$id <- as.character(value$id)
  }
  if (is.null(value$calendarId)) {
    value$calendarId <- paste0("clnd_", genId(4, length(value[[1]])))
  } else {
    value$calendarId <- as.character(value$calendarId)
  }
  if (is.data.frame(value)) {
    value <- rows_to_list(value)
  } else {
    value <- list(value)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-add",
    schedule = value
  )
}


#' @rdname calendar-proxy-schedule
#' @export
cal_proxy_delete <- function(proxy, value) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-delete",
    calendarId = list1(as.character(value$calendarId)),
    scheduleId = list1(as.character(value$id))
  )
}

#' @rdname calendar-proxy-schedule
#' @export
cal_proxy_update <- function(proxy, value) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  if (!is.null(value$changes) & !is.null(value$schedule)) {
    calendarId <- value$schedule$calendarId
    id <- value$schedule$id
    value <- value$changes
  } else {
    calendarId <- value$calendarId
    id <- value$id
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-update",
    calendarId = calendarId,
    id = id,
    schedule = value
  )
}


#' @title Clear calendar with Proxy
#'
#' @description This function allow to delete all schedules and clear view.
#'
#' @param proxy A [calendar_proxy()] `htmlwidget` object.
#' @param immediately Render it immediately. Or wait, if you want to add schedule after that for example.
#'
#' @export
#'
#' @return A `calendar_proxy` object.
#' 
#' @family calendar proxy methods
#' 
#' @example examples/cal-proxy-clear.R
cal_proxy_clear <- function(proxy, immediately = TRUE) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-clear",
    immediately = immediately
  )
}


#' @title Set calendar's options with Proxy
#'
#' @description This function allow to set options for a calendar.
#'
#' @param proxy A [calendar_proxy()] `htmlwidget` object.
#' @param ... Options for the calendar, you can use arguments from [calendar()],
#'  [cal_month_options()] (under the form `month = list(...)`),
#'  [cal_week_options()] (under the form `week = list(...)`)
#'
#' @export
#'
#' @return A `calendar_proxy` object.
#' 
#' @family calendar proxy methods
#' 
#' @example examples/cal-proxy-options.R
cal_proxy_options <- function(proxy, ...) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-options",
    options = list(...)
  )
}


#' @title Toggle schedules visibility with Proxy
#'
#' @description This function allow to show or hide schedules based on their calendar's ID.
#'
#' @param proxy A [calendar_proxy()] `htmlwidget` object.
#' @param calendarId One or several calendar IDs to toggle.
#' @param toHide Logical, show or hide schedules with provided calendar IDs.
#'
#' @return A `calendar_proxy` object.
#' @export
#' 
#' @family calendar proxy methods
#'
#' @example examples/cal-proxy-toggle.R
cal_proxy_toggle <- function(proxy, calendarId, toHide = TRUE) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-toggle",
    calendarId = list1(as.character(calendarId)), 
    toHide = isTRUE(toHide)
  )
}
