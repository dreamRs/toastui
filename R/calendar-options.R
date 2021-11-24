
#' @title Calendar Week Options
#'
#' @description Options for daily, weekly view.
#'
#' @param cal A [calendar()] object.
#' @param startDayOfWeek Numeric. The start day of week.
#' @param daynames Vector. The day names in weekly and daily. Default values are 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'.
#' @param narrowWeekend Logical. Make weekend column narrow(1/2 width).
#' @param workweek Logical. Show only 5 days except for weekend.
#' @param showTimezoneCollapseButton Logical. Show a collapse button to close multiple timezones
#' @param timezonesCollapsed Logical. An initial multiple timezones collapsed state.
#' @param hourStart Numeric. Can limit of render hour start.
#' @param hourEnd Numeric. Can limit of render hour end.
#'
#' @note Online JavaScript documentation: \url{https://nhn.github.io/tui.calendar/latest/WeekOptions/}
#'
#' @export
#'
#' @return A `calendar` htmlwidget.
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
#' @param cal A [calendar()] object.
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
#' @note Online JavaScript documentation: \url{https://nhn.github.io/tui.calendar/latest/MonthOptions/}
#'
#' @export
#'
#' @return A `calendar` htmlwidget.
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








#' @title Calendar Timezone
#'
#' @description Set a custom time zone. You can add secondary timezone in the weekly/daily view.
#'
#' @param cal A [calendar()] object.
#' @param timezoneName timezone name (time zone names of the IANA time zone database, such as 'Asia/Seoul', 'America/New_York').
#'  Basically, it will calculate the offset using 'Intl.DateTimeFormat' with the value of the this property entered.
#' @param displayLabel The display label of your timezone at weekly/daily view(e.g. 'GMT+09:00')
#' @param tooltip The tooltip(e.g. 'Seoul')
#' @param extra_zones A \code{list} with additional timezones to be shown in left timegrid of weekly/daily view.
#' @param offsetCalculator Javascript function. If you define the 'offsetCalculator' property, the offset calculation is done with this function.
#' 
#' @note Online JavaScript documentation: \url{https://nhn.github.io/tui.calendar/latest/Timezone/}
#' 
#' @return A `calendar` htmlwidget.
#' @export
#'
#' @examples
#' library(toastui)
#' calendar(view = "week", defaultDate = "2021-06-18") %>% 
#'   cal_schedules(
#'     title = "My schedule",
#'     start = "2021-06-18T10:00:00",
#'     end = "2021-06-18T17:00:00",
#'     category = "time"
#'   ) %>% 
#'   # Set primary timezone and add secondary timezone
#'   cal_timezone(
#'     timezoneName = "Europe/Paris",
#'     displayLabel = "GMT+02:00",
#'     tooltip = "Paris",
#'     extra_zones = list(
#'       list(
#'         timezoneName = "Asia/Seoul",
#'         displayLabel = "GMT+09:00",
#'         tooltip = "Seoul"
#'       )
#'     )
#'   )
cal_timezone <- function(cal, 
                         timezoneName = NULL,
                         displayLabel = NULL,
                         tooltip = NULL,
                         extra_zones = NULL, 
                         offsetCalculator = NULL) {
  check_cal(cal, "cal_timezone")
  zones <- list(
    dropNulls(list(
      timezoneName = timezoneName, 
      displayLabel = displayLabel, 
      tooltip = tooltip
    ))
  )
  if (!is.null(extra_zones)) {
    zones <- c(zones, extra_zones)
  }
  .widget_options(
    widget = cal,
    name_opt = "timezone",
    zones = zones,
    offsetCalculator = offsetCalculator
  )
}
