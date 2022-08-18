
#' @title Calendar demo data
#'
#' @description Create calendar demo data for schedules and properties
#'
#' @param view Calendar view for which to use the data.
#'
#' @return a `data.frame`.
#' @export
#'
#' @name cal-demo-data
#'
#' @examples
#'
#' # Monthly schedule
#' cal_demo_data("month")
#'
#' #' # Weekly schedule
#' cal_demo_data("week")
cal_demo_data <- function(view = c("month", "week", "day")) {
  view <- match.arg(view)
  if (identical(view, "month")) {
    schedules <- list(
      list(
        calendarId = "1",
        title = "Sport",
        body = "Go to sport every week",
        recurrenceRule = "Every week",
        start = format(Sys.Date(), format = "%Y-%m-05 20:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-05 22:00:00"),
        category = "time",
        location = NA,
        backgroundColor = NA,
        color = NA,
        borderColor = NA
      ),
      list(
        calendarId = "1",
        title = "Sport",
        body = "Go to sport every week",
        recurrenceRule = "Every week",
        start = format(Sys.Date(), format = "%Y-%m-12 20:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-12 22:00:00"),
        category = "time",
        location = NA,
        backgroundColor = NA,
        color = NA,
        borderColor = NA
      ),
      list(
        calendarId = "1",
        title = "Sport",
        body = "Go to sport every week",
        recurrenceRule = "Every week",
        start = format(Sys.Date(), format = "%Y-%m-19 20:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-19 22:00:00"),
        category = "time",
        location = NA,
        backgroundColor = NA,
        color = NA,
        borderColor = NA
      ),
      list(
        calendarId = "1",
        title = "Week-end",
        body = "Week-end with friends",
        recurrenceRule = NA,
        start = as.character(get_day_month("6")[2]),
        end = as.character(get_day_month("6")[2] + 1),
        category = "allday",
        location = NA,
        backgroundColor = NA,
        color = NA,
        borderColor = NA
      ),
      list(
        calendarId = "2",
        title = "Project 1",
        body = "Coding cool stuff",
        recurrenceRule = NA,
        start = as.character(get_day_month("1")[1]),
        end = as.character(get_day_month("1")[1] + 1),
        category = "allday",
        location = NA,
        backgroundColor = "#5E81AC",
        color = "white",
        borderColor = "#5E81AC"
      ),
      list(
        calendarId = "2",
        title = "Project 2",
        body = "Coding cool stuff",
        recurrenceRule = NA,
        start = as.character(get_day_month("2")[1]),
        end = as.character(get_day_month("2")[1] + 3),
        category = "allday",
        location = NA,
        backgroundColor = "#5E81AC",
        color = "white",
        borderColor = "#5E81AC"
      ),
      list(
        calendarId = "2",
        title = "Project 3",
        body = "Coding cool stuff",
        recurrenceRule = NA,
        start = format(Sys.Date(), format = "%Y-%m-29"),
        end = format(Sys.Date(), format = "%Y-%m-29"),
        category = "allday",
        location = NA,
        backgroundColor = "#5E81AC",
        color = "white",
        borderColor = "#5E81AC"
      ),
      list(
        calendarId = "3",
        title = "Training 1",
        body = "Learn programming",
        recurrenceRule = NA,
        start = as.character(get_day_month("2")[2]),
        end = as.character(get_day_month("2")[2] + 3),
        category = "allday",
        location = NA,
        backgroundColor = NA,
        color = NA,
        borderColor = NA
      ),
      list(
        calendarId = "3",
        title = "Training 2",
        body = "Learn programming",
        recurrenceRule = NA,
        start = as.character(get_day_month("2")[3]),
        end = as.character(get_day_month("2")[3] + 2),
        category = "allday",
        location = NA,
        backgroundColor = NA,
        color = NA,
        borderColor = NA
      ),
      list(
        calendarId = "2",
        title = "Meeting",
        body = "Meeting with John Smith",
        recurrenceRule = NA,
        start = format(Sys.Date(), format = "%Y-%m-20 14:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-20 17:00:00"),
        category = "time",
        location = NA,
        backgroundColor = NA,
        color = NA,
        borderColor = NA
      ),
      list(
        calendarId = "2",
        title = "Lunch",
        body = "Lunch with Jane Doe",
        recurrenceRule = NA,
        start = format(Sys.Date(), format = "%Y-%m-24 12:00:00"),
        end = format(Sys.Date(), format = "%Y-%m-24 14:00:00"),
        category = "time",
        location = "Some restaurant",
        backgroundColor = NA,
        color = NA,
        borderColor = NA
      ),
      list(
        calendarId = "3",
        title = "Conference",
        body = "Cool R conference",
        recurrenceRule = NA,
        start = format(Sys.Date(), format = "%Y-%m-27"),
        end = format(Sys.Date(), format = "%Y-%m-28"),
        category = "allday",
        location = "Conference center",
        backgroundColor = NA,
        color = NA,
        borderColor = NA
      ),
      list(
        calendarId = "4",
        title = "Mum birthday",
        body = "Dont forget!!!",
        recurrenceRule = NA,
        start = format(Sys.Date(), format = "%Y-%m-03"),
        end = format(Sys.Date(), format = "%Y-%m-03"),
        category = "allday",
        location = NA,
        backgroundColor = "#FAFAFA",
        color = "#FF0000",
        borderColor = "#FF0000"
      )
    )
  } else if (identical(view, "week")) {
    schedules <- list(
      list(
        calendarId = "3",
        title = "Course 1", body = "Learn something interesting",
        start = format(get_day_week(1), format = "%Y-%m-%d 8:00:00"),
        end = format(get_day_week(1), format = "%Y-%m-%d 12:00:00"),
        category = "time"
      ),
      list(
        calendarId = "3",
        title = "Course 2", body = "Learn something interesting",
        start = format(get_day_week(1), format = "%Y-%m-%d 14:00:00"),
        end = format(get_day_week(1), format = "%Y-%m-%d 18:00:00"),
        category = "time"
      ),
      list(
        calendarId = "3",
        title = "Course 3", body = "Learn something interesting",
        start = format(get_day_week(3), format = "%Y-%m-%d 08:00:00"),
        end = format(get_day_week(3), format = "%Y-%m-%d 11:00:00"),
        category = "time"
      ),
      list(
        calendarId = "3",
        title = "Course 4", body = "Learn something interesting",
        start = format(get_day_week(4), format = "%Y-%m-%d 16:00:00"),
        end = format(get_day_week(4), format = "%Y-%m-%d 19:00:00"),
        category = "time"
      ),
      list(
        calendarId = "2",
        title = "Lunch", body = "Work lunch",
        start = format(get_day_week(2), format = "%Y-%m-%d 12:00:00"),
        end = format(get_day_week(2), format = "%Y-%m-%d 14:00:00"),
        category = "time"
      ),
      list(
        calendarId = "2",
        title = "Meeting", body = "Work meeting",
        start = format(get_day_week(2), format = "%Y-%m-%d 16:00:00"),
        end = format(get_day_week(2), format = "%Y-%m-%d 18:30:00"),
        category = "time"
      ),
      list(
        calendarId = "1",
        title = "Sport", body = "Make some exercise",
        start = format(get_day_week(4), format = "%Y-%m-%d 07:00:00"),
        end = format(get_day_week(4), format = "%Y-%m-%d 09:00:00"),
        category = "time"
      ),
      list(
        calendarId = "1",
        title = "Movie", body = "Go watch a cool movie",
        start = format(get_day_week(3), format = "%Y-%m-%d 18:00:00"),
        end = format(get_day_week(3), format = "%Y-%m-%d 21:00:00"),
        category = "time"
      ),
      list(
        calendarId = "1",
        title = "Day off", body = "Take some rest",
        start = format(get_day_week(5), format = "%Y-%m-%d"),
        end = format(get_day_week(5), format = "%Y-%m-%d"),
        category = "allday"
      )
    )
  }
  do.call("rbind", lapply(schedules, as.data.frame))
}


get_day_month <- function(day = "6") {
  days <- seq(from = as.Date(format(Sys.Date(), format = "%Y-%m-01")), by = "days", length.out = 30)
  days[format(days, format = "%u") == day]
}

get_day_week <- function(day) {
  Sys.Date() + (as.numeric(day) - as.numeric(format(Sys.Date(), format = "%u")))
}



#' @export
#'
#' @rdname cal-demo-data
cal_demo_props <- function() {
  props <- list(
    list(
      id = "1",
      name = "PERSO",
      color = "#000",
      backgroundColor = "#c6d19d",
      borderColor = "forestgreen"
    ),
    list(
      id = "2",
      name = "WORK",
      color = "#000",
      backgroundColor = "#F5A9A9",
      borderColor = "firebrick"
    ),
    list(
      id = "3",
      name = "COURSES",
      color = "#000",
      backgroundColor = "#c6e2f6",
      borderColor = "#3b7cc6"
    )
  )
  do.call("rbind", lapply(props, as.data.frame))
}

