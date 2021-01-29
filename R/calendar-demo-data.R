
#' Create demo schedules data
#'
#' @param view Calendar view for which to use the data.
#'
#' @return a \code{data.frame}.
#' @export
#'
#' @examples
#'
#' # Monthly schedule
#' cal_demo_data("month")
cal_demo_data <- function(view = c("month", "week", "day")) {
  view <- match.arg(view)
  if (identical(view, "month")) {
    schedules <- list(
      list(
        calendarId = 1, title = "Sport", body = "Go to sport every week", recurrenceRule = "Every week",
        start = format(Sys.Date(), format = "%Y-%m-05 20:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-05 22:00:00"),
        category = "time", location = NA, bgColor = NA, color = NA
      ),
      list(
        calendarId = 1, title = "Sport", body = "Go to sport every week", recurrenceRule = "Every week",
        start = format(Sys.Date(), format = "%Y-%m-12 20:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-12 22:00:00"),
        category = "time", location = NA, bgColor = NA, color = NA
      ),
      list(
        calendarId = 1, title = "Sport", body = "Go to sport every week", recurrenceRule = "Every week",
        start = format(Sys.Date(), format = "%Y-%m-19 20:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-19 22:00:00"),
        category = "time", location = NA, bgColor = NA, color = NA
      ),
      list(
        calendarId = 1, title = "Week-end", body = "Week-end with friends", recurrenceRule = NA,
        start = get_day("6")[2],
        end = get_day("7")[2],
        category = "allday", location = NA, bgColor = NA, color = NA
      ),
      list(
        calendarId = 2, title = "Training", body = "Learn programming", recurrenceRule = NA,
        start = get_day("2")[2],
        end = get_day("4")[2],
        category = "allday", location = NA, bgColor = NA, color = NA
      ),
      list(
        calendarId = 2, title = "Meeting", body = "Meeting with John Smith", recurrenceRule = NA,
        start = format(Sys.Date(), format = "%Y-%m-20 14:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-20 17:00:00"),
        category = "time", location = NA, bgColor = NA, color = NA
      ),
      list(
        calendarId = 2, title = "Lunch", body = "Lunch with Jane Doe", recurrenceRule = NA,
        start = format(Sys.Date(), format = "%Y-%m-24 12:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-24 14:00:00"),
        category = "time", location = "Some restaurant", bgColor = NA, color = NA
      ),
      list(
        calendarId = 2, title = "Conference", body = "Cool R conference", recurrenceRule = NA,
        start = format(Sys.Date(), format = "%Y-%m-27"),
        end = format(Sys.Date(), format = "%Y-%m-28"),
        category = "allday", location = "Conference center", bgColor = NA, color = NA
      ),
      list(
        calendarId = 3, title = "Mum birthday", body = "Dont forget!!!", recurrenceRule = NA,
        start = format(Sys.Date(), format = "%Y-%m-03"),
        end = format(Sys.Date(), format = "%Y-%m-03"),
        category = "allday", location = NA, bgColor = "firebrick", color = "#FAFAFA"
      )
    )
    do.call("rbind", lapply(schedules, as.data.frame))
  }
}


get_day <- function(day = "6") {
  days <- seq(from = as.Date(format(Sys.Date(), format = "%Y-%m-01")), by = "days", length.out = 30)
  as.character(days)[format(days, format = "%u") == day]
}


