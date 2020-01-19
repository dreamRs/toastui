library(shiny)

ui <- fluidPage(
  tags$h2("tuigridr shiny example"),
  tabsetPanel(
    tabPanel(
      title = "Default",
      tuigridOutput("default")
    ),
    tabPanel(
      title = "Full height",
      tuigridOutput("fullheight", height = "auto")
    ),
    tabPanel(
      title = "Pagination",
      tuigridOutput("pagination")
    )
  )
)

server <- function(input, output, session) {

  output$default <- renderTuigrid({
    tuigrid(iris)
  })

  output$fullheight <- renderTuigrid({
    tuigrid(iris, bodyHeight = "auto")
  })

  output$pagination <- renderTuigrid({
    tuigrid(iris, pagination = 15)
  })

}

shinyApp(ui, server)
