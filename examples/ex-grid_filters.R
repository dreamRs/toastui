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
    columns = "month.abb",
    showApplyBtn = TRUE,
    showClearBtn = TRUE,
    type = "text"
  ) %>%
  grid_filters(
    columns = "month.name",
    type = "select"
  ) %>%
  grid_filters(columns = "date") %>%
  grid_filters(columns = "number")


# Filter all variables
datagrid(rolling_stones_500) %>%
  grid_filters(columns = names(rolling_stones_500))
# or
datagrid(rolling_stones_500, filters = TRUE)
