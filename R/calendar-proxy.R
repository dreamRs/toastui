
#' Proxy for calendar htmlwidget
#'
#' @param shinyId single-element character vector indicating the output ID of the
#'   chart to modify (if invoked from a Shiny module, the namespace will be added
#'   automatically).
#' @param session the Shiny session object to which the chart belongs; usually the
#'   default value will suffice.
#'
#' @export
#'
#' @return a `calendar_proxy` object.
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
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
#' @param proxy A \code{\link{calendar_proxy}} \code{htmlwidget} object.
#' @param date A specific date to navigate to.
#'
#' @export
#'
#' @return No value.
#'
#' @name proxy-navigate
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
#' @rdname proxy-navigate
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
#' @rdname proxy-navigate
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
#' @rdname proxy-navigate
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
#' @param proxy A \code{\link{calendar_proxy}} \code{htmlwidget} object.
#' @param view The new view for the calendar: "day", "week" or "month".
#'
#' @export
#'
#' @return No value.
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
#' @param proxy A \code{\link{calendar_proxy}} \code{htmlwidget} object.
#' @param start The start time.
#' @param end The end time.
#' @param title The schedule title.
#' @param body The schedule body text which is text/plain.
#' @param id An id for the schedule.
#' @param calendarId An id for the calendar.
#' @param category The schedule type ('milestone', 'task', allday', 'time').
#' @param ... Additionnal arguments passed to the JavaScript method.
#' @param .list A \code{list} with same information as above, useful
#'  with \code{input$<outputId>_<add/update/delete>_schedule}.
#'
#' @export
#'
#' @return No value.
#'
#' @name proxy-schedule
#'
cal_proxy_add <- function(proxy, start = NULL, end = NULL,
                          title = NULL, body = NULL, id = NULL,
                          calendarId = NULL, category = NULL, ...,
                          .list = NULL) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  if (is.null(id)) {
    id <- paste0("shd_", sample.int(1e6, 1))
  }
  if (!is.null(.list)) {
    .list$id <- id
    schedule <- list(.list)
  } else {
    schedule <- list(dropNulls(list(
      id = id,
      calendarId = calendarId,
      title = title,
      body = body,
      start = start,
      end = end,
      category = category,
      ...
    )))
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-create",
    schedule = schedule
  )
}

#' @rdname proxy-schedule
#' @export
cal_proxy_create <- function(proxy, start = NULL, end = NULL,
                             title = NULL, body = NULL, id = NULL,
                             calendarId = NULL, category = NULL, ...,
                             .list = NULL) {
  warning("cal_proxy_create: This function is deprecated, please use cal_proxy_add() instead.", call. = FALSE)
  cal_proxy_add(
    proxy, start = start, end = end,
    title = title, body = body, id = id,
    calendarId = calendarId, category = category, ...,
    .list = .list
  )
}

#' @rdname proxy-schedule
#' @export
cal_proxy_delete <- function(proxy, calendarId = NULL, id = NULL, .list = NULL) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  if (is.null(.list))
    .list <- list()
  if (!is.null(calendarId))
    .list$calendarId <- calendarId
  if (!is.null(id))
    .list$id <- id
  .call_proxy(
    proxy = proxy,
    name = "calendar-delete",
    calendarId = .list$calendarId,
    id = .list$id
  )
}

#' @rdname proxy-schedule
#' @export
cal_proxy_update <- function(proxy, calendarId = NULL, id = NULL,
                             start = NULL, end = NULL,
                             title = NULL, body = NULL,
                             category = NULL, ...,
                             .list = NULL) {
  if (is.character(proxy)) {
    proxy <- calendar_proxy(proxy)
  }
  if (!is.null(.list$changes) & !is.null(.list$schedule)) {
    calendarId <- .list$schedule$calendarId
    id <- .list$schedule$id
    .list <- .list$changes
  }
  if (is.null(.list)) {
    .list <- dropNulls(list(
      id = id,
      calendarId = calendarId,
      title = title,
      body = body,
      start = start,
      end = end,
      category = category,
      ...
    ))
  }
  .call_proxy(
    proxy = proxy,
    name = "calendar-update",
    calendarId = calendarId,
    id = id,
    schedule = .list
  )
}


#' @title Clear calendar with Proxy
#'
#' @description This function allow to delete all schedules and clear view.
#'
#' @param proxy A \code{\link{calendar_proxy}} \code{htmlwidget} object.
#' @param immediately Render it immediately. Or wait, if you want to add schedule after that for example.
#'
#' @export
#'
#' @return No value.
#'
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
#' @param proxy A \code{\link{calendar_proxy}} \code{htmlwidget} object.
#' @param ... Options for the calendar, you can use arguments from \code{\link{calendar}},
#'  \code{\link{set_month_options}} (under the form \code{month = list(...)}),
#'  \code{\link{set_week_options}} (under the form \code{week = list(...)})
#'
#' @export
#'
#' @return No value.
#'
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

