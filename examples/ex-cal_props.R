
# Define theme for schedules
calendar(cal_demo_data()) %>%
  cal_props(
    list(
      id = 1, name = "PERSO",
      color = "white",
      bgColor = "steelblue",
      borderColor = "steelblue"
    ),
    list(
      id = 2,
      name = "WORK",
      color = "white",
      bgColor = "forestgreen",
      borderColor = "forestgreen"
    )
  )


