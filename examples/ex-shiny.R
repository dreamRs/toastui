library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("datagrid shiny example"),
  tabsetPanel(
    tabPanel(
      title = "Fixed height",
      datagridOutput("default"),
      tags$b("CHECK HEIGHT")
    ),
    tabPanel(
      title = "Full height",
      datagridOutput("fullheight", height = "auto"),
      tags$b("CHECK HEIGHT")
    ),
    tabPanel(
      title = "Pagination",
      datagridOutput("pagination", height = "auto"),
      tags$b("CHECK HEIGHT")
    )
  )
)

server <- function(input, output, session) {

  output$default <- renderDatagrid({
    datagrid(rolling_stones_500)
  })

  output$fullheight <- renderDatagrid({
    datagrid(rolling_stones_500, bodyHeight = "auto")
  })

  output$pagination <- renderDatagrid({
    datagrid(rolling_stones_500, pagination = 15)
  })

}

shinyApp(ui, server)
