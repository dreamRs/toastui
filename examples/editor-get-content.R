
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("Get editor's content"),
  editorOutput("my_editor"),
  tags$b("In markdown :"),
  verbatimTextOutput("res_md"),
  tags$b("In HTML :"),
  verbatimTextOutput("res_html")
)

server <- function(input, output, session) {

  output$my_editor <- renderEditor({
    editor(
      initialEditType = "wysiwyg",
      hideModeSwitch = TRUE,
      getMarkdownOnChange = TRUE,
      getHTMLOnChange = TRUE
    )
  })
  
  output$res_md <- renderPrint({
    input$my_editor_markdown
  })
  
  output$res_html <- renderPrint({
    input$my_editor_html
  })
}

if (interactive())
  shinyApp(ui, server)
