library(toastui)
library(shiny)

ui <- fluidPage(
  tags$h2("Slider grid demo"),
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
    mydata <- data.frame(
      month = month.name,
      value = 1:12
    )
    grid <- datagrid(mydata)
    grid$x$editorInput <- TRUE
    # grid$x$options$editingEvent <- "click"
    grid %>% 
      grid_columns(
        columns = "value",
        editor = list(
          type = htmlwidgets::JS("DatagridSliderEditor"),
          options = list(
            min = 0, 
            max = 20
          )
        ),
        renderer = list(
          type = htmlwidgets::JS("DatagridSliderRenderer"),
          options = list(
            min = 0, 
            max = 20
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