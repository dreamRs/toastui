# Shiny bindings for [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md)

Output and render functions for using
[`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md)
within Shiny applications and interactive Rmd documents.

## Usage

``` r
datagridOutput(outputId, width = "100%", height = "400px")

renderDatagrid(expr, env = parent.frame(), quoted = FALSE)

renderDatagrid2(expr, env = parent.frame(), quoted = FALSE)

datagridOutput2(outputId, width = "100%", height = "auto")
```

## Arguments

- outputId:

  Output variable to read from.

- width, height:

  Must be a valid CSS unit (like `100%`, `400px`, `auto`) or a number,
  which will be coerced to a string and have `px` appended.

- expr:

  An expression that generates a calendar

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.

## Value

Output element that can be included in UI. Render function to create
output in server.

## Special inputs

The following `input` values will be accessible in the server:

- **input\$outputId_data** : contain the data displayed in grid, only
  available when `datagrid(data_as_input = TRUE)` or when using
  [`grid_editor()`](https://dreamrs.github.io/toastui/reference/grid-editor.md)

- **input\$outputId_data_filtered** : contain the filtered data
  displayed in grid, only available when
  `datagrid(data_as_input = TRUE)` or when using
  [`grid_editor()`](https://dreamrs.github.io/toastui/reference/grid-editor.md)

- **input\$outputId_validation** : contain results of validation rules
  applied to data, only available when using `validation` argument in
  [`grid_editor()`](https://dreamrs.github.io/toastui/reference/grid-editor.md)

These other inputs can be defined using other functions:

- *row selection*: giving row selected with checkboxes or radio buttons
  in `inputId` defined in
  [`grid_selection_row()`](https://dreamrs.github.io/toastui/reference/grid_selection_row.md)

- *cell selection*: giving cell selected with mouse in `inputId` defined
  in
  [`grid_selection_cell()`](https://dreamrs.github.io/toastui/reference/grid_selection_cell.md)

- *cell clicked*: giving row index and column name of cell clicked in
  `inputId` defined in
  [`grid_click()`](https://dreamrs.github.io/toastui/reference/grid_click.md)

## Examples

``` r
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("datagrid shiny example"),
  tabsetPanel(
    tabPanel(
      title = "Fixed height",
      datagridOutput("default"),
      tags$b("CHECK HEIGHT")
    ),
    tabPanel(
      title = "Full height",
      datagridOutput("fullheight", height = "auto"),
      tags$b("CHECK HEIGHT")
    ),
    tabPanel(
      title = "Pagination",
      datagridOutput("pagination", height = "auto"),
      tags$b("CHECK HEIGHT")
    )
  )
)

server <- function(input, output, session) {

  output$default <- renderDatagrid({
    datagrid(rolling_stones_500)
  })

  output$fullheight <- renderDatagrid({
    datagrid(rolling_stones_500, bodyHeight = "auto")
  })

  output$pagination <- renderDatagrid({
    datagrid(rolling_stones_500, pagination = 15)
  })

}

if (interactive())
  shinyApp(ui, server)
```
