library(shiny)
library(toastui)
library(lubridate)

ui <- fluidPage(
  tags$h2("Custom click event"),
  fluidRow(
    column(
      width = 8,
      calendarOutput(outputId = "cal")
    ),
    column(
      width = 4,
      verbatimTextOutput("click")
    )
  )
)

server <- function(input, output, session) {
  
  output$cal <- renderCalendar({
    calendar(
      isReadOnly = FALSE, 
      useDetailPopup = FALSE, 
      useCreationPopup = FALSE
    ) %>%
      cal_events(
        selectDateTime = JS("function(info) {Shiny.setInputValue('selection', info);}")
      )
  })
  
  observeEvent(input$selection, {
    showModal(modalDialog(
      title = "Create event",
      footer = NULL,
      easyClose = TRUE,
      tagList(
        "Create an event from", 
        tags$b(with_tz(as_datetime(input$selection$start), "Europe/Paris")),
        " to ",
        tags$b(with_tz(as_datetime(input$selection$end), "Europe/Paris")),
        "?"
      ),
      tags$br(),
      splitLayout(
        actionButton(
          inputId = "create",
          label = "Yes, create",
          width = "100%"
        ),
        actionButton(
          inputId = "nope",
          label = "No, cancel",
          width = "100%"
        )
      )
    ))
    cal_proxy_clear_selection("cal")
  })
  
  observeEvent(input$nope, removeModal())
  
  observeEvent(input$create, {
    cal_proxy_add("cal", list(
      start = with_tz(as_datetime(input$selection$start), "Europe/Paris"),
      end = with_tz(as_datetime(input$selection$end), "Europe/Paris"),
      title = "My new event",
      body = "Some description"
    ))
    removeModal()
  })
  
  output$click <- renderPrint({
    input$selection
  })
  
  
}

shinyApp(ui, server)
  
