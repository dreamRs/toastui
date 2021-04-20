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
