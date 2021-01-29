# Change option for monthly view
calendar(view = "month") %>%
  cal_month_options(
    startDayOfWeek = 1,
    daynames = c("Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"),
    narrowWeekend = TRUE
  )
