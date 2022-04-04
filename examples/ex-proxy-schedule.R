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
