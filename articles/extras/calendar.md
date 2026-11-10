# Calendar

``` r

library(toastui)
```

## Usage

Create interactive calendars with:

``` r

calendar()
```

You can display calendars in interactive R Markdown documents or Shiny
applications:

- R Markdown: display calendars that you can navigate and click on
  schedules to display extra information.
- Shiny: display calendars where you can edit, update and drag-and-drop
  schedules.

## Monthly calendar

Create a monthly calendar:

- [`cal_demo_data()`](https://dreamrs.github.io/toastui/reference/cal-demo-data.md)
  return a `data.frame` with schedules example
- `useNavigation = TRUE`: add navigation buttons to change the month
  displayed
- [`cal_month_options()`](https://dreamrs.github.io/toastui/reference/cal_month_options.md):
  global options for calendar
- [`cal_props()`](https://dreamrs.github.io/toastui/reference/cal_props.md):
  set properties for schedules groups (background and text color …)

``` r

calendar(cal_demo_data(), navigation = TRUE, defaultDate = Sys.Date()) %>%
  cal_month_options(
    startDayOfWeek  = 1, 
    narrowWeekend = TRUE
  ) %>% 
  cal_props(cal_demo_props())
```

Today

  

## Weekly calendar

Create a weekly calendar:

- `cal_demo_data("week")` return a `data.frame` with schedules example
  for week
- `view = "week"`: activate week view for calendar
- `defaultDate = Sys.Date()`: force calendar to show the specified date
  (otherwise it shows the current date)
- [`cal_week_options()`](https://dreamrs.github.io/toastui/reference/cal_week_options.md):
  global options for calendar
- [`cal_props()`](https://dreamrs.github.io/toastui/reference/cal_props.md):
  set properties for schedules groups (background and text color …)

``` r

calendar(cal_demo_data("week"), view = "week", defaultDate = Sys.Date()) %>% 
  cal_week_options(
    startDayOfWeek = 1,
    workweek = TRUE
  ) %>% 
  cal_props(cal_demo_props())
```

Today

  

## Schedules

To add schedules into a calendar who can pass a `data.frame` as first
argument to
[`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md),
or use
[`cal_schedules()`](https://dreamrs.github.io/toastui/reference/cal_schedules.md)
:

``` r

# Define directly schedules properties
calendar() %>%
  cal_schedules(
    title = "My schedule",
    start = format(Sys.Date(), "%Y-%m-03 00:00:00"),
    end = format(Sys.Date(), "%Y-%m-17 00:00:00")
  )

# Or you can use a data.frame
my_calendar_data <- data.frame(
  title = "My schedule",
  start = format(Sys.Date(), "%Y-%m-03 00:00:00"),
  end = format(Sys.Date(), "%Y-%m-17 00:00:00")
)
calendar() %>%
  cal_schedules(
    my_calendar_data
  )
```

Properties for schedules are described in table below:

## Calendar properties

Calendar properties can be used to set common appearance to a group of
schedules with the same `calendarId`.

``` r

calendar() %>%
  cal_schedules(
    title = "My schedule",
    calendarId = 123, # <-- set a calendarId
    start = format(Sys.Date(), "%Y-%m-03 00:00:00"),
    end = format(Sys.Date(), "%Y-%m-17 00:00:00")
  ) %>% 
  cal_props(
    id = 123, # <-- reference to schedules' calendarId
    name = "My Calendar",
    color = "white",
    backgroundColor = "darkorange",
    borderColor = "darkorange"
  )
```

Properties for calendars are described in table below:
