library(toastui)
library(shiny)

ui <- fluidPage(
  tags$h2("Delete row in grid via proxy"),
  fluidRow(
    column(
      width = 6,
      datagridOutput("grid"),
      verbatimTextOutput("clicks")
    ),
    column(
      width = 6,
      verbatimTextOutput("output_data")
    )
  )
)

server <- function(input, output, session) {

  dat <- data.frame(
    index = 1:26,
    letter = sample(letters),
    remove = 1:26
  )

  output$grid <- renderDatagrid({
    datagrid(dat, data_as_input = TRUE) %>%
      grid_columns("remove", width = 120) %>%
      grid_col_button(
        column = "remove",
        inputId = "remove_row",
        label = "Remove",
        icon = icon("trash"),
        status = "danger",
        btn_width = "115px",
        align = "left"
      )
  })

  output$clicks <- renderPrint({
    cat(
      "Removed: ", input$remove_row,
      "\n"
    )
  })

  observeEvent(input$remove_row, {
    data <- input$grid_data
    rowKey <- data$rowKey[data$remove == input$remove_row]
    grid_proxy_delete_row("grid", rowKey)
  })

  output$output_data <- renderPrint({
    input$grid_data
  })

}

if (interactive())
  shinyApp(ui, server)
