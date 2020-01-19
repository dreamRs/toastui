
# Empty table
tuigrid(list())

tuigrid(data.frame(
  variable_1 = vector(length = 0),
  variable_2 = vector(length = 0)
))


# With iris
tuigrid(iris)

# with mtcars
tuigrid(mtcars)





# Themes
tuigrid(iris, theme = "striped")
tuigrid(iris, theme = "default")

