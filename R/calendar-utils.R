
#' @title Calendar custom JavaScript events
#'
#' @description Currently only works in Shiny applications.
#'
#' @param cal A `calendar` htmlwidget object.
#' @param afterRenderSchedule Fire this event by every single schedule after rendering whole calendar.
#' @param beforeCreateSchedule Fire this event when select time period in daily, weekly, monthly.
#' @param beforeDeleteSchedule Fire this event when delete a schedule.
#' @param beforeUpdateSchedule Fire this event when drag a schedule to change time in daily, weekly, monthly.
#' @param clickDayname Fire this event when click a day name in weekly.
#' @param clickMorecalendar Fire this event when click a schedule.
#' @param clickSchedule Fire this event when click a schedule.
#' @param clickTimezonesCollapseBtncalendar Fire this event by clicking timezones collapse button.
#'
#' @note All arguments must be JavaScript function wrapped in [htmlwidgets::JS()].
#'
#' @return A `calendar` htmlwidget object.
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





#' @title Calendar theme options
#'
#' @description Full configuration for theme.
#' "common" prefix is for entire calendar. "common" properties can be overridden by "week", "month".
#' "week" prefix is for weekly and daily view.
#' "month" prefix is for monthly view.
#'
#' @param cal A [calendar()] object.
#' @param ... Named arguments to customize appearance with CSS. See online documentation for full list of options.
#' @param .list Alternative to `...` for using a list.
#'
#' @note Online JavaScript documentation: \url{https://nhn.github.io/tui.calendar/latest/themeConfig/}
#'
#' @export
#' @return A `calendar` htmlwidget object.
#'
#'
#' @examples
#' calendar(view = "month") %>%
#'   cal_theme(
#'     common.border = "2px solid #E5E9F0",
#'     month.dayname.borderLeft = "2px solid #E5E9F0",
#'     common.backgroundColor = "#2E3440",
#'     common.holiday.color = "#88C0D0",
#'     common.saturday.color = "#88C0D0",
#'     common.dayname.color = "#ECEFF4",
#'     common.today.color = "#333"
#'   )
cal_theme <- function(cal, ..., .list = NULL) {
  .widget_options2(
    widget = cal,
    name_opt = "theme",
    l = dropNulls(c(list(...), .list))
  )
}



#' @title Set template for a calendar
#'
#' @description Template JS functions to support customer renderer
#'
#' @param cal A [calendar()] object.
#' @param milestoneTitle The milestone title (at left column) template function.
#' @param taskTitle The task title (at left column) template function.
#' @param alldayTitle The allday title (at left column) template function.
#' @param ... Additionals arguments, see online documentation.
#'
#' @note Online JavaScript documentation: \url{https://nhn.github.io/tui.calendar/latest/Template/}.
#'  All arguments must be JavaScript function with [htmlwidgets::JS()].
#'
#' @export
#' @return A `calendar` htmlwidget object.
#'
#'
#' @examples
#' calendar(view = "week", taskView = TRUE) %>%
#'   cal_template(
#'     milestoneTitle = "TODO",
#'     taskTitle = "Assignment",
#'     alldayTitle = "Full-time"
#'   )
cal_template <- function(cal, milestoneTitle = NULL, taskTitle = NULL, alldayTitle = NULL, ...) {
  if (is.character(milestoneTitle)) {
    milestoneTitle <- cal_title(milestoneTitle)
  }
  if (is.character(taskTitle)) {
    taskTitle <- cal_title(taskTitle)
  }
  if (is.character(alldayTitle)) {
    alldayTitle <- cal_title(alldayTitle)
  }
  .widget_options(
    widget = cal,
    name_opt = "template",
    milestoneTitle = milestoneTitle,
    taskTitle = taskTitle,
    alldayTitle = alldayTitle,
    ...
  )
}

#' @importFrom htmlwidgets JS
cal_title <- function(title) {
  JS(sprintf(
    "function() {return  '<span class=\"tui-full-calendar-left-content\">%s</span>';}", title
  ))
}

