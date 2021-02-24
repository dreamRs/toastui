
#' @title Calendar custom JavaScript events
#'
#' @description Currently only works in Shiny applications.
#'
#' @param cal A \code{calendar} htmlwidget object.
#' @param afterRenderSchedule Fire this event by every single schedule after rendering whole calendar.
#' @param beforeCreateSchedule Fire this event when select time period in daily, weekly, monthly.
#' @param beforeDeleteSchedule Fire this event when delete a schedule.
#' @param beforeUpdateSchedule Fire this event when drag a schedule to change time in daily, weekly, monthly.
#' @param clickDayname Fire this event when click a day name in weekly.
#' @param clickMorecalendar Fire this event when click a schedule.
#' @param clickSchedule Fire this event when click a schedule.
#' @param clickTimezonesCollapseBtncalendar Fire this event by clicking timezones collapse button.
#'
#' @note All arguments must be JavaScript function with \code{\link[htmlwidgets]{JS}}.
#'
#' @return A \code{calendar} htmlwidget object.
#' @export
#'
#' @example examples/ex-cal_events.R
cal_events <- function(cal,
                       afterRenderSchedule = NULL,
                       beforeCreateSchedule = NULL,
                       beforeDeleteSchedule = NULL,
                       beforeUpdateSchedule = NULL,
                       clickDayname = NULL,
                       clickMorecalendar = NULL,
                       clickSchedule = NULL,
                       clickTimezonesCollapseBtncalendar = NULL) {
  check_cal(cal, "cal_events")
  cal$x$events <- dropNulls(list(
    afterRenderSchedule = afterRenderSchedule,
    beforeCreateSchedule = beforeCreateSchedule,
    beforeDeleteSchedule = beforeDeleteSchedule,
    beforeUpdateSchedule = beforeUpdateSchedule,
    clickDayname = clickDayname,
    clickMorecalendar = clickMorecalendar,
    clickSchedule = clickSchedule,
    clickTimezonesCollapseBtncalendar = clickTimezonesCollapseBtncalendar
  ))
  cal
}


