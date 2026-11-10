# Grid editor for columns

Allow to edit content of columns with different inputs, then retrieve
value server-side in shiny application with `input$<outputId>_data`.

## Usage

``` r
grid_editor(
  grid,
  column,
  type = c("text", "number", "checkbox", "select", "radio", "password"),
  choices = NULL,
  validation = validateOpts(),
  useListItemText = FALSE
)

grid_editor_opts(
  grid,
  editingEvent = c("dblclick", "click"),
  actionButtonId = NULL,
  session = shiny::getDefaultReactiveDomain()
)
```

## Arguments

- grid:

  A table created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- column:

  Column for which to activate the editable content.

- type:

  Type of editor: `"text"`, `"number"`, `"checkbox"`, `"select"`,
  `"radio"` or `"password"`.

- choices:

  Vector of choices, required for `"checkbox"`, `"select"` and `"radio"`
  type.

- validation:

  Rules to validate content edited, see
  [`validateOpts()`](https://dreamrs.github.io/toastui/reference/validateOpts.md).

- useListItemText:

  If `choices` contains special characters (spaces, punctuation, ...)
  set this option to `TRUE`, you'll have to encode data in `column` to
  numeric as character (e.g. `"1"`, `"2"`, ...).

- editingEvent:

  If set to `"click"`, editable cell in the view-mode will be changed to
  edit-mode by a single click.

- actionButtonId:

  Use an `actionButton` inputId to send edited data to the server only
  when this button is clicked. This allows not to send all the changes
  made by the user to the server.

- session:

  Shiny session.

## Value

A `datagrid` htmlwidget.

## See also

[`grid_editor_date`](https://dreamrs.github.io/toastui/reference/grid_editor_date.md)
for a date picker.

## Examples

``` r
library(toastui)
library(shiny)

ui <- fluidPage(
  tags$h2("Edit grid demo"),
  fluidRow(
    column(
      width = 6,
      tags$p(
        "Each time you modify the grid, data is send to server"
      ),
      datagridOutput("grid1"),
      verbatimTextOutput("edited1")
    ),
    column(
      width = 6,
      tags$p(
        "Modify the grid, then click button to send data to server"
      ),
      datagridOutput("grid2"),
      actionButton(
        inputId = "update2", 
        label = "Update edited data", 
        class = "btn-block"
      ),
      verbatimTextOutput("edited2")
    )
  )
)

server <- function(input, output, session) {
  
  # Use same grid twice
  editdata <- data.frame(
    character = month.name,
    select = month.name,
    checkbox = month.abb,
    radio = month.name
  )
  editgrid <- datagrid(editdata) %>% 
    grid_editor(
      column = "character",
      type = "text"
    ) %>% 
    grid_editor(
      column = "select",
      type = "select",
      choices = month.name
    ) %>% 
    grid_editor(
      column = "checkbox",
      type = "checkbox",
      choices = month.abb
    ) %>% 
    grid_editor(
      column = "radio",
      type = "radio",
      choices = month.name
    )
  
  output$grid1 <- renderDatagrid({
    editgrid
  })
  
  output$edited1 <- renderPrint({
    input$grid1_data
  })
  
  output$grid2 <- renderDatagrid({
    editgrid %>%
      grid_editor_opts(
        actionButtonId = "update2"
      )
  })
  
  output$edited2 <- renderPrint({
    input$grid2_data
  })
  
}

if (interactive())
  shinyApp(ui, server)
```
