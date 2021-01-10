library(toastui)

# default usage
datagrid(rolling_stones_50)

# Column's width alternatives (default is "fit")
datagrid(rolling_stones_50, colwidths = "guess")
datagrid(rolling_stones_50, colwidths = "auto")
datagrid(rolling_stones_50, colwidths = NULL)

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

# Empty columns
datagrid(data.frame(
  variable_1 = character(0),
  variable_2 = character(0)
))

# Specify colnames
datagrid(
  data = data.frame(
    variable_1 = sample(1:50, 12),
    variable_2 = month.name
  ),
  colnames = c("Number", "Month of the year")
)

