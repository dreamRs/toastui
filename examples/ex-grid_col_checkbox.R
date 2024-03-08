
library(toastui)
library(shiny)
library(bslib)

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5L),
  tags$h2("Checkbox column grid demo"),
  fluidRow(
    column(
      width = 8,
      datagridOutput("grid"),
      verbatimTextOutput("edited")
    )
  )
)

server <- function(input, output, session) {

  output$grid <- renderDatagrid({
    data.frame(
      month = month.name,
      checkboxes = sample(c(TRUE, FALSE), 12, replace = TRUE),
      switches = sample(c(TRUE, FALSE), 12, replace = TRUE)
    ) %>%
      datagrid(data_as_input = TRUE) %>%
      grid_col_checkbox(column = "checkboxes") %>%
      grid_col_checkbox(
        column = "switches",
        # /!\ will only works with bslib::bs_theme(version = 5L)
        class = "form-check form-switch d-flex justify-content-center my-1"
      )

  })

  output$edited <- renderPrint({
    input$grid_data # outputId + "_data
  })

}

if (interactive())
  shinyApp(ui, server)

