library(tuigridr)

# default usage
tuigrid(rolling_stones_50)

# disable sorting
tuigrid(rolling_stones_50, sortable = FALSE)

# enable default filtering
tuigrid(rolling_stones_50, filters = TRUE)

# enable pagination (10 rows per page)
tuigrid(rolling_stones_50, pagination = 10)

# Themes
tuigrid(rolling_stones_50, theme = "striped")
tuigrid(rolling_stones_50, theme = "default")


# Empty table
tuigrid(list())

# with columns
tuigrid(data.frame(
  variable_1 = character(0),
  variable_2 = character(0)
))



