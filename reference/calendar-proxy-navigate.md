# Navigate into a calendar with Proxy

Those functions allow to navigate in the calendar from the server in a
Shiny application.

## Usage

``` r
cal_proxy_next(proxy)

cal_proxy_prev(proxy)

cal_proxy_today(proxy)

cal_proxy_date(proxy, date)
```

## Arguments

- proxy:

  A
  [`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)
  `htmlwidget` object.

- date:

  A specific date to navigate to.

## Value

A `calendar_proxy` object.

## See also

Other calendar proxy methods:
[`cal_proxy_clear()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear.md),
[`cal_proxy_clear_selection()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear_selection.md),
[`cal_proxy_options()`](https://dreamrs.github.io/toastui/reference/cal_proxy_options.md),
[`cal_proxy_toggle()`](https://dreamrs.github.io/toastui/reference/cal_proxy_toggle.md),
[`cal_proxy_view()`](https://dreamrs.github.io/toastui/reference/cal_proxy_view.md),
[`calendar-proxy-schedule`](https://dreamrs.github.io/toastui/reference/calendar-proxy-schedule.md),
[`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)

## Examples

``` r
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("Navigate in calendar with actionButtons"),
  actionButton(
    inputId = "prev_date",
    label = "Previous",
    icon = icon("chevron-left")
  ),
  actionButton(
    inputId = "next_date",
    label = "Next",
    icon = icon("chevron-right")
  ),
  actionButton(
    inputId = "today",
    label = "Today"
  ),
  fluidRow(
    column(
      width = 9,
      calendarOutput(outputId = "my_calendar")
    ),
    column(
      width = 3,
      verbatimTextOutput("result")
    )
  )
)

server <- function(input, output, session) {

  output$my_calendar <- renderCalendar({
    calendar()
  })

  output$result <- renderPrint({
    input$my_calendar_dates
  })

  observeEvent(input$prev_date, cal_proxy_prev("my_calendar"))
  observeEvent(input$next_date, cal_proxy_next("my_calendar"))
  observeEvent(input$today, cal_proxy_today("my_calendar"))

}


if (interactive())
  shinyApp(ui, server)
```
