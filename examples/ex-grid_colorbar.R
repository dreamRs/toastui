library(toastui)

dat <- rolling_stones_50[, "Artist", drop = FALSE]
dat$percentage <- sample(1:100, size = 50, replace = TRUE)
dat$numeric <- sample(1:1500, size = 50, replace = TRUE)

datagrid(dat) %>% 
  grid_colorbar(
    column = "percentage"
  )

# More options
datagrid(dat) %>% 
  grid_colorbar(
    column = "percentage",
    from = c(0, 100),
    suffix = "%"
  ) %>% 
  grid_colorbar(
    column = "numeric",
    bar_bg = "#BF616A",
    from = c(0, 1500),
    prefix = "$"
  )


