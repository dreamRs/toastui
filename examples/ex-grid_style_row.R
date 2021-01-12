library(toastui)

datagrid(mtcars) %>%
  grid_style_row(
    mpg > 19,
    background = "#F781BE"
  )

datagrid(mtcars) %>%
  grid_style_row(
    vs == 0,
    background = "#E41A1C80",
    color = "#FFF"
  ) %>%
  grid_style_row(
    vs == 1,
    background = "#377EB880"
  )


# Use rlang to use character
library(rlang)
my_var <- "disp"
datagrid(mtcars) %>%
  grid_style_row(
    !!sym(my_var) > 180,
    background = "#F781BE"
  )




