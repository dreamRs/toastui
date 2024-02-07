library(shiny)
library(toastui)

calendarProps <- data.frame(
  id = paste0("cal_", 1:3),
  name = c("TODO", "Meetings", "Tasks"),
  color = c("#FFF", "#FFF", "#000"),
  backgroundColor = c("#E41A1C", "#377EB8", "#4DAF4A"),
  borderColor = c("#a90000", "#005288", "#0a7f1c")
)

n <- 20
date_start <- sample(
  seq(from = as.POSIXct(Sys.Date()-14), by = "1 hour", length.out = 24*7*4),
  n, TRUE
)
date_end <- date_start + sample(1:25, n, TRUE) * 3600
schedules <- data.frame(
  id = paste0("event_", 1:n),
  calendarId = paste0("cal_", sample(1:3, n, TRUE)),
  title = LETTERS[1:n],
  body = paste("Body schedule", letters[1:n]),
  start = format(date_start, format = "%Y-%m-%d %H:00:00"),
  end = format(date_end, format = "%Y-%m-%d %H:00:00"),
  category = sample(c("allday", "time", "task"), n, TRUE),
  stringsAsFactors = FALSE
)

ui <- fluidPage(
  tags$h2("Custom click event"),
  fluidRow(
    column(
      width = 8,
      calendarOutput(outputId = "cal")
    ),
    column(
      width = 4,
      verbatimTextOutput(outputId = "res_click")
    )
  )
)

server <- function(input, output, session) {
  
  output$cal <- renderCalendar({
    calendar(useDetailPopup = FALSE) %>%
      cal_props(calendarProps) %>%
      cal_schedules(schedules) %>%
      cal_events(
        clickSchedule = JS("function(event) {Shiny.setInputValue('click', event)}")
      )
  })
  
  output$res_click <- renderPrint(input$click)
  
}

if (interactive())
  shinyApp(ui, server)
