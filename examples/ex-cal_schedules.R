# Add schedule data from a data.frame
ex_data <- cal_demo_data()
calendar() %>%
  cal_schedules(ex_data)

# Or add item by item
calendar() %>%
  cal_schedules(
    title = "R - introduction",
    body = "What is R?",
    start = format(Sys.Date(), "%Y-%m-03 08:00:00"),
    end = format(Sys.Date(), "%Y-%m-03 12:00:00"),
    category = "time"
  ) %>%
  cal_schedules(
    title = "R - visualisation",
    body = "With ggplot2",
    start = format(Sys.Date(), "%Y-%m-05 08:00:00"),
    end = format(Sys.Date(), "%Y-%m-05 12:00:00"),
    category = "time"
  ) %>%
  cal_schedules(
    title = "Build first package",
    body = "Build first package",
    start = format(Sys.Date(), "%Y-%m-12"),
    end = format(Sys.Date(), "%Y-%m-18"),
    category = "allday"
  ) %>%
  cal_schedules(
    title = "Lunch",
    body = "With friends",
    start = format(Sys.Date(), "%Y-%m-15 12:00:00"),
    end = format(Sys.Date(), "%Y-%m-15 14:00:00"),
    category = "time"
  )


