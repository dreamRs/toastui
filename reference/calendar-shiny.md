# Shiny bindings for [`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md)

Output and render functions for using
[`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md)
within Shiny applications and interactive Rmd documents.

## Usage

``` r
calendarOutput(outputId, width = "100%", height = "600px")

renderCalendar(expr, env = parent.frame(), quoted = FALSE)
```

## Arguments

- outputId:

  Output variable to read from.

- width, height:

  Must be a valid CSS unit (like `100%`, `400px`, `auto`) or a number,
  which will be coerced to a string and have `px` appended.

- expr:

  An expression that generates a calendar

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.

## Value

Output element that can be included in UI. Render function to create
output in server.

## Special inputs

The following `input` values will be accessible in the server:

- **input\$outputId_add** : contain data about schedule added via the
  creation popup. Javascript event: `beforeCreateSchedule`.

- **input\$outputId_schedules** : contain data about last schedule
  added. Javascript event: `afterRenderSchedule`.

- **input\$outputId_click** : contain data about schedule user click on.
  Javascript event: `clickSchedule`.

- **input\$outputId_delete** : contain data about schedule deleted by
  user via creation popup. Javascript event: `beforeDeleteSchedule`.

- **input\$outputId_update** : contain data about schedule updated by
  user via creation popup. Javascript event: `beforeUpdateSchedule`.

- **input\$outputId_dates** : start and end date represented in the
  calendar.

To use them you need to replace `outputId` by the id you've used to
create the calendar. If you use one of the above javascript event in
[`cal_events()`](https://dreamrs.github.io/toastui/reference/cal_events.md),
the input won't be accessible.

## Examples

``` r
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("calendar shiny example"),
  fluidRow(
    column(
      width = 8,
      calendarOutput("my_calendar")
    ),
    column(
      width = 4,
      tags$b("Dates:"),
      verbatimTextOutput("dates"),
      tags$b("Clicked schedule:"),
      verbatimTextOutput("click")
    )
  )
)

server <- function(input, output, session) {

  output$my_calendar <- renderCalendar({
    calendar(cal_demo_data(), navigation = TRUE) %>%
      cal_props(
        list(
          id = 1,
          name = "PERSO",
          color = "white",
          bgColor = "firebrick",
          borderColor = "firebrick"
        ),
        list(
          id = 2,
          name = "WORK",
          color = "white",
          bgColor = "forestgreen",
          borderColor = "forestgreen"
        )
      )
  })

  output$dates <- renderPrint({
    input$my_calendar_dates
  })

  output$click <- renderPrint({
    input$my_calendar_click
  })

}

if (interactive())
  shinyApp(ui, server)
```
