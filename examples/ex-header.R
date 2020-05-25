library(tuigridr)

tuigrid(iris) %>%
  grid_header(
    align = "left",
    height = "150px"
  )


# Create columns groups
tuigrid(iris) %>%
  grid_complex_header(
    "Sepal" = c("Sepal.Length", "Sepal.Width"),
    "Petal" = c("Petal.Length", "Petal.Width")
  )


# or use the full form to use more options
tuigrid(iris) %>%
  grid_header(
    complexColumns = list(
      list(
        header = "Sepal",
        name = "Sepal",
        hideChildHeaders = TRUE,
        resizable = TRUE,
        childNames = c("Sepal.Length", "Sepal.Width")
      ),
      list(
        header = "Petal",
        name = "Petal",
        childNames = c("Petal.Length", "Petal.Width")
      )
    ),
    height = 80,
    valign = "middle"
  )




