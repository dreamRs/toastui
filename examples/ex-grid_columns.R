library(tuigridr)

# New header label
tuigrid(iris) %>%
  grid_columns(vars = "Sepal.Length", header = "Length of Sepal")

# Align content to right & resize
tuigrid(iris) %>%
  grid_columns(vars = "Sepal.Length",
               align = "right",
               resizable = TRUE)

# Hide a column
tuigrid(iris) %>%
  grid_columns(vars = "Sepal.Length",
               hidden = TRUE)


# Set options for 2 columns
tuigrid(iris) %>%
  grid_columns(
    vars = c("Sepal.Length", "Petal.Length"),
    header = c("Length of Sepal", "Length of Petal")
  )


