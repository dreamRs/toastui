library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("Shiny: use built-in navigation buttons"),

  fluidRow(
    column(
      width = 9,
      calendarOutput("my_calendar")
    ),
    column(
      width = 3,
      verbatimTextOutput("result")
    )
  )

)

server <- function(input, output) {

  output$my_calendar <- renderCalendar({
    cal <- calendar(
      defaultDate = Sys.Date(),
      useNavigation = TRUE
    )
  })

  output$result <- renderPrint({
    input$my_calendar_dates
  })

}

if (interactive())
  shinyApp(ui = ui, server = server)
