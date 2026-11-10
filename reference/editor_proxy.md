# Proxy for editor htmlwidget

Proxy for editor htmlwidget

## Usage

``` r
editor_proxy(shinyId, session = shiny::getDefaultReactiveDomain())
```

## Arguments

- shinyId:

  single-element character vector indicating the output ID of the chart
  to modify (if invoked from a Shiny module, the namespace will be added
  automatically).

- session:

  the Shiny session object to which the chart belongs; usually the
  default value will suffice.

## Value

A `editor_proxy` object.

## See also

Other editor proxy methods:
[`editor-proxy-show-hide`](https://dreamrs.github.io/toastui/reference/editor-proxy-show-hide.md),
[`editor_proxy_change_preview()`](https://dreamrs.github.io/toastui/reference/editor_proxy_change_preview.md),
[`editor_proxy_insert()`](https://dreamrs.github.io/toastui/reference/editor_proxy_insert.md),
[`editor_proxy_reset()`](https://dreamrs.github.io/toastui/reference/editor_proxy_reset.md)

## Examples

``` r
if (FALSE) { # \dontrun{

# Consider having created a editor widget with
editorOutput("my_editor") # UI
output$my_editor <- renderEditor({}) # Server

# Then you can call proxy methods in observer:

# set editor proxy then call a cal_proxy_* function
editor_proxy("my_editor") %>%
  cal_proxy_today()

# or directly
cal_proxy_today("my_editor")

} # }
```
