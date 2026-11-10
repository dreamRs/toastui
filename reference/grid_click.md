# Click event (in shiny)

Click event (in shiny)

## Usage

``` r
grid_click(grid, inputId)
```

## Arguments

- grid:

  A table created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- inputId:

  The `input` slot that will be used to access the value.

## Value

A `datagrid` htmlwidget.

## Examples

``` r
if (interactive()) {
  library(shiny)
  library(toastui)

  ui <- fluidPage(
    tags$h2("datagrid click"),
    datagridOutput("grid"),
    verbatimTextOutput("res")
  )

  server <- function(input, output, session) {

    df <- data.frame(
      index = 1:12,
      month = month.name,
      letters = letters[1:12]
    )

    output$grid <- renderDatagrid({
      datagrid(df) %>%
        grid_click(
          inputId = "click"
        )
    })

    output$res <- renderPrint({
      input$click
    })
  }

  shinyApp(ui, server)
}
```
