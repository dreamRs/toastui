# Toggle schedules visibility with Proxy

This function allow to show or hide schedules based on their calendar's
ID.

## Usage

``` r
cal_proxy_toggle(proxy, calendarId, toHide = TRUE)
```

## Arguments

- proxy:

  A
  [`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)
  `htmlwidget` object.

- calendarId:

  One or several calendar IDs to toggle.

- toHide:

  Logical, show or hide schedules with provided calendar IDs.

## Value

A `calendar_proxy` object.

## See also

Other calendar proxy methods:
[`cal_proxy_clear()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear.md),
[`cal_proxy_clear_selection()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear_selection.md),
[`cal_proxy_options()`](https://dreamrs.github.io/toastui/reference/cal_proxy_options.md),
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
      width = 2,
      tags$h4("Checkbox logic :"),
      checkboxGroupInput(
        inputId = "calendarId",
        label = "Calendars to show:",
        choices = list(
          "Perso" = "1",
          "Work" = "2",
          "Courses" = "3"
        ),
        selected = 1:3
      ),
      tags$h4("Button logic :"),
      actionButton("cal_1", "Perso", class= "btn-block"),
      actionButton("cal_2", "Work", class= "btn-block"),
      actionButton("cal_3", "Courses", class= "btn-block")
    ),
    column(
      width = 10,
      tags$h2("Show / Hide schedules by calendarId"),
      calendarOutput(outputId = "cal"),
      uiOutput("ui")
    )
  )
)

server <- function(input, output, session) {
  
  output$cal <- renderCalendar({
    calendar(view = "month", taskView = TRUE, useDetailPopup = FALSE) %>% 
      cal_props(cal_demo_props()) %>% 
      cal_schedules(cal_demo_data())
  })

  # With checkbox
  observeEvent(input$calendarId, {
    cal_proxy_toggle("cal", input$calendarId, toHide = TRUE)
    cal_proxy_toggle("cal", setdiff(1:3, input$calendarId), toHide = FALSE)
  }, ignoreInit = TRUE, ignoreNULL = FALSE)
  
  # With buttons
  observeEvent(input$cal_1, {
    cal_proxy_toggle("cal", "1", toHide = input$cal_1 %% 2 == 1)
  }, ignoreInit = TRUE)
  observeEvent(input$cal_2, {
    cal_proxy_toggle("cal", "2", toHide = input$cal_2 %% 2 == 1)
  }, ignoreInit = TRUE)
  observeEvent(input$cal_3, {
    cal_proxy_toggle("cal", "3", toHide = input$cal_3 %% 2 == 1)
  }, ignoreInit = TRUE)
  
}

if (interactive())
  shinyApp(ui, server)
```
