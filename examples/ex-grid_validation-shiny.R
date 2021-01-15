

library(shiny)

ui <- fluidPage(
  tags$h2("Validation rules"),
  datagridOutput("grid"),
  verbatimTextOutput("validation")
)

server <- function(input, output, session) {

  output$grid <- renderDatagrid({
    validate <- data.frame(
      col_text = c("a", "b", "a", NA, "c"),
      col_number = sample(1:10, 5),
      col_mail = c("victor@mail.com", "victor", NA, "victor@mail", "victor.fr")
    )

    datagrid(validate) %>%
      grid_editor(
        "col_text", type = "text",
        validation = validateOpts(required = TRUE, unique = TRUE)
      ) %>%
      grid_editor(
        "col_number", type = "number",
        validation = validateOpts(min = 0, max = 5)
      ) %>%
      grid_editor(
        "col_mail", type = "text",
        validation = validateOpts(
          regExp = "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$"
        )
      )
  })

  output$validation <- renderPrint({
    input$grid_validation
  })

}

if (interactive())
  shinyApp(ui, server)
