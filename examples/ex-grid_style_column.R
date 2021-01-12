
library(toastui)
library(scales)

datagrid(mtcars) %>%
  grid_style_column(
    column = "mpg",
    background = col_numeric("Blues", domain = NULL)(mpg),
    fontWeight = "bold",
    color = ifelse(mpg > 25, "white", "black")
  )

datagrid(mtcars) %>%
  grid_style_column(
    column = "mpg",
    background = col_numeric("Blues", domain = NULL)(mpg),
    fontWeight = "bold",
    color = ifelse(mpg > 25, "white", "black")
  ) %>%
  grid_style_column(
    column = "cyl",
    background = col_bin("Blues", domain = NULL)(cyl),
    fontStyle = "italic"
  )
