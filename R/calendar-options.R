
#' @title Calendar Week Options
#'
#' @description Options for daily, weekly view.
#'
#' @param cal A \code{calendar} object.
#' @param startDayOfWeek Numeric. The start day of week.
#' @param daynames Vector. The day names in weekly and daily. Default values are 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'.
#' @param narrowWeekend Logical. Make weekend column narrow(1/2 width).
#' @param workweek Logical. Show only 5 days except for weekend.
#' @param showTimezoneCollapseButton Logical. Show a collapse button to close multiple timezones
#' @param timezonesCollapsed Logical. An initial multiple timezones collapsed state.
#' @param hourStart Numeric. Can limit of render hour start.
#' @param hourEnd Numeric. Can limit of render hour end.
#'
#' @note Online JavaScript documentation: \url{https://nhn.github.io/tui.calendar/latest/WeekOptions}
#'
#' @export
#'
#' @return A \code{calendar} htmlwidget.
#'
#' @example examples/ex-cal_week_options.R
cal_week_options <- function(cal,
                             startDayOfWeek = NULL,
                             daynames = NULL,
                             narrowWeekend = NULL,
                             workweek = NULL,
                             showTimezoneCollapseButton = NULL,
                             timezonesCollapsed = NULL,
                             hourStart = NULL,
                             hourEnd = NULL) {
  check_cal(cal, "cal_week_options")
  .widget_options(
    widget = cal,
    name_opt = "week",
    startDayOfWeek = startDayOfWeek,
    daynames = daynames,
    narrowWeekend = narrowWeekend,
    workweek = workweek,
    showTimezoneCollapseButton = showTimezoneCollapseButton,
    timezonesCollapsed = timezonesCollapsed,
    hourStart = hourStart,
    hourEnd = hourEnd
  )
}



#' @title Calendar Month Options
#'
#' @description Options for monthly view.
#'
#' @param cal A \code{calendar} object.
#' @param startDayOfWeek Numeric. The start day of week.
#' @param daynames Vector. The day names in monthly. Default values are 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'
#' @param narrowWeekend Logical. Make weekend column narrow(1/2 width).
#' @param visibleWeeksCount Numeric. The visible week count in monthly(0 or null are same with 6).
#' @param isAlways6Week Logical. Always show 6 weeks. If false, show 5 weeks or 6 weeks based on the month.
#' @param workweek Logical. Show only 5 days except for weekend.
#' @param visibleScheduleCount Numeric. The visible schedule count in monthly grid.
#' @param moreLayerSize List of parameters, see online documentation.
#' @param grid List of parameters, see online documentation.
#' @param scheduleFilter List of parameters, see online documentation.
#'
#' @note Online JavaScript documentation: \url{https://nhn.github.io/tui.calendar/latest/MonthOptions}
#'
#' @export
#'
#' @return A \code{calendar} htmlwidget.
#'
#' @example examples/ex-cal_month_options.R
cal_month_options <- function(cal,
                              startDayOfWeek = NULL,
                              daynames = NULL,
                              narrowWeekend = NULL,
                              visibleWeeksCount = NULL,
                              isAlways6Week = NULL,
                              workweek = NULL,
                              visibleScheduleCount = NULL,
                              moreLayerSize = NULL,
                              grid = NULL,
                              scheduleFilter = NULL) {
  check_cal(cal, "cal_month_options")
  .widget_options(
    widget = cal,
    name_opt = "month",
    startDayOfWeek = startDayOfWeek,
    daynames = daynames,
    narrowWeekend = narrowWeekend,
    visibleWeeksCount = visibleWeeksCount,
    isAlways6Week = isAlways6Week,
    workweek = workweek,
    visibleScheduleCount = visibleScheduleCount,
    moreLayerSize = moreLayerSize,
    grid = grid,
    scheduleFilter = scheduleFilter
  )
}

