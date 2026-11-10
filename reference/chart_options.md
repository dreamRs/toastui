# Chart options

Chart options

## Usage

``` r
chart_options(.chart, ...)
```

## Arguments

- .chart:

  A `chart` htmlwidget.

- ...:

  Named list of options, options depends on chart's type, see common
  options
  [here](https://github.com/nhn/tui.chart/blob/main/docs/en/common-chart-options.md).

## Value

A `chart` htmlwidget.

## Examples

``` r
chart(mtcars, caes(x = mpg, y = wt), type = "scatter") %>% 
  chart_options(
    chart = list(title = "A scatter chart")
  )

{"x":{"config":{"type":"scatterChart","data":{"series":[{"name":"wt","data":[{"x":21,"y":2.62},{"x":21,"y":2.875},{"x":22.8,"y":2.32},{"x":21.4,"y":3.215},{"x":18.7,"y":3.44},{"x":18.1,"y":3.46},{"x":14.3,"y":3.57},{"x":24.4,"y":3.19},{"x":22.8,"y":3.15},{"x":19.2,"y":3.44},{"x":17.8,"y":3.44},{"x":16.4,"y":4.07},{"x":17.3,"y":3.73},{"x":15.2,"y":3.78},{"x":10.4,"y":5.25},{"x":10.4,"y":5.424},{"x":14.7,"y":5.345},{"x":32.4,"y":2.2},{"x":30.4,"y":1.615},{"x":33.9,"y":1.835},{"x":21.5,"y":2.465},{"x":15.5,"y":3.52},{"x":15.2,"y":3.435},{"x":13.3,"y":3.84},{"x":19.2,"y":3.845},{"x":27.3,"y":1.935},{"x":26,"y":2.14},{"x":30.4,"y":1.513},{"x":15.8,"y":3.17},{"x":19.7,"y":2.77},{"x":15,"y":3.57},{"x":21.4,"y":2.78}]}]},"options":{"chart":{"height":"auto","width":"auto","title":"A scatter chart"},"xAxis":{"title":"mpg"},"yAxis":{"title":"wt"},"usageStatistics":false}}},"evals":[],"jsHooks":[]}
```
