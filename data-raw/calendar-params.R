

# Schedules properties ----------------------------------------------------

library(rvest)

schedules_properties <- read_html("https://nhn.github.io/tui.calendar/latest/EventObject") %>%
  html_table()
schedules_properties <- schedules_properties[[1]]
schedules_properties <- as.data.frame(schedules_properties)

usethis::use_data(schedules_properties, overwrite = TRUE)



# Calendar properties -----------------------------------------------------

library(rvest)

calendar_properties <- read_html("https://nhn.github.io/tui.calendar/latest/CalendarInfo") %>%
  html_table()
calendar_properties <- calendar_properties[[1]]
calendar_properties <- as.data.frame(calendar_properties)

usethis::use_data(calendar_properties, overwrite = TRUE)
