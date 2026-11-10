# Insert text in an editor

Insert text in an editor

## Usage

``` r
editor_proxy_insert(proxy, text)
```

## Arguments

- proxy:

  A
  [`editor_proxy()`](https://dreamrs.github.io/toastui/reference/editor_proxy.md)
  or `outputId` of the editor

- text:

  Text to insert.

## Value

A `editor_proxy` object.

## See also

Other editor proxy methods:
[`editor-proxy-show-hide`](https://dreamrs.github.io/toastui/reference/editor-proxy-show-hide.md),
[`editor_proxy()`](https://dreamrs.github.io/toastui/reference/editor_proxy.md),
[`editor_proxy_change_preview()`](https://dreamrs.github.io/toastui/reference/editor_proxy_change_preview.md),
[`editor_proxy_reset()`](https://dreamrs.github.io/toastui/reference/editor_proxy_reset.md)

## Examples

``` r

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
      actionButton("insert", "Insert text", width = "100%"),
      tags$br(), tags$br(),
      actionButton("reset", "Reset", width = "100%")
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

  observeEvent(input$reset, {
    editor_proxy_reset("my_editor")
  })

}

if (interactive())
  shinyApp(ui, server)
```
