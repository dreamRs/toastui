# Row selection (in shiny)

Row selection (in shiny)

## Usage

``` r
grid_selection_row(
  grid,
  inputId,
  type = c("checkbox", "radio"),
  return = c("data", "index"),
  width = NULL
)
```

## Arguments

- grid:

  A table created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- inputId:

  The `input` slot that will be used to access the value.

- type:

  Type of selection: `"checkbox"` (multiple rows) or `"radio"` (unique
  row).

- return:

  Value that will be accessible via `input` : a `data.frame` with
  selected row(s) or just the index of selected row(s).

- width:

  Width of the column.

## Value

A `datagrid` htmlwidget.

## Examples

``` r
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("datagrid row selection"),
  fluidRow(
    column(
      width = 6,
      datagridOutput("grid_checkbox"),
      verbatimTextOutput("res_checkbox")
    ),
    column(
      width = 6,
      datagridOutput("grid_radio"),
      verbatimTextOutput("res_radio")
    )
  )
)

server <- function(input, output, session) {

  df <- data.frame(
    index = 1:12,
    month = month.name,
    letters = letters[1:12]
  )

  output$grid_checkbox <- renderDatagrid({
    datagrid(df) %>%
      grid_selection_row(
        inputId = "sel_check",
        type = "checkbox"
      )
  })

  output$res_checkbox <- renderPrint({
    input$sel_check
  })

  output$grid_radio <- renderDatagrid({
    datagrid(df) %>%
      grid_selection_row(
        inputId = "sel_radio",
        type = "radio"
      )
  })

  output$res_radio <- renderPrint({
    input$sel_radio
  })

}

if (interactive())
  shinyApp(ui, server)
```
