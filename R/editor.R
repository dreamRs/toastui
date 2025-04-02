
#' Create an interactive editor
#'
#' @param ... Options for the editor, see examples or [online reference](https://nhn.github.io/tui.editor/latest/ToastUIEditorCore/).
#' @param getMarkdownOnChange,getHTMLOnChange Get editor's content in Shiny application through an input value : `input$<outputId>_(markdown|html)`.
#' @param height,width Height and width for the chart.
#' @param elementId An optional id.
#'
#' @returns An `editor` htmlwidget.
#' @export
#'
#' @example examples/ex-editor.R
editor <- function(...,
                   getMarkdownOnChange = TRUE,
                   getHTMLOnChange = TRUE,
                   width = NULL,
                   height = NULL,
                   elementId = NULL) {
  
  x <- list_(
    options = list(
      usageStatistics = getOption("toastuiUsageStatistics", default = FALSE),
      height = "100%",
      ...
    ),
    getMarkdownOnChange = isTRUE(getMarkdownOnChange),
    getHTMLOnChange = isTRUE(getHTMLOnChange)
  )
  
  createWidget(
    name = "editor",
    x = x,
    width = width,
    height = height,
    package = "toastui",
    elementId = elementId,
    sizingPolicy = sizingPolicy(
      padding = 0,
      defaultWidth = "100%",
      defaultHeight = "100%",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "100%",
      knitr.figure = FALSE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = "600px",
      browser.fill = TRUE,
      viewer.suppress = FALSE,
      browser.external = TRUE
    )
  )
}


#' @importFrom htmltools tagList tags
editor_html <- function(id, style, class, ...) {
  tags$div(
    id = id,
    class = "toastui-editor-container", 
    style = style,
    class = class,
    ...,
    tags$div(id = paste0(id, "-editor"), style = "width:100%;height:100%;")
  )
}


