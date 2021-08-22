library(toastui)
library(shiny)

ui <- fluidPage(
  tags$h2("Buttons in grid"),
  datagridOutput("grid"),
  verbatimTextOutput("clicks")
)

server <- function(input, output, session) {

  dat <- data.frame(
    variable = paste(1:26, LETTERS, sep = " - "),
    button1 = 1:26,
    button2 = letters,
    button3 = LETTERS
  )

  output$grid <- renderDatagrid({
    datagrid(dat) %>%
      grid_col_button(
        column = "button1",
        inputId = "button1"
      ) %>%
      grid_col_button(
        column = "button2",
        inputId = "button2",
        align = "center",
        btn_width = "50%",
        status = "primary"
      ) %>%
      grid_col_button(
        column = "button3",
        inputId = "button3",
        label = "Remove",
        icon = icon("trash"),
        status = "danger"
      )
  })

  output$clicks <- renderPrint({
    cat(
      "Button 1: ", input$button1,
      "\nButton 2: ", input$button2,
      "\nButton 3: ", input$button3,
      "\n"
    )
  })

}

if (interactive())
  shinyApp(ui, server)
