
serie <- toastui:::construct_serie(data = mtcars, mapping = caes(mpg, disp), type = "scatter")
expect_inherits(serie, "list")
expect_identical(length(serie), 1L)
expect_identical(length(serie$series), 1L)

serie <- toastui:::construct_serie(data = mtcars, mapping = caes(mpg, disp, color = as.character(cyl)), type = "scatter")
expect_inherits(serie, "list")
expect_identical(length(serie), 1L)
expect_identical(length(serie$series), 3L)



data_bar <- as.data.frame(table(mtcars$cyl))
serie <- toastui:::construct_serie(data = data_bar, mapping = caes(Var1, Freq), type = "bar")
expect_inherits(serie, "list")
expect_identical(length(serie), 2L)
expect_identical(length(serie$series), 1L)

data_bar <- as.data.frame(table(mtcars$cyl, mtcars$carb))
serie <- toastui:::construct_serie(data = data_bar, mapping = caes(Var1, Freq, fill = as.character(Var2)), type = "bar")
expect_inherits(serie, "list")
expect_identical(length(serie), 2L)
expect_identical(length(serie$series), 6L)


data_pie <- as.data.frame(table(mtcars$cyl))
serie <- toastui:::construct_serie(data = data_pie, mapping = caes(Var1, Freq), type = "pie")
expect_inherits(serie, "list")
expect_identical(length(serie), 2L)
expect_identical(length(serie$series), 3L)


serie <- toastui:::construct_serie(data = mtcars, mapping = caes(cyl, carb), type = "treemap")
expect_inherits(serie, "list")
expect_identical(length(serie), 1L)
expect_identical(length(serie$series), 3L)

data_line <- data.frame(
  x = seq(Sys.Date(), by = "days", length.out = 30),
  y = rnorm(30)
)
serie <- toastui:::construct_serie(data = data_line, mapping = caes(x, y), type = "line")
expect_inherits(serie, "list")
expect_identical(length(serie), 2L)
expect_identical(length(serie$series), 1L)

data_line <- rbind(
  data.frame(
    x = seq(Sys.Date(), by = "days", length.out = 30),
    y = rnorm(30),
    colour = "a"
  ),
  data.frame(
    x = seq(Sys.Date(), by = "days", length.out = 30),
    y = rnorm(30),
    colour = "b"
  )
)
serie <- toastui:::construct_serie(data = data_line, mapping = caes(x, y, colour = colour), type = "line")
expect_inherits(serie, "list")
expect_identical(length(serie), 2L)
expect_identical(length(serie$series), 2L)


serie <- toastui:::construct_serie(list(a = 1), mapping = NULL, type = "gauge")
expect_inherits(serie, "list")
expect_identical(length(serie), 1L)
expect_identical(length(serie$series), 1L)



data_heatmap <- as.data.frame(table(mtcars$cyl, mtcars$carb))
serie <- toastui:::construct_serie(data = data_heatmap, mapping = caes(Var1, Var2, fill = Freq), type = "heatmap")
expect_inherits(serie, "list")
expect_identical(length(serie), 2L)
expect_identical(length(serie$series), 6L)
