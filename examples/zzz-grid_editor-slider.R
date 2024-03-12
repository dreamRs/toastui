library(toastui)
library(shiny)
library(bslib)

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5),
  tags$h2("Slider grid demo"),
  tags$input(type = "range", class = "form-range", min = "0", max = "20", step = "1", width = "100%"),
  fluidRow(
    column(
      width = 8,
      datagridOutput("grid1"),
      verbatimTextOutput("edited1")
    )
  )
)

server <- function(input, output, session) {

  output$grid1 <- renderDatagrid({
    data.frame(
      month = month.name,
      value = sample(0:20, 12, TRUE)
    ) %>%
      datagrid(data_as_input = TRUE, selectionUnit = "row") %>%
      grid_columns(
        columns = "value",
        # editor = list(
        #   type = htmlwidgets::JS("datagrid.editor.slider"),
        #   options = list(
        #     min = 0,
        #     max = 20
        #   )
        # ),
        renderer = list(
          type = htmlwidgets::JS("datagrid.renderer.slider"),
          options = list(
            min = 0,
            max = 20,
            step = 1
          )
        )
      )

  })

  output$edited1 <- renderPrint({
    input$grid1_data
  })

}

if (interactive())
  shinyApp(ui, server)
