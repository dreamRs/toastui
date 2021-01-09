
library(toastui)
library(scales)

datagrid(mtcars) %>%
  grid_column_style(
    column = "mpg",
    background = col_numeric("Blues", domain = NULL)(mpg),
    fontWeight = "bold",
    color = ifelse(mpg > 25, "white", "black")
  )

datagrid(mtcars) %>%
  grid_column_style(
    column = "mpg",
    background = col_numeric("Blues", domain = NULL)(mpg),
    fontWeight = "bold",
    color = ifelse(mpg > 25, "white", "black")
  ) %>%
  grid_column_style(
    column = "cyl",
    background = col_bin("Blues", domain = NULL)(cyl),
    fontStyle = "italic"
  )
