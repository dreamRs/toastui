library(toastui)

dat <- data.frame(
  date = Sys.Date() + 1:10,
  month = format(Sys.Date() + 1:10, format = "%Y-%m"),
  year = format(Sys.Date() + 1:10, format = "%Y"),
  time1 = Sys.time() + 1:10,
  time2 = Sys.time() + 1:10
)


datagrid(dat) %>% 
  grid_editor_date(
    column = "date"
  ) %>% 
  grid_editor_date(
    column = "month",
    type = "month",
    format = "yyyy-MM"
  ) %>% 
  grid_editor_date(
    column = "year",
    type = "year",
    format = "yyyy"
  ) %>% 
  grid_editor_date(
    column = "time1", 
    timepicker = "tab",
    format = "yyyy-MM-dd HH:mm"
  ) %>% 
  grid_editor_date(
    column = "time2", 
    timepicker = "normal",
    format = "yyyy-MM-dd HH:mm"
  )
