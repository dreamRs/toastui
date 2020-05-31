library(tuigridr)

tuigrid(iris) %>%
  grid_cell_style(
    Sepal.Length > 5,
    column = "Sepal.Length",
    background = "#F781BE"
  )


dat <- iris[c(1:3, 51:53, 101:103), ]
tuigrid(dat) %>%
  grid_cell_style(
    Species == "setosa",
    column = "Species",
    background = "#E41A1C80",
    color = "#FFF"
  ) %>%
  grid_cell_style(
    Species == "versicolor",
    column = "Species",
    background = "#377EB880"
  ) %>%
  grid_cell_style(
    Species == "virginica",
    column = "Species",
    background = "#4DAF4A80"
  )


# Use rlang to use character
library(rlang)
my_var <- "Sepal.Length"
tuigrid(iris) %>%
  grid_cell_style(
    !!sym(my_var) > 5,
    column = "Sepal.Length",
    background = "#F781BE"
  )
