library(toastui)

# default usage
datagrid(rolling_stones_50)

# disable sorting
datagrid(rolling_stones_50, sortable = FALSE)

# enable default filtering
datagrid(rolling_stones_50, filters = TRUE)

# enable pagination (10 rows per page)
datagrid(rolling_stones_50, pagination = 10)

# Themes
datagrid(rolling_stones_50, theme = "striped")
datagrid(rolling_stones_50, theme = "default")


# Empty table
datagrid(list())

# with columns
datagrid(data.frame(
  variable_1 = character(0),
  variable_2 = character(0)
))



