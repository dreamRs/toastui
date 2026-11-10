# Display buttons in grid's column

Display buttons in grid's column

## Usage

``` r
grid_col_button(
  grid,
  column,
  inputId,
  label = NULL,
  icon = NULL,
  status = "default",
  btn_width = "100%",
  ...
)
```

## Arguments

- grid:

  A table created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- column:

  The name of the column where to create buttons.

- inputId:

  The `input` slot that will be used to access the value.

- label:

  Label to display on button, if `NULL` use column's content.

- icon:

  Icon to display in button.

- status:

  Bootstrap status (color) of the button: default, primary, success,
  info, warning, danger, ... A class prefixed by `btn-` will be added to
  the button.

- btn_width:

  Button's width.

- ...:

  Further arguments passed to
  [`grid_columns()`](https://dreamrs.github.io/toastui/reference/grid_columns.md).

## Value

A `datagrid` htmlwidget.

## Examples

``` r
library(toastui)
library(shiny)

ui <- fluidPage(
  tags$h2("Buttons in grid"),
  datagridOutput("grid"),
  verbatimTextOutput("clicks")
)

server <- function(input, output, session) {

  dat <- data.frame(
    variable = paste(1:26, LETTERS, sep = " - "),
    button1 = 1:26,
    button2 = letters,
    button3 = LETTERS
  )

  output$grid <- renderDatagrid({
    datagrid(dat) %>%
      grid_col_button(
        column = "button1",
        inputId = "button1"
      ) %>%
      grid_col_button(
        column = "button2",
        inputId = "button2",
        align = "center",
        btn_width = "50%",
        status = "primary"
      ) %>%
      grid_col_button(
        column = "button3",
        inputId = "button3",
        label = "Remove",
        icon = icon("trash"),
        status = "danger"
      )
  })

  output$clicks <- renderPrint({
    cat(
      "Button 1: ", input$button1,
      "\nButton 2: ", input$button2,
      "\nButton 3: ", input$button3,
      "\n"
    )
  })

}

if (interactive())
  shinyApp(ui, server)
```
