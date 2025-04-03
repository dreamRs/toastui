library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("datagrid as input"),
  fluidRow(
    column(
      width = 6,
      datagridOutput("grid")
    ),
    column(
      width = 6,
      verbatimTextOutput("data"),
      verbatimTextOutput("data_filtered")
    )
  )
)

server <- function(input, output, session) {

  output$grid <- renderDatagrid({
    data <- data.frame(
      number = 1:12,
      month.abb = month.abb,
      month.name = month.name,
      date = Sys.Date() + 0:11,
      stringsAsFactors = FALSE
    )
    datagrid(data, data_as_input = TRUE) %>%
      grid_filters(
        columns = "month.abb",
        showApplyBtn = TRUE,
        showClearBtn = TRUE,
        type = "text"
      ) %>%
      grid_filters(
        columns = "month.name",
        type = "select"
      ) %>%
      grid_filters(columns = "date") %>%
      grid_filters(columns = "number")
  })

  output$data <- renderPrint({
    input$grid_data
  })

  output$data_filtered <- renderPrint({
    input$grid_data_filtered
  })

}

if (interactive())
  shinyApp(ui, server)
