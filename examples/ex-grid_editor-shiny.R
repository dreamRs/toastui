library(toastui)
library(shiny)

ui <- fluidPage(
  tags$h2("Edit grid demo"),
  fluidRow(
    column(
      width = 6,
      tags$p(
        "Each time you modify the grid, data is send to server"
      ),
      datagridOutput("grid1"),
      verbatimTextOutput("edited1")
    ),
    column(
      width = 6,
      tags$p(
        "Modify the grid, then click button to send data to server"
      ),
      datagridOutput("grid2"),
      actionButton(
        inputId = "update2", 
        label = "Update edited data", 
        class = "btn-block"
      ),
      verbatimTextOutput("edited2")
    )
  )
)

server <- function(input, output, session) {
  
  # Use same grid twice
  editdata <- data.frame(
    character = month.name,
    select = month.name,
    checkbox = month.abb,
    radio = month.name
  )
  editgrid <- datagrid(editdata) %>% 
    grid_editor(
      column = "character",
      type = "text"
    ) %>% 
    grid_editor(
      column = "select",
      type = "select",
      choices = month.name
    ) %>% 
    grid_editor(
      column = "checkbox",
      type = "checkbox",
      choices = month.abb
    ) %>% 
    grid_editor(
      column = "radio",
      type = "radio",
      choices = month.name
    )
  
  output$grid1 <- renderDatagrid({
    editgrid
  })
  
  output$edited1 <- renderPrint({
    input$grid1_data
  })
  
  output$grid2 <- renderDatagrid({
    editgrid %>%
      grid_editor_opts(
        updateOnClick = "update2"
      )
  })
  
  output$edited2 <- renderPrint({
    input$grid2_data
  })
  
}

if (interactive())
  shinyApp(ui, server)
