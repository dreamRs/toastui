
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
  widget$x$schedules <- append(
    x = widget$x$schedules,
    values = list(schedule)
  )
  widget
}


#' @title Add schedules to calendar
#'
#' @param cal A \code{calendar} htmlwidget.
#' @param ... Either named arguments to use as schedule properties or a
#'  \code{data.frame} with rows as schedules and columns as properties.
#'  See \url{https://nhn.github.io/tui.calendar/latest/Schedule/} for options.
#'
#' @export
#'
#' @return A \code{calendar} htmlwidget.
#'
#' @example examples/ex-cal_schedules.R
cal_schedules <- function(cal, ...) {
  check_cal(cal, "cal_schedules")
  args <- list(...)
  if (inherits(args[[1]], "data.frame")) {
    df <- as.data.frame(args[[1]])
    df <- apply(X = df, MARGIN = 1, FUN = as.list)
    for (i in seq_along(df)) {
      cal <- .add_schedule(
        widget = cal,
        schedule = df[[i]]
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

