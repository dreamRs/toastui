
library(shiny)
library(toastui)

ui <- fluidPage(
  fluidRow(
    column(
      width = 4,
      checkboxInput(
        inputId = "narrowWeekend",
        label = "narrowWeekend ?",
        value = FALSE
      ),
      checkboxInput(
        inputId = "workweek",
        label = "workweek ?",
        value = FALSE
      )
    ),
    column(
      width = 8,
      calendarOutput("mycal")
    )
  )
)

server <- function(input, output, session) {
  
  output$mycal <- renderCalendar({
    calendar(cal_demo_data(), view = "month")
  })
  
  observeEvent(input$narrowWeekend, {
    cal_proxy_options("mycal", month = list(narrowWeekend = input$narrowWeekend))
  })
  
  observeEvent(input$workweek, {
    cal_proxy_options("mycal", month = list(workweek = input$workweek))
  })
}

if (interactive())
  shinyApp(ui, server)

