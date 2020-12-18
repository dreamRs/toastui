library(toastui)

datagrid(mtcars[, 1:5]) %>%
  grid_row_merge(vars = "cyl")

datagrid(mtcars[, 1:8]) %>%
  grid_row_merge(vars = "cyl") %>%
  grid_row_merge(vars = "vs")



