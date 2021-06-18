
.add_calendar <- function(widget, calendar) {
  widget$x$options$calendars <- c(
    widget$x$options$calendars,
    list(calendar)
  )
  widget
}

#' @title Calendar properties
#'
#' @description Define calendar properties for grouping schedules under common theme.
#'
#' @param cal A \code{calendar} object.
#' @param ... Either named arguments to use as calendar properties or a
#'  \code{data.frame} with rows as calendars and columns as properties.
#'  See \url{https://nhn.github.io/tui.calendar/latest/CalendarProps/} for options.
#'
#' @export
#'
#' @return A \code{calendar} htmlwidget.
#'
#' @example examples/ex-cal_props.R
cal_props <- function(cal, ...) {
  check_cal(cal, "cal_props")
  args <- list(...)
  if (inherits(args[[1]], "data.frame")) {
    df <- as.data.frame(args[[1]])
    df <- apply(X = df, MARGIN = 1, FUN = as.list)
    for (i in seq_along(df)) {
      cal <- .add_calendar(
        widget = cal,
        calendar = df[[i]]
      )
    }
    return(cal)
  } else if (inherits(args[[1]], "list")) {
    for (i in seq_along(args)) {
      cal <- .add_calendar(
        widget = cal,
        calendar = dropNulls(args[[i]])
      )
    }
    return(cal)
  } else {
    .add_calendar(
      widget = cal,
      calendar = dropNulls(args)
    )
  }
}

