
# props -------------------------------------------------------------------

my_props <- list(
  id = "1",
  name = "PERSO",
  color = "white",
  bgColor = "steelblue",
  borderColor = "steelblue"
)

props1 <- calendar() %>% 
  cal_props(my_props)
expect_inherits(props1, "calendar")
expect_inherits(props1$x$options$calendars, "list")
expect_identical(props1$x$options$calendars[[1]], my_props)

props2 <- calendar() %>% 
  cal_props(as.data.frame(my_props, stringsAsFactors = FALSE))
expect_inherits(props2, "calendar")
expect_inherits(props2$x$options$calendars, "list")
expect_identical(props2$x$options$calendars[[1]], my_props)



# schedules ---------------------------------------------------------------

my_schedule <- data.frame(
  id = "schedule_1",
  title = "R - introduction",
  body = "What is R?",
  start = format(Sys.Date(), "%Y-%m-03 08:00:00"),
  end = format(Sys.Date(), "%Y-%m-03 12:00:00"),
  category = "time",
  stringsAsFactors = FALSE
)

schedules1 <- calendar() %>%
  cal_schedules(
    id = my_schedule$id,
    title = my_schedule$title,
    body = my_schedule$body,
    start = my_schedule$start,
    end = my_schedule$end,
    category = my_schedule$category
  )

expect_inherits(schedules1, "calendar")
expect_inherits(schedules1$x$schedules, "list")
expect_inherits(schedules1$x$schedules[[1]], "list")


schedules2 <- calendar() %>%
  cal_schedules(my_schedule)

expect_inherits(schedules2, "calendar")
expect_inherits(schedules2$x$schedules, "list")
expect_inherits(schedules2$x$schedules[[1]], "list")

expect_identical(schedules1$x$schedules[[1]], schedules2$x$schedules[[1]])



# options -----------------------------------------------------------------

opts_month <- calendar(view = "month") %>% 
  cal_month_options(startDayOfWeek = 3, narrowWeekend = TRUE)
expect_inherits(opts_month, "calendar")
expect_inherits(opts_month$x$options$month, "list")
expect_identical(opts_month$x$options$month$startDayOfWeek, 3)
expect_identical(opts_month$x$options$month$narrowWeekend, TRUE)

opts_week <- calendar(view = "week") %>% 
  cal_week_options(startDayOfWeek = 3, narrowWeekend = TRUE)
expect_inherits(opts_week, "calendar")
expect_inherits(opts_week$x$options$week, "list")
expect_identical(opts_week$x$options$week$startDayOfWeek, 3)
expect_identical(opts_week$x$options$week$narrowWeekend, TRUE)



# utils -------------------------------------------------------------------

cal_ <- calendar() %>% 
  cal_events(afterRenderSchedule = JS("function() {}"))
expect_inherits(cal_, "calendar")
expect_inherits(cal_$x$events, "list")
expect_false(is.null(cal_$x$events$afterRenderSchedule))


cal_ <- calendar() %>% 
  cal_theme(common.border = "2px solid #E5E9F0")
expect_inherits(cal_, "calendar")
expect_inherits(cal_$x$options$theme, "list")
expect_identical(cal_$x$options$theme$common.border, "2px solid #E5E9F0")


cal_ <- calendar(view = "week", taskView = TRUE) %>%
  cal_template(
    milestoneTitle = "TODO",
    taskTitle = "Assignment",
    alldayTitle = "Full-time"
  )
expect_inherits(cal_, "calendar")
expect_inherits(cal_$x$options$template, "list")
expect_false(is.null(cal_$x$options$template$milestoneTitle))



# Demo data ---------------------------------------------------------------

expect_inherits(cal_demo_data(view = "month"), "data.frame")
expect_inherits(cal_demo_data(view = "week"), "data.frame")

expect_true(hasName(cal_demo_data(view = "month"), "start"))
expect_true(hasName(cal_demo_data(view = "month"), "end"))
expect_true(hasName(cal_demo_data(view = "week"), "start"))
expect_true(hasName(cal_demo_data(view = "week"), "end"))

expect_inherits(cal_demo_props(), "data.frame")

expect_true(hasName(cal_demo_props(), "id"))
expect_true(hasName(cal_demo_props(), "name"))
