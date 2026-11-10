# Clear calendar with Proxy

This function allow to delete all schedules and clear view.

## Usage

``` r
cal_proxy_clear(proxy)
```

## Arguments

- proxy:

  A
  [`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)
  `htmlwidget` object.

## Value

A `calendar_proxy` object.

## See also

Other calendar proxy methods:
[`cal_proxy_clear_selection()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear_selection.md),
[`cal_proxy_options()`](https://dreamrs.github.io/toastui/reference/cal_proxy_options.md),
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
  tags$h2("Clear all schedules"),
  actionButton("clear", "Clear all", class = "btn-block btn-danger"),
  calendarOutput("my_calendar")
)

server <- function(input, output, session) {

  output$my_calendar <- renderCalendar({
    calendar(cal_demo_data(), navigation = FALSE)
  })

  observeEvent(input$clear, cal_proxy_clear("my_calendar"))
}

if (interactive())
  shinyApp(ui, server)
```
