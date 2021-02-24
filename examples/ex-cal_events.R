library(shiny)
library(toastui)

calendarProps <- data.frame(
  id = c("1", "2", "3"),
  name = c("TODO", "Meetings", "Tasks"),
  color = c("#FFF", "#FFF", "#000"),
  bgColor = c("#E41A1C", "#377EB8", "#4DAF4A"),
  borderColor = c("#a90000", "#005288", "#0a7f1c")
)

ui <- fluidPage(
  tags$h2("Custom click event"),
  calendarOutput(outputId = "cal")
)

server <- function(input, output, session) {

  output$cal <- renderCalendar({

    n <- 20

    date_start <- sample(
      seq(from = as.POSIXct(Sys.Date()-14), by = "1 hour", length.out = 24*7*4),
      n, TRUE
    )
    date_end <- date_start + sample(1:25, n, TRUE) * 3600
    schedules <- data.frame(
      id = 1:n,
      calendarId = as.character(sample(1:3, n, TRUE)),
      title = LETTERS[1:n],
      body = paste("Body schedule", letters[1:n]),
      start = format(date_start, format = "%Y-%m-%dT%H:%00:%00"),
      end = format(date_end, format = "%Y-%m-%dT%H:%00:%00"),
      category = sample(c("allday", "time", "task"), n, TRUE),
      stringsAsFactors = FALSE
    )

    calendar(taskView = TRUE, scheduleView = c("time", "allday")) %>%
      cal_props(df = calendarProps) %>%
      cal_schedules(df = schedules) %>%
      cal_events(
        clickSchedule = JS("function(event) {alert(event.schedule.id);}")
      )
  })


}

if (interactive())
  shinyApp(ui, server)
