library(shiny)
library(toastui)

ui <- fillPage(
  checkboxInput(
    inputId = "cal_navigation",
    label = "Navigation",
    value = TRUE),
  calendarOutput("cal_main")
)

server <- shinyServer(function(input, output) {
  output$cal_main <- renderCalendar({
    calendar(cal_demo_data(), navigation = TRUE)
  })

  observeEvent(input$cal_navigation, {
    cal_proxy_navigation("cal_main", navigation = input$cal_navigation)
  })

})

if (interactive())
  shinyApp(ui, server)
