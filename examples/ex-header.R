
tuigrid(iris) %>%
  grid_header(
    align = "left",
    height = "150px"
  )


tuigrid(iris, bodyHeight = "auto", height = 500) %>%
  grid_header(
    complexColumns = list(
      list(
        header = "Sepal",
        name = "Sepal",
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

