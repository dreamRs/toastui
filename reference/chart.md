# Interactive charts

Interactive charts

## Usage

``` r
chart(
  data = list(),
  mapping = NULL,
  type = c("column", "bar", "area", "line", "scatter", "bubble", "boxPlot", "heatmap",
    "treemap", "radialBar", "pie", "gauge"),
  ...,
  options = list(),
  height = NULL,
  width = NULL,
  elementId = NULL
)
```

## Arguments

- data:

  A `data.frame` if used with `mapping` otherwise a configuration
  `list`.

- mapping:

  Default list of aesthetic mappings to use for chart if `data` is a
  `data.frame`.

- type:

  Type of chart.

- ...:

  Optional arguments (currently not used).

- options:

  A `list` of options for the chart.

- height, width:

  Height and width for the chart.

- elementId:

  An optional id.

## Value

A `chart` htmlwidget.

## See also

[`chartOutput()`](https://dreamrs.github.io/toastui/reference/chart-shiny.md)
/
[`renderChart()`](https://dreamrs.github.io/toastui/reference/chart-shiny.md)
for usage in Shiny applications.

## Examples

``` r
library(toastui)

# Some data
mydata <- data.frame(
  month = month.name,
  value = sample(1:100, 12)
)

# Chart using mapping
chart(mydata, caes(x = month, y = value), type = "bar")

{"x":{"config":{"type":"barChart","data":{"categories":["January","February","March","April","May","June","July","August","September","October","November","December"],"series":[{"name":"value","data":[8,45,29,30,98,76,24,52,12,54,77,100]}]},"options":{"chart":{"height":"auto","width":"auto"},"xAxis":{"title":"month"},"yAxis":{"title":"value"},"usageStatistics":false}}},"evals":[],"jsHooks":[]}
# Otherwise:
chart(
  data = list(
    categories = mydata$month,
    series = list(
      list(
        name = "Value", 
        data = mydata$value
      )
    )
  ),
  options = list(
    chart = list(title = "My title"),
    legend = list(visible = FALSE)
  ),
  type = "column"
)

{"x":{"config":{"type":"columnChart","data":{"categories":["January","February","March","April","May","June","July","August","September","October","November","December"],"series":[{"name":"Value","data":[8,45,29,30,98,76,24,52,12,54,77,100]}]},"options":{"chart":{"title":"My title","height":"auto","width":"auto"},"legend":{"visible":false},"usageStatistics":false}}},"evals":[],"jsHooks":[]}
```
