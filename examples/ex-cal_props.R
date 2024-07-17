library(toastui)

# Define theme for schedules
calendar(cal_demo_data()[, -c(9, 10, 11)]) %>%
  cal_props(
    list(
      id = "1",
      name = "PERSO",
      color = "lightblue",
      backgroundColor = "purple",
      borderColor = "magenta"
    ),
    list(
      id = "2",
      name = "WORK",
      color = "red",
      backgroundColor = "yellow",
      borderColor = "orange"
    )
  )
