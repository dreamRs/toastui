library(toastui)

# Default is "clean" theme
datagrid(rolling_stones_50)

# others builtins themes
datagrid(rolling_stones_50, theme = "striped")
datagrid(rolling_stones_50, theme = "default")


# Customize theme
datagrid(rolling_stones_50) %>%
  grid_theme(
    row.even.background = "#ddebf7",
    cell.normal.border = "#9bc2e6",
    cell.normal.showVerticalBorder = TRUE,
    cell.normal.showHorizontalBorder = TRUE,
    cell.header.background = "#5b9bd5",
    cell.header.text = "#FFF",
    cell.selectedHeader.background = "#013ADF",
    cell.focused.border = "#013ADF"
  )


