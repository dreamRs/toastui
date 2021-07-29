library(toastui)

# New header label
datagrid(mtcars[, 1:5]) %>%
  grid_columns(columns = "mpg", header = "Miles/(US) gallon")

# Align content to right & resize
datagrid(mtcars[, 1:5]) %>%
  grid_columns(
    columns = "mpg",
    align = "left",
    resizable = TRUE
  ) %>%
  grid_columns(
    columns = "cyl",
    align = "left",
    resizable = TRUE
  )

# Hide a column
datagrid(mtcars[, 1:5]) %>%
  grid_columns(
    columns = "mpg",
    hidden = TRUE
  )


# Set options for 2 columns
datagrid(mtcars[, 1:5]) %>%
  grid_columns(
    columns = c("mpg", "cyl"),
    header = c("Miles/(US) gallon", "Number of cylinders")
  )


