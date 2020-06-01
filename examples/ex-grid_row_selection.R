if (interactive()) {
  library(shiny)
  library(toastui)

  ui <- fluidPage(
    tags$h2("datagrid row selection"),
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
        grid_row_selection(
          inputId = "rows", width = 50
        )
    })

    output$res <- renderPrint({
      input$rows
    })
  }

  shinyApp(ui, server)
}
