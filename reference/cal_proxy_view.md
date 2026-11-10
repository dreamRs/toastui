# Change calendar view with Proxy

This function allow to change the calendar view from the server in a
Shiny application.

## Usage

``` r
cal_proxy_view(proxy, view)
```

## Arguments

- proxy:

  A
  [`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)
  `htmlwidget` object.

- view:

  The new view for the calendar: "day", "week" or "month".

## Value

A `calendar_proxy` object.

## See also

Other calendar proxy methods:
[`cal_proxy_clear()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear.md),
[`cal_proxy_clear_selection()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear_selection.md),
[`cal_proxy_options()`](https://dreamrs.github.io/toastui/reference/cal_proxy_options.md),
[`cal_proxy_toggle()`](https://dreamrs.github.io/toastui/reference/cal_proxy_toggle.md),
[`calendar-proxy-navigate`](https://dreamrs.github.io/toastui/reference/calendar-proxy-navigate.md),
[`calendar-proxy-schedule`](https://dreamrs.github.io/toastui/reference/calendar-proxy-schedule.md),
[`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)

## Examples

``` r
library(shiny)

ui <- fluidPage(
  tags$h2("Change calendar view"),
  radioButtons(
    inputId = "view",
    label = "Change view:",
    choices = c("day", "week", "month"),
    inline = TRUE
  ),
  calendarOutput(outputId = "my_calendar")
)

server <- function(input, output, session) {

  output$my_calendar <- renderCalendar({
    calendar(view = "day", scheduleView = "allday") %>%
      cal_schedules(
        title = "Today planning",
        start = Sys.Date(),
        end = Sys.Date(),
        category = "allday"
      )
  })

  observeEvent(
    input$view,
    cal_proxy_view("my_calendar", input$view),
    ignoreInit = TRUE
  )

}


if (interactive())
  shinyApp(ui, server)
```
