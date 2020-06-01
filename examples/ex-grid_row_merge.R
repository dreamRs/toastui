library(toastui)

dat <- iris[c(1:3, 51:53, 101:103), ]

datagrid(dat) %>%
  grid_row_merge(vars = "Species")

datagrid(dat) %>%
  grid_row_merge(vars = "Species") %>%
  grid_row_merge(vars = "Petal.Width")



