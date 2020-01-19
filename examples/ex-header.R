
tuigrid(iris) %>%
  tg_header(
    align = "left",
    height = "150px"
  )


tuigrid(iris) %>%
  tg_header(
    complexColumns = list(
      list(header = "Sepal", name = "Sepal", childNames = c("Sepal.Length", "Sepal.Width"), headerVAlign = "middle"),
      list(header = "Petal", name = "Petal", childNames = c("Petal.Length", "Petal.Width"))
    ),
    height = "80px", valign = "middle"
  )

