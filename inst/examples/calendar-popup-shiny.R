
# Calendar: custom popup --------------------------------------------------


library(shiny)
library(toastui)

## Schedules data
schedules <- cal_demo_data()
# add an id
schedules$id <- seq_len(nrow(schedules))
# add custom data in "raw" attribute
schedules$raw <- lapply(
  X = seq_len(nrow(schedules)),
  FUN = function(i) {
    list(
      status = sample(c("Completed", "In progress", "Closed"), 1)
    )
  }
)



## App

ui <- fluidPage(
  fluidRow(
    column(
      width = 8, offset = 2,
      tags$h2("Custom popup made with Shiny"),
      calendarOutput(outputId = "cal"),
      uiOutput("ui")
    )
  )
)

server <- function(input, output, session) {
  
  output$cal <- renderCalendar({
    calendar(view = "month", taskView = TRUE, useDetailPopup = FALSE) %>% 
      cal_props(cal_demo_props()) %>% 
      cal_schedules(schedules) %>%
      cal_events(
        clickSchedule = JS(
          "function(event) {", 
          "Shiny.setInputValue('calendar_id_click', {id: event.schedule.id, x: event.event.clientX, y: event.event.clientY});", 
          "}"
        )
      )
  })
  
  
  observeEvent(input$calendar_id_click, {
    removeUI(selector = "#custom_popup")
    id <- as.numeric(input$calendar_id_click$id)
    # Get the appropriate line clicked
    sched <- schedules[schedules$id == id, ]
    
    insertUI(
      selector = "body",
      ui = absolutePanel(
        id = "custom_popup",
        top = input$calendar_id_click$y,
        left = input$calendar_id_click$x, 
        draggable = FALSE,
        width = "300px",
        tags$div(
          style = "background: #FFF; padding: 10px; box-shadow: 0px 0.2em 0.4em rgb(0, 0, 0, 0.8); border-radius: 5px;",
          actionLink(
            inputId = "close_calendar_panel", 
            label = NULL, 
            icon = icon("close"), 
            style = "position: absolute; top: 5px; right: 5px;"
          ),
          tags$br(),
          tags$div(
            style = "text-align: center;",
            tags$p(
              "Here you can put custom", tags$b("HTML"), "elements."
            ),
            tags$p(
              "You clicked on schedule", sched$id, 
              "starting from", sched$start,
              "ending", sched$end
            ),
            tags$b("Current status:"), tags$span(class = "label label-primary", sched$raw[[1]]$status),
            radioButtons(
              inputId = "status",
              label = "New status:",
              choices = c("Completed", "In progress", "Closed"),
              selected = sched$raw[[1]]$status
            )
          )
        )
      )
    )
  })
  
  observeEvent(input$close_calendar_panel, {
    removeUI(selector = "#custom_popup")
  })
  
  rv <- reactiveValues(id = NULL, status = NULL)
  observeEvent(input$status, {
    rv$id <- input$calendar_id_click$id
    rv$status <- input$status
  })
  
  output$ui <- renderUI({
    tags$div(
      "Schedule", tags$b(rv$id), "has been updated with status", tags$b(rv$status)
    )
  })
  
}

shinyApp(ui, server)
