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
    calendar(cal_demo_data(), useNavigation = TRUE) %>%
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
