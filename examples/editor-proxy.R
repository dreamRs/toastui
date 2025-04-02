
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("Use editor's proxy"),
  fluidRow(
    column(
      width = 4,
      radioButtons(
        inputId = "changePreviewStyle",
        label = "change preview style",
        choices = c("tab", "vertical")
      ),
      checkboxInput(
        inputId = "showhide",
        label = "Show/hide editor", 
        value = TRUE
      ),
      textInput(
        inputId = "text",
        label = "Text to insert:",
        width = "100%"
      ),
      actionButton("insert", "Insert text")
    ),
    column(
      width = 8,
      editorOutput("my_editor")
    )
  )
)

server <- function(input, output, session) {
  
  output$my_editor <- renderEditor({
    editor()
  })
  
  observeEvent(input$changePreviewStyle, {
    editor_proxy_change_preview("my_editor", input$changePreviewStyle)
  }, ignoreInit = TRUE)
  
  observeEvent(input$showhide, {
    if (input$showhide) {
      editor_proxy_show("my_editor")
    } else {
      editor_proxy_hide("my_editor")
    }
  }, ignoreInit = TRUE)
  
  observeEvent(input$insert, {
    editor_proxy_insert("my_editor", text = input$text)
  })
  
}

if (interactive())
  shinyApp(ui, server)
