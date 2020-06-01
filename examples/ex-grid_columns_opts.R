library(toastui)

#‗ Set minimal width for columns
datagrid(countries) %>%
  grid_columns_opts(
    minWidth = 140
  )

# Freeze two first columns
datagrid(countries) %>%
  grid_columns_opts(
    minWidth = 140,
    frozenCount = 2,
    frozenBorderWidth = 5
  )
