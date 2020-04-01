library(shiny)
library(tuigridr)

ui <- fluidPage(
  tags$h2("tuigridr shiny example"),
  tabsetPanel(
    tabPanel(
      title = "Fixed height",
      tuigridOutput("default"),
      tags$b("CHECK HEIGHT")
    ),
    tabPanel(
      title = "Full height",
      tuigridOutput("fullheight", height = "auto"),
      tags$b("CHECK HEIGHT")
    ),
    tabPanel(
      title = "Pagination",
      tuigridOutput("pagination"),
      tags$b("CHECK HEIGHT")
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
