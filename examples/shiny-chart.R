library(toastui)
library(shiny)
library(palmerpenguins)

ui <- fluidPage(
  fluidRow(
    column(
      width = 8, offset = 2,
      tags$h2("Chart example"),
      chartOutput("mychart1"),
      chartOutput("mychart2")
    )
  )
)

server <- function(input, output, session) {
  
  output$mychart1 <- renderChart({
    table(species = penguins$species) %>% 
      chart(caes(species, Freq), type = "column")
  })
  
  output$mychart2 <- renderChart({
    chart(
      penguins, 
      caes(x = bill_length_mm, y = body_mass_g, color = species),
      type = "scatter"
    )
  })
}

if (interactive())
  shinyApp(ui, server)
