

library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("Add schedule(s) into calendar with proxy"),
  fluidRow(
    column(
      width = 4,
      actionButton(
        inputId = "add", 
        label = "Add random schedule"
      ),
      actionButton(
        inputId = "clear", 
        label = "Clear all",
        class = "btn-danger"
      )
    ),
    column(
      width = 4,
      numericInput(
        inputId = "id", 
        label = "Delete specific schedule: e.g. 1, 2, 3, ...", 
        value = 1,
        width = "100%"
      )
    ),
    column(
      width = 4,
      tags$b("Then click:"),
      tags$br(),
      actionButton(
        inputId = "delete", 
        label = "Delete schedule",
        class = "btn-danger"
      )
    )
  ),
  calendarOutput(outputId = "my_calendar")
)

server <- function(input, output, session) {
  
  output$my_calendar <- renderCalendar({
    calendar(useNavigation = TRUE) %>% 
      cal_props(id = "a", name = "Schedule A", color = "#FFF", bgColor = "#E41A1C") %>% 
      cal_props(id = "b", name = "Schedule B", color = "#FFF", bgColor = "#377EB8") %>% 
      cal_props(id = "c", name = "Schedule C", color = "#FFF", bgColor = "#4DAF4A")
  })
  
  observeEvent(input$add, {
    my_date <- sample(seq(
      from = Sys.Date() - 15,
      to = Sys.Date() + 15,
      by = "1 day"
    ), 1)
    calendar_proxy("my_calendar") %>% 
      cal_proxy_add(
        list(
          id = input$add,
          calendarId = sample(c("a", "b", "c"), 1),
          title = paste("Schedule", input$add), 
          body = paste("What i'm going todo in schedule", input$add),
          start = my_date,
          end = my_date,
          category = "allday"
        )
      )
  })
  
  observeEvent(input$clear, cal_proxy_clear("my_calendar"))
  
  observe(updateActionButton(session, "delete", paste("Delete schedule", input$id)))
  
  observeEvent(input$delete, {
    calendarProxy("my_calendar") %>% 
      cal_proxy_delete(calendarId = "a", id = input$id) %>% # to be sure, we remove from all calendars
      cal_proxy_delete(calendarId = "b", id = input$id) %>% 
      cal_proxy_delete(calendarId = "c", id = input$id)
  })
  
}

if (interactive())
  shinyApp(ui, server)
