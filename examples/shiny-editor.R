
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("editor shiny example"),
  tabsetPanel(
    tabPanel(
      title = "Default",
      editorOutput("default"),
      tags$b("CHECK HEIGHT")
    ),
    tabPanel(
      title = "WYSIWYG",
      editorOutput("wysiwyg"),
      tags$b("CHECK HEIGHT")
    ),
    tabPanel(
      title = "Vertical",
      editorOutput("vertical"),
      tags$b("CHECK HEIGHT")
    )
  )
)

server <- function(input, output, session) {
  
  output$default <- renderEditor({
    editor(minHeight = "400px")
  })
  
  output$wysiwyg <- renderEditor({
    editor(initialEditType = "wysiwyg", hideModeSwitch = TRUE)
  })
  
  output$vertical <- renderEditor({
    editor(previewStyle = "vertical")
  })
  
}

if (interactive())
  shinyApp(ui, server)
