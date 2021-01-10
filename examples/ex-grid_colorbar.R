library(toastui)

dat <- rolling_stones_50[, "Artist", drop = FALSE]
dat$percentage <- sample(1:100, size = 50, replace = TRUE)
dat$numeric <- sample(1:1500, size = 50, replace = TRUE)

datagrid(dat) %>%
  grid_colorbar(
    column = "percentage"
  )

datagrid(dat) %>%
  grid_colorbar(
    column = "percentage",
    label_outside = TRUE
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
    prefix = "$",
    height = "20px"
  )


data.frame(
  rn = rownames(mtcars),
  mpg = mtcars$mpg,
  check.names = FALSE
) %>%
  datagrid(colnames = c("Automobile", "Miles/(US) gallon")) %>%
  grid_colorbar(
    column = "mpg",
    bar_bg = ifelse(mtcars$mpg > mean(mtcars$mpg), "#5cb85c", "#BF616A"),
    label_outside = TRUE,
    label_width = "25px"
  )

