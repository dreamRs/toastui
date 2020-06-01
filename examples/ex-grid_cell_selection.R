if (interactive()) {
  library(shiny)
  library(toastui)

  ui <- fluidPage(
    tags$h2("datagrid cell selection"),
    datagridOutput("grid_1"),
    verbatimTextOutput("result_1"),
    datagridOutput("grid_2"),
    verbatimTextOutput("result_2")
  )

  server <- function(input, output, session) {

    df <- data.frame(
      index = 1:12,
      month = month.name,
      letters = letters[1:12]
    )

    output$grid_1 <- renderDatagrid({
      datagrid(df) %>%
        grid_cell_selection(
          inputId = "cells"
        )
    })
    output$result_1 <- renderPrint({
      input$cells
    })

    output$grid_2 <- renderDatagrid({
      datagrid(df) %>%
        grid_cell_selection(
          inputId = "rows",
          selectionUnit = "row"
        )
    })
    output$result_2 <- renderPrint({
      input$rows
    })
  }

  shinyApp(ui, server)
}
