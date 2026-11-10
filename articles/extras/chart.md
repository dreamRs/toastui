# Chart

``` r

library(toastui)
library(ggplot2)
library(dplyr)
```

Interactive charts with [tui-chart](https://ui.toast.com/tui-chart)
library. Currently support is minimal since there’s a lot of htmlwidgets
for creating charts.

## Bars / columns

``` r

count(mpg, class) %>% 
  chart(aes(class, n), type = "column") %>% 
  chart_options(legend = list(visible = FALSE))
```

``` r

count(mpg, class, year) %>% 
  chart(aes(class, n, fill = year), type = "column") %>% 
  chart_options(legend = list(align = "bottom"))
```

## Scatter

``` r

chart(mpg, aes(displ, hwy), type = "scatter")
```

## Lines / Areas

``` r

chart(economics, aes(date, psavert), type = "line")
```

``` r

economics_long %>% 
  filter(variable %in% c("psavert", "uempmed")) %>% 
  chart(caes(date, value, color = variable), type = "line")
```

## Heatmap

``` r

txhousing %>% 
  filter(city == "Houston") %>%
  chart(aes(month, year, fill = sales), type = "heatmap")
```

## Treemap

``` r

chart(mpg, aes(manufacturer, model), "treemap") %>% 
  chart_options(
    series = list(
      dataLabels = list(visible = TRUE)
    )
  )
```

``` r

txhousing %>% 
  filter(year == 2015) %>% 
  group_by(city) %>% 
  summarise(sales = sum(sales)) %>% 
  chart(aes(city, value = sales, colorValue = sales), type = "treemap")
#> Warning: chart: Removed 6 rows containing missing values
```

## Gauge

``` r

chart(list(Speed = 80), type = "gauge", height = "500px") %>% 
  chart_options(
    circularAxis = list(scale = list(min = 0, max = 90), title = "km/h"),
    series = list(angleRange = list(start = 225, end = 135)),
    plot = list(
      bands = list(
        list(range = c(0, 20), color = "#55bf3b"),
        list(range = c(20, 50), color = "#dddf0d"),
        list(range = c(50, 90), color = "#df5353")
      )
    ),
    theme = list(plot = list(bands = list(barWidth = 40)))
  )
```
