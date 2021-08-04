library(toastui)

datagrid(rolling_stones_50) %>%
  grid_header(
    align = "left",
    height = "150px"
  )


# Create columns groups
datagrid(iris) %>%
  grid_complex_header(
    "Sepal" = c("Sepal.Length", "Sepal.Width"),
    "Petal" = c("Petal.Length", "Petal.Width")
  )


# or use the full form to use more options
datagrid(iris) %>%
  grid_columns(
    columns = c("Petal.Length", "Petal.Width"),
    header = c("Length", "Width")
  ) %>%
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


# Custom HTML in header
# (not that sorting is incompatible with)
library(htmltools)
datagrid(mtcars) %>% 
  grid_columns(
    columns = "mpg",
    minWidth = 120,
    header = tags$div(
      tags$b("Miles/(US) gallon"),
      tags$br(),
      tags$i("numeric")
    )
  ) %>% 
  grid_header(
    columns = list(
      list(
        name = "mpg",
        align = "left",
        renderer = JS("DatagridColumnHeaderHTML")
      )
    )
  )

