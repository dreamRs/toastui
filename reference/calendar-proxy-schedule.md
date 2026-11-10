# Create / Update / Delete schedule(s) with Proxy

These functions allow to create new schedule(s), update existing ones
and delete schedule in a calendar within the server in a Shiny
application.

## Usage

``` r
cal_proxy_add(proxy, value)

cal_proxy_delete(proxy, value)

cal_proxy_update(proxy, value)
```

## Arguments

- proxy:

  A
  [`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)
  `htmlwidget` object.

- value:

  A `list` with schedules data.

## Value

A `calendar_proxy` object.

## Note

Those functions are intended to be used with corresponding input value:

- `input$<outputId>_add`: triggered when a schedule is added on calendar
  via creation popup.

- `input$<outputId>_update`: triggered when an existing schedule is
  edited.

- `input$<outputId>_deleted`: triggered when a schedule is deleted.

## See also

Other calendar proxy methods:
[`cal_proxy_clear()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear.md),
[`cal_proxy_clear_selection()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear_selection.md),
[`cal_proxy_options()`](https://dreamrs.github.io/toastui/reference/cal_proxy_options.md),
[`cal_proxy_toggle()`](https://dreamrs.github.io/toastui/reference/cal_proxy_toggle.md),
[`cal_proxy_view()`](https://dreamrs.github.io/toastui/reference/cal_proxy_view.md),
[`calendar-proxy-navigate`](https://dreamrs.github.io/toastui/reference/calendar-proxy-navigate.md),
[`calendar_proxy()`](https://dreamrs.github.io/toastui/reference/calendar_proxy.md)

## Examples

``` r
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("Add, Update and Delete schedule interactively"),

  tags$p(
    "Click on the calendar to create a new schedule",
    "then you will be able to edit or delete it."
  ),

  calendarOutput("my_calendar")
)

server <- function(input, output) {

  output$my_calendar <- renderCalendar({
    cal <- calendar(
      defaultDate = Sys.Date(),
      navigation = TRUE,
      isReadOnly = FALSE,
      useCreationPopup = TRUE
    )
  })

  observeEvent(input$my_calendar_add, {
    str(input$my_calendar_add)
    cal_proxy_add("my_calendar", input$my_calendar_add)
  })

  observeEvent(input$my_calendar_update, {
    str(input$my_calendar_update)
    cal_proxy_update("my_calendar", input$my_calendar_update)
  })

  observeEvent(input$my_calendar_delete, {
    str(input$my_calendar_delete)
    cal_proxy_delete("my_calendar", input$my_calendar_delete)
  })

}

if (interactive())
  shinyApp(ui = ui, server = server)
```
