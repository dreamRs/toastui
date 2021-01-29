# Change option for weekly view
calendar(view = "week") %>%
  cal_week_options(
    startDayOfWeek = 1,
    daynames = c("Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"),
    narrowWeekend = TRUE
  )
