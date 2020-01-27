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
        grid_cell_selection(
          inputId = "cells"
        )
    })

    output$res <- renderPrint({
      input$cells
    })
  }

  shinyApp(ui, server)
}
