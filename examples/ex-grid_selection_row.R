library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("datagrid row selection"),
  fluidRow(
    column(
      width = 6,
      datagridOutput("grid_checkbox"),
      verbatimTextOutput("res_checkbox")
    ),
    column(
      width = 6,
      datagridOutput("grid_radio"),
      verbatimTextOutput("res_radio")
    )
  )
)

server <- function(input, output, session) {

  df <- data.frame(
    index = 1:12,
    month = month.name,
    letters = letters[1:12]
  )

  output$grid_checkbox <- renderDatagrid({
    datagrid(df) %>%
      grid_selection_row(
        inputId = "sel_check",
        type = "checkbox"
      )
  })

  output$res_checkbox <- renderPrint({
    input$sel_check
  })

  output$grid_radio <- renderDatagrid({
    datagrid(df) %>%
      grid_selection_row(
        inputId = "sel_radio",
        type = "radio"
      )
  })

  output$res_radio <- renderPrint({
    input$sel_radio
  })

}

if (interactive())
  shinyApp(ui, server)
