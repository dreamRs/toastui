if (interactive()) {
  library(shiny)
  library(tuigridr)

  ui <- fluidPage(
    tags$h2("tuigridr click"),
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
