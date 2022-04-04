

library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("Add schedule(s) into calendar with proxy"),
  fluidRow(
    column(
      width = 4,
      actionButton(
        inputId = "add",
        label = "Add multiple schedules"
      ),
      actionButton(
        inputId = "clear",
        label = "Clear all",
        class = "btn-danger"
      )
    )
  ),
  calendarOutput(outputId = "my_calendar")
)

server <- function(input, output, session) {

  output$my_calendar <- renderCalendar({
    calendar(navigation = TRUE) %>%
      cal_props(id = "a", name = "Schedule A", color = "#FFF", bgColor = "#E41A1C") %>%
      cal_props(id = "b", name = "Schedule B", color = "#FFF", bgColor = "#377EB8") %>%
      cal_props(id = "c", name = "Schedule C", color = "#FFF", bgColor = "#4DAF4A")
  })

  observeEvent(input$add, {
    n <- sample(c(2, 5, 10), 1) # number of schedules to add
    my_date <- sample(seq(
      from = Sys.Date() - 15,
      to = Sys.Date() + 15,
      by = "1 day"
    ), n)
    schedules <- data.frame(
      id = sample.int(1e6, n),
      calendarId = sample(c("a", "b", "c"), n, TRUE),
      title = "Schedule",
      body = "Content",
      start = my_date,
      end = my_date,
      category = "allday"
    )

    cal_proxy_add(
      proxy = "my_calendar",
      value = schedules
    )

  })

  observeEvent(input$clear, cal_proxy_clear("my_calendar"))

}

if (interactive())
  shinyApp(ui, server)
