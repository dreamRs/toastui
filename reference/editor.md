# Create an interactive editor

Create an interactive editor

## Usage

``` r
editor(
  ...,
  getMarkdownOnChange = TRUE,
  getHTMLOnChange = TRUE,
  width = NULL,
  height = NULL,
  elementId = NULL
)
```

## Arguments

- ...:

  Options for the editor, see examples or [online
  reference](https://nhn.github.io/tui.editor/latest/ToastUIEditorCore/).

- getMarkdownOnChange, getHTMLOnChange:

  Get editor's content in Shiny application through an input value :
  `input$<outputId>_(markdown|html)`.

- height, width:

  Height and width for the chart.

- elementId:

  An optional id.

## Value

An `editor` htmlwidget.

## Examples

``` r
# Default is markdown editor with tab to switch to preview
editor()

  

{"x":{"options":{"usageStatistics":false,"height":"100%"},"getMarkdownOnChange":true,"getHTMLOnChange":true},"evals":[],"jsHooks":[]}# equivalent to
editor(previewStyle = "tab")

  

{"x":{"options":{"usageStatistics":false,"height":"100%","previewStyle":"tab"},"getMarkdownOnChange":true,"getHTMLOnChange":true},"evals":[],"jsHooks":[]}# Show preview side by side
editor(previewStyle = "vertical")

  

{"x":{"options":{"usageStatistics":false,"height":"100%","previewStyle":"vertical"},"getMarkdownOnChange":true,"getHTMLOnChange":true},"evals":[],"jsHooks":[]}
# Default edit type is markdown
editor(initialEditType = "markdown")

  

{"x":{"options":{"usageStatistics":false,"height":"100%","initialEditType":"markdown"},"getMarkdownOnChange":true,"getHTMLOnChange":true},"evals":[],"jsHooks":[]}# Change to wysiwyg and remove switch mode option
editor(initialEditType = "wysiwyg", hideModeSwitch = TRUE)

  

{"x":{"options":{"usageStatistics":false,"height":"100%","initialEditType":"wysiwyg","hideModeSwitch":true},"getMarkdownOnChange":true,"getHTMLOnChange":true},"evals":[],"jsHooks":[]}
# i18n : change language
editor(language = "fr")

  

{"x":{"options":{"usageStatistics":false,"height":"100%","language":"fr"},"getMarkdownOnChange":true,"getHTMLOnChange":true},"evals":[],"jsHooks":[]}editor(language = "ar")

  

{"x":{"options":{"usageStatistics":false,"height":"100%","language":"ar"},"getMarkdownOnChange":true,"getHTMLOnChange":true},"evals":[],"jsHooks":[]}# see https://github.com/nhn/tui.editor/blob/master/docs/en/i18n.md for other supported languages
```
