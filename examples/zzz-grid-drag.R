
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("Drag row example"),
  fluidRow(
    column(
      width = 8,
      datagridOutput("grid")
    ),
    column(
      width = 4,
      tags$b("Drag:"),
      verbatimTextOutput("drag"),
      tags$b("Drop:"),
      verbatimTextOutput("drop"),
      tags$b("Data:"),
      verbatimTextOutput("data")
    )
  )
)

server <- function(input, output, session) {

  output$grid <- renderDatagrid({
    datagrid(list(
      "Variable 1" = 1:10,
      "Variable 2" = LETTERS[1:10]
    ), draggable = TRUE, data_as_input = TRUE)
  })

  output$drag <- renderPrint({
    input$grid_drag
  })
  output$drop <- renderPrint({
    input$grid_drop
  })
  output$data <- renderPrint({
    input$grid_data
  })

}

shinyApp(ui, server)
