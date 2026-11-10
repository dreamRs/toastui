# Shiny bindings for [`editor()`](https://dreamrs.github.io/toastui/reference/editor.md)

Output and render functions for using
[`editor()`](https://dreamrs.github.io/toastui/reference/editor.md)
within Shiny applications and interactive Rmd documents.

## Usage

``` r
editorOutput(outputId, width = "100%", height = "600px")

renderEditor(expr, env = parent.frame(), quoted = FALSE)
```

## Arguments

- outputId:

  Output variable to read from.

- width, height:

  Must be a valid CSS unit (like `100%`, `400px`, `auto`) or a number,
  which will be coerced to a string and have `px` appended.

- expr:

  An expression that generates a calendar

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.

## Value

Output element that can be included in UI. Render function to create
output in server.

## Examples

``` r

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
```
