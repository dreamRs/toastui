
tuigrid(iris) %>%
  set_row_style(
    Sepal.Length > 5,
    background = "#F781BE"
  )


dat <- iris[c(1:3, 51:53, 101:103), ]
tuigrid(dat) %>%
  set_row_style(
    Species == "setosa",
    background = "#E41A1C80",
    color = "#FFF"
  ) %>%
  set_row_style(
    Species == "versicolor",
    background = "#377EB880"
  ) %>%
  set_row_style(
    Species == "virginica",
    background = "#4DAF4A80"
  )
