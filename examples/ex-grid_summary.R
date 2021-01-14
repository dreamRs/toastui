library(toastui)

# Add a line with sum of column
datagrid(ps3_games[, c(1, 5, 6, 7, 8)], colwidths = "guess") %>% 
  grid_summary(
    column = "NA_Sales",
    stat = "sum"
  )

# Do that for several columns
datagrid(ps3_games[, c(1, 5, 6, 7, 8)], colwidths = "guess") %>% 
  grid_summary(
    column = c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales"),
    stat = "sum",
    label = "Total: "
  )
