
# Empty table
tuigrid(list())

tuigrid(data.frame(
  variable_1 = vector(length = 0),
  variable_2 = vector(length = 0)
))


# default usage
tuigrid(rolling_stones_50)


# Pagination
tuigrid(rolling_stones_50, pagination = 10)


# Themes
tuigrid(rolling_stones_50, theme = "striped")
tuigrid(rolling_stones_50, theme = "default")

