if (interactive()) {
  library(shiny)
  library(tuigridr)

  ui <- fluidPage(
    tags$h2("tuigridr row selection"),
    tuigridOutput("grid"),
    verbatimTextOutput("res")
  )

  server <- function(input, output, session) {

    df <- data.frame(
      index = 1:12,
      month = month.name,
      letters = letters[1:12]
    )

    output$grid <- renderTuigrid({
      tuigrid(df) %>%
        grid_row_selection(
          inputId = "rows", label = "Select", width = 50
        )
    })

    output$res <- renderPrint({
      input$rows
    })
  }

  shinyApp(ui, server)
}
