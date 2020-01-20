

data <- data.frame(
  month = month.name,
  number = 1:12,
  abc = c("a", "b", "c"),
  date = Sys.Date() + 0:11
)

tuigrid(data) %>%
  grid_filters(vars = "month",
               showApplyBtn = TRUE,
               showClearBtn = TRUE,
               type = "text") %>%
  grid_filters(vars = "date")

