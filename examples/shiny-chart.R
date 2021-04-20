library(toastui)
library(shiny)

ui <- fluidPage(
  fluidRow(
    column(
      width = 8, offset = 2,
      tags$h2("Chart example"),
      selectInput("var", "Variable:", names(dimnames(Titanic))),
      chartOutput("mychart1"),
      chartOutput("mychart2")
    )
  )
)

server <- function(input, output, session) {
  
  output$mychart1 <- renderChart({
    Titanic %>% 
      as.data.frame() %>% 
      aggregate(as.formula(paste("Freq", input$var, sep = "~")), data = ., FUN = sum) %>% 
      chart(caes(x = !!as.symbol(input$var), y = Freq), type = "column")
  })
  
  output$mychart2 <- renderChart({
    req(input$var != "Survived")
    Titanic %>% 
      as.data.frame() %>% 
      aggregate(as.formula(paste("Freq ~ Survived", input$var, sep = "+")), data = ., FUN = sum) %>% 
      chart(caes(x = !!as.symbol(input$var), y = Freq, fill = Survived), type = "column")
  })
}

if (interactive())
  shinyApp(ui, server)
