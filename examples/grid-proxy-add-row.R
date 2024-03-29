library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("Append row to grid"),
  datagridOutput("grid"),
  actionButton(
    inputId = "add",
    label = "Add row",
    class = "btn-block"
  )
)

server <- function(input, output, session) {

  dat <- data.frame(
    character = month.name,
    select = month.name,
    checkbox = month.abb,
    radio = month.name,
    password = month.name
  )

  output$grid <- renderDatagrid({
    datagrid(rolling_stones_50[1, ])
  })

  value <- reactiveVal(1)
  observeEvent(input$add, {
    row <- value() + 1
    grid_proxy_add_row(
      proxy = "grid",
      data = rolling_stones_50[row, ]
    )
    value(row)
  })

}

if (interactive())
  shinyApp(ui, server)
