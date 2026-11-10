# Shiny bindings for [`chart()`](https://dreamrs.github.io/toastui/reference/chart.md)

Output and render functions for using
[`chart()`](https://dreamrs.github.io/toastui/reference/chart.md) within
Shiny applications and interactive Rmd documents.

## Usage

``` r
chartOutput(outputId, width = "100%", height = "400px")

renderChart(expr, env = parent.frame(), quoted = FALSE)
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
```
