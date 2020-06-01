library(toastui)

# New header label
datagrid(iris) %>%
  grid_columns(vars = "Sepal.Length", header = "Length of Sepal")

# Align content to right & resize
datagrid(iris) %>%
  grid_columns(
    vars = "Sepal.Length",
    align = "right",
    resizable = TRUE
  )

# Hide a column
datagrid(iris) %>%
  grid_columns(
    vars = "Sepal.Length",
    hidden = TRUE
  )


# Set options for 2 columns
datagrid(iris) %>%
  grid_columns(
    vars = c("Sepal.Length", "Petal.Length"),
    header = c("Length of Sepal", "Length of Petal")
  )


