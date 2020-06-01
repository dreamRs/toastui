library(toastui)

datagrid(iris) %>%
  grid_cell_style(
    Sepal.Length > 5,
    column = "Sepal.Length",
    background = "#F781BE"
  )


dat <- iris[c(1:3, 51:53, 101:103), ]
datagrid(dat) %>%
  grid_cell_style(
    Species == "setosa",
    column = "Species",
    background = "#E41A1C80",
    color = "#FFF"
  ) %>%
  grid_cell_style(
    Species == "versicolor",
    column = "Species",
    background = "#377EB880"
  ) %>%
  grid_cell_style(
    Species == "virginica",
    column = "Species",
    background = "#4DAF4A80"
  )


# Use rlang to use character
library(rlang)
my_var <- "Sepal.Length"
datagrid(iris) %>%
  grid_cell_style(
    !!sym(my_var) > 5,
    column = "Sepal.Length",
    background = "#F781BE"
  )




# Style multiple columns

cor_longley <- as.data.frame(cor(longley))
cor_longley$Var <- row.names(cor_longley)
vars <- c("GNP.deflator", "GNP",
          "Unemployed", "Armed.Forces",
          "Population", "Year", "Employed")
datagrid(cor_longley[, c("Var", vars)]) %>%
  grid_cells_style(
    fun = ~ . > 0.9,
    columns = vars,
    background = "#053061",
    color = "#FFF"
  ) %>%
  grid_cells_style(
    fun = ~ . > 0 & . <= 0.9,
    columns = vars,
    background = "#539dc8",
    color = "#FFF"
  ) %>%
  grid_cells_style(
    fun = ~ . < 0,
    columns = vars,
    background = "#b51f2e",
    color = "#FFF"
  )












