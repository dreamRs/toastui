library(toastui)

datagrid(mtcars[order(mtcars$cyl), 1:5]) %>%
  grid_row_merge(columns = "cyl")

datagrid(mtcars[, 1:8]) %>%
  grid_row_merge(columns = "cyl") %>%
  grid_row_merge(columns = "vs")



