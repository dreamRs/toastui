library(toastui)

datagrid(mtcars) %>%
  grid_cell_style(
    mpg > 19,
    column = "mpg",
    background = "#F781BE",
    fontWeight = "bold"
  )


datagrid(mtcars) %>%
  grid_cell_style(
    vs == 0,
    column = "vs",
    background = "#E41A1C80",
    color = "#FFF"
  ) %>%
  grid_cell_style(
    vs == 1,
    column = "vs",
    background = "#377EB880"
  )


# Use rlang to use character
library(rlang)
my_var <- "disp"
datagrid(mtcars) %>%
  grid_cell_style(
    !!sym(my_var) > 180,
    column = "disp",
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












