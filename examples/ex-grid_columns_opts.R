library(tuigridr)

#‗ Set minimal width for columns
tuigrid(countries) %>%
  grid_columns_opts(
    minWidth = 140
  )

# Freeze two first columns
tuigrid(countries) %>%
  grid_columns_opts(
    minWidth = 140,
    frozenCount = 2,
    frozenBorderWidth = 5
  )
