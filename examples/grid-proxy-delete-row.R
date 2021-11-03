
library(toastui)
library(shiny)

ui <- fluidPage(
  tags$h2("Delete row in grid via proxy"),
  datagridOutput("grid"),
  verbatimTextOutput("clicks")
)

server <- function(input, output, session) {

  dat <- data.frame(
    index = 1:26,
    letter = sample(letters),
    remove = 1:26
  )

  output$grid <- renderDatagrid({
    datagrid(dat) %>%
      grid_columns("remove", width = 120) %>%
      grid_col_button(
        column = "remove",
        inputId = "remove_row",
        label = "Remove",
        icon = icon("trash"),
        status = "danger",
        btn_width = "90%",
        align = "center"
      )
  })

  output$clicks <- renderPrint({
    cat(
      "Remove: ", input$remove_row,
      "\n"
    )
  })

  observeEvent(input$remove_row, {
    grid_proxy_delete_row("grid", input$remove_row)
  })

}

if (interactive())
  shinyApp(ui, server)
