
# Default: monthly view
calendar()

# Weekly view
calendar(view = "week")

# Or only day:
calendar(view = "day")

# Add navigation buttons
calendar(useNavigation = TRUE)

# Add schedules data
ex_data <- cal_demo_data()
calendar(ex_data)


# By default detail popup is activated
# you can click on a schedule to view detail
calendar(useDetailPopup = TRUE) %>%
  cal_schedules(
    title = "My schedule",
    body = "Some detail about it",
    start = format(Sys.Date(), "%Y-%m-03"),
    end = format(Sys.Date(), "%Y-%m-04"),
    category = "allday"
  )

# to disable it use useDetailPopup = FALSE

# You can use HTML tags inside it:
library(htmltools)
calendar(useDetailPopup = TRUE) %>%
  cal_schedules(
    title = "My schedule",
    body = doRenderTags(tags$div(
      tags$h3("Title for my schedule"),
      tags$p(
        "Yan can write", tags$em("custom"), tags$b("HTML"),
        "in a popup !"
      ),
      tags$p(
        style = "color: firebrick;",
        "For example write in red !"
      ),
      tags$ul(
        tags$li("Or make a bullet list!"),
        tags$li("With another item"),
        tags$li("And one more")
      )
    )),
    start = format(Sys.Date(), "%Y-%m-03"),
    end = format(Sys.Date(), "%Y-%m-04"),
    category = "allday"
  )
