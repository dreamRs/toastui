library(tuigridr)

dat <- iris[c(1:3, 51:53, 101:103), ]

tuigrid(dat) %>%
  grid_row_merge(vars = "Species")

tuigrid(dat) %>%
  grid_row_merge(vars = "Species") %>%
  grid_row_merge(vars = "Petal.Width")



