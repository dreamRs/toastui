# Display checkboxes in grid's column

Display checkboxes in grid's column

## Usage

``` r
grid_col_checkbox(
  grid,
  column,
  class = "form-check d-flex justify-content-center my-1",
  ...
)
```

## Arguments

- grid:

  A table created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- column:

  The name of the column where to create buttons.

- class:

  CSS classes to add to checkbox container.

- ...:

  Further arguments passed to
  [`grid_columns()`](https://dreamrs.github.io/toastui/reference/grid_columns.md).

## Value

A `datagrid` htmlwidget.

## Examples

``` r

library(toastui)
library(shiny)
library(bslib)
#> 
#> Attaching package: ‘bslib’
#> The following object is masked from ‘package:utils’:
#> 
#>     page

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5L),
  tags$h2("Checkbox column grid demo"),
  fluidRow(
    column(
      width = 8,
      datagridOutput("grid"),
      verbatimTextOutput("edited")
    )
  )
)

server <- function(input, output, session) {

  output$grid <- renderDatagrid({
    data.frame(
      month = month.name,
      checkboxes = sample(c(TRUE, FALSE), 12, replace = TRUE),
      switches = sample(c(TRUE, FALSE), 12, replace = TRUE)
    ) %>%
      datagrid(data_as_input = TRUE) %>%
      grid_col_checkbox(column = "checkboxes") %>%
      grid_col_checkbox(
        column = "switches",
        # /!\ will only works with bslib::bs_theme(version = 5L)
        class = "form-check form-switch d-flex justify-content-center my-1"
      )

  })

  output$edited <- renderPrint({
    input$grid_data # outputId + "_data
  })

}

if (interactive())
  shinyApp(ui, server)
```
