library(toastui)

data <- data.frame(
  number = 1:12,
  month.abb = month.abb,
  month.name = month.name,
  date = Sys.Date() + 0:11,
  stringsAsFactors = FALSE
)

datagrid(data) %>%
  grid_filters(
    vars = "month.abb",
    showApplyBtn = TRUE,
    showClearBtn = TRUE,
    type = "text"
  ) %>%
  grid_filters(
    vars = "month.name",
    type = "select"
  ) %>%
  grid_filters(vars = "date") %>%
  grid_filters(vars = "number")


# Filter all variables
datagrid(rolling_stones_500) %>%
  grid_filters(vars = names(rolling_stones_500))
# or
datagrid(rolling_stones_500, filters = TRUE)
