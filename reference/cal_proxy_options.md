# Set calendar's options with Proxy

This function allow to set options for a calendar.

## Usage

``` r
cal_proxy_options(proxy, ...)
```

## Arguments

- proxy:

  A
  [`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)
  `htmlwidget` object.

- ...:

  Options for the calendar, you can use arguments from
  [`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md),
  [`cal_month_options()`](https://dreamrs.github.io/toastui/reference/cal_month_options.md)
  (under the form `month = list(...)`),
  [`cal_week_options()`](https://dreamrs.github.io/toastui/reference/cal_week_options.md)
  (under the form `week = list(...)`)

## Value

A `calendar_proxy` object.

## See also

Other calendar proxy methods:
[`cal_proxy_clear()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear.md),
[`cal_proxy_clear_selection()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear_selection.md),
[`cal_proxy_toggle()`](https://dreamrs.github.io/toastui/reference/cal_proxy_toggle.md),
[`cal_proxy_view()`](https://dreamrs.github.io/toastui/reference/cal_proxy_view.md),
[`calendar-proxy-navigate`](https://dreamrs.github.io/toastui/reference/calendar-proxy-navigate.md),
[`calendar-proxy-schedule`](https://dreamrs.github.io/toastui/reference/calendar-proxy-schedule.md),
[`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)

## Examples

``` r

library(shiny)
library(toastui)

ui <- fluidPage(
  fluidRow(
    column(
      width = 4,
      checkboxInput(
        inputId = "narrowWeekend",
        label = "narrowWeekend ?",
        value = FALSE
      ),
      checkboxInput(
        inputId = "workweek",
        label = "workweek ?",
        value = FALSE
      )
    ),
    column(
      width = 8,
      calendarOutput("mycal")
    )
  )
)

server <- function(input, output, session) {
  
  output$mycal <- renderCalendar({
    calendar(cal_demo_data(), view = "month")
  })
  
  observeEvent(input$narrowWeekend, {
    cal_proxy_options("mycal", month = list(narrowWeekend = input$narrowWeekend))
  })
  
  observeEvent(input$workweek, {
    cal_proxy_options("mycal", month = list(workweek = input$workweek))
  })
}

if (interactive())
  shinyApp(ui, server)
```
