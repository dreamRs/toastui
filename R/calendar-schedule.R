
#' @importFrom utils modifyList
.add_schedule <- function(widget, schedule) {
  schedule <- modifyList(
    val = schedule,
    x = list(
      category = "time",
      dueDateClass = "",
      id = paste0("schedule", genId()),
      calendarId = "1"
    )
  )
  schedule$calendarId <- as.character(schedule$calendarId)
  schedule$id <- as.character(schedule$id)
  widget$x$schedules <- append(
    x = widget$x$schedules,
    values = list(schedule)
  )
  widget
}


#' @title Add schedules to calendar
#'
#' @param cal A `calendar` htmlwidget.
#' @param ... Either named arguments to use as schedule properties or a
#'  \code{data.frame} with rows as schedules and columns as properties.
#'  See \url{https://nhn.github.io/tui.calendar/latest/Schedule/} for options.
#'
#' @export
#'
#' @return A `calendar` htmlwidget.
#'
#' @example examples/ex-cal_schedules.R
cal_schedules <- function(cal, ...) {
  check_cal(cal, "cal_schedules")
  args <- list(...)
  if (inherits(args[[1]], "data.frame")) {
    schedules <- rows_to_list(args[[1]])
    for (i in seq_along(schedules)) {
      cal <- .add_schedule(
        widget = cal,
        schedule = schedules[[i]]
      )
    }
    return(cal)
  } else {
    .add_schedule(
      widget = cal,
      schedule = dropNulls(args)
    )
  }
}

