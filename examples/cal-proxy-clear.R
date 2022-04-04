
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
