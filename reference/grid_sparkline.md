# Render HTMLwidgets in Grid

Create small charts in a column.

## Usage

``` r
grid_sparkline(grid, column, renderer, height = "40px", styles = NULL)
```

## Arguments

- grid:

  A grid created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- column:

  Column data are stored and where to render widgets.

- renderer:

  A `function` that will create an HTMLwidget.

- height:

  Height of the row (applies to all table).

- styles:

  A `list` of CSS parameters to apply to the cells where widgets are
  rendered.

## Value

A `datagrid` htmlwidget.

## Examples

``` r

library(toastui)
library(apexcharter)

# Create some fake data
spark <- data.frame(
  month = month.name,
  stringsAsFactors = FALSE
)
# Create a list-columns with data.frames
# from which to create charts
spark$data <- lapply(
  X = seq_len(12),
  FUN = function(x) {
    data.frame(x = 1:10, y = sample(1:30, 10, TRUE))
  }
)

# Create the grid
datagrid(spark) %>%
  grid_columns(
    columns = "month", width = 150
  ) %>%
  grid_sparkline(
    column = "data",
    renderer = function(data) { # this function will render a chart
      apex(data, aes(x, y), type = "area") %>%
        ax_chart(sparkline = list(enabled = TRUE))
    }
  )

  

{"x":{"nrow":12,"ncol":2,"data":[["January","February","March","April","May","June","July","August","September","October","November","December"],[{"x":[1,2,3,4,5,6,7,8,9,10],"y":[3,21,21,13,3,15,19,5,25,26]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[28,26,16,10,25,21,29,4,1,10]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[25,14,4,26,9,5,9,22,8,11]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[16,24,22,1,24,24,18,1,29,9]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[14,25,19,26,19,22,16,17,4,2]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[13,5,1,21,10,4,24,21,23,17]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[15,17,21,28,23,3,8,12,15,19]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[12,13,12,22,6,8,14,19,5,4]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[24,15,12,19,7,7,8,30,12,12]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[8,4,29,25,29,6,18,6,30,26]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[11,24,12,21,15,17,15,2,17,3]},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[22,25,18,6,8,21,3,10,27,25]}]],"colnames":["month","data"],"options":{"columns":[{"header":"month","name":"month","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"width":150},{"header":"data","name":"data","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.htmlwidgets","options":{"rendered":["<div id=\"htmlwidget-6f26f0ed0afa75893bea\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-6f26f0ed0afa75893bea\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":3},{\"x\":2,\"y\":21},{\"x\":3,\"y\":21},{\"x\":4,\"y\":13},{\"x\":5,\"y\":3},{\"x\":6,\"y\":15},{\"x\":7,\"y\":19},{\"x\":8,\"y\":5},{\"x\":9,\"y\":25},{\"x\":10,\"y\":26}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-3881588870bf0a0012a2\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-3881588870bf0a0012a2\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":28},{\"x\":2,\"y\":26},{\"x\":3,\"y\":16},{\"x\":4,\"y\":10},{\"x\":5,\"y\":25},{\"x\":6,\"y\":21},{\"x\":7,\"y\":29},{\"x\":8,\"y\":4},{\"x\":9,\"y\":1},{\"x\":10,\"y\":10}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-ef69786467e2ecad0f8b\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-ef69786467e2ecad0f8b\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":25},{\"x\":2,\"y\":14},{\"x\":3,\"y\":4},{\"x\":4,\"y\":26},{\"x\":5,\"y\":9},{\"x\":6,\"y\":5},{\"x\":7,\"y\":9},{\"x\":8,\"y\":22},{\"x\":9,\"y\":8},{\"x\":10,\"y\":11}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-e0da4d653978710b975b\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-e0da4d653978710b975b\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":16},{\"x\":2,\"y\":24},{\"x\":3,\"y\":22},{\"x\":4,\"y\":1},{\"x\":5,\"y\":24},{\"x\":6,\"y\":24},{\"x\":7,\"y\":18},{\"x\":8,\"y\":1},{\"x\":9,\"y\":29},{\"x\":10,\"y\":9}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-25b9ef4348d2c6cf6bff\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-25b9ef4348d2c6cf6bff\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":14},{\"x\":2,\"y\":25},{\"x\":3,\"y\":19},{\"x\":4,\"y\":26},{\"x\":5,\"y\":19},{\"x\":6,\"y\":22},{\"x\":7,\"y\":16},{\"x\":8,\"y\":17},{\"x\":9,\"y\":4},{\"x\":10,\"y\":2}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-91621a5973f5c8092e2d\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-91621a5973f5c8092e2d\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":13},{\"x\":2,\"y\":5},{\"x\":3,\"y\":1},{\"x\":4,\"y\":21},{\"x\":5,\"y\":10},{\"x\":6,\"y\":4},{\"x\":7,\"y\":24},{\"x\":8,\"y\":21},{\"x\":9,\"y\":23},{\"x\":10,\"y\":17}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-ce0e8cbde1bf19288adf\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-ce0e8cbde1bf19288adf\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":15},{\"x\":2,\"y\":17},{\"x\":3,\"y\":21},{\"x\":4,\"y\":28},{\"x\":5,\"y\":23},{\"x\":6,\"y\":3},{\"x\":7,\"y\":8},{\"x\":8,\"y\":12},{\"x\":9,\"y\":15},{\"x\":10,\"y\":19}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-f4b92ea4d3f1c183dccb\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-f4b92ea4d3f1c183dccb\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":12},{\"x\":2,\"y\":13},{\"x\":3,\"y\":12},{\"x\":4,\"y\":22},{\"x\":5,\"y\":6},{\"x\":6,\"y\":8},{\"x\":7,\"y\":14},{\"x\":8,\"y\":19},{\"x\":9,\"y\":5},{\"x\":10,\"y\":4}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-61d4c9337aaf375190d2\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-61d4c9337aaf375190d2\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":24},{\"x\":2,\"y\":15},{\"x\":3,\"y\":12},{\"x\":4,\"y\":19},{\"x\":5,\"y\":7},{\"x\":6,\"y\":7},{\"x\":7,\"y\":8},{\"x\":8,\"y\":30},{\"x\":9,\"y\":12},{\"x\":10,\"y\":12}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-97155859c8045c55bb95\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-97155859c8045c55bb95\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":8},{\"x\":2,\"y\":4},{\"x\":3,\"y\":29},{\"x\":4,\"y\":25},{\"x\":5,\"y\":29},{\"x\":6,\"y\":6},{\"x\":7,\"y\":18},{\"x\":8,\"y\":6},{\"x\":9,\"y\":30},{\"x\":10,\"y\":26}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-609e86c7db527ade6c79\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-609e86c7db527ade6c79\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":11},{\"x\":2,\"y\":24},{\"x\":3,\"y\":12},{\"x\":4,\"y\":21},{\"x\":5,\"y\":15},{\"x\":6,\"y\":17},{\"x\":7,\"y\":15},{\"x\":8,\"y\":2},{\"x\":9,\"y\":17},{\"x\":10,\"y\":3}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>","<div id=\"htmlwidget-bed95d896ae9ca7297c3\" style=\"width:100%;height:40px;\" class=\"apexcharter html-widget\"><\/div>\n<script type=\"application/json\" data-for=\"htmlwidget-bed95d896ae9ca7297c3\">{\"x\":{\"ax_opts\":{\"chart\":{\"type\":\"area\",\"sparkline\":{\"enabled\":true}},\"series\":[{\"name\":\"y\",\"type\":\"area\",\"data\":[{\"x\":1,\"y\":22},{\"x\":2,\"y\":25},{\"x\":3,\"y\":18},{\"x\":4,\"y\":6},{\"x\":5,\"y\":8},{\"x\":6,\"y\":21},{\"x\":7,\"y\":3},{\"x\":8,\"y\":10},{\"x\":9,\"y\":27},{\"x\":10,\"y\":25}]}],\"dataLabels\":{\"enabled\":false},\"stroke\":{\"curve\":\"straight\",\"width\":2},\"yaxis\":{\"decimalsInFloat\":2,\"labels\":{\"style\":{\"colors\":\"#848484\"}}},\"xaxis\":{\"labels\":{\"style\":{\"colors\":\"#848484\"}}}},\"auto_update\":{\"series_animate\":true,\"update_options\":false,\"options_animate\":true,\"options_redrawPaths\":true,\"update_synced_charts\":false},\"sparkbox\":false,\"xaxis\":{\"min\":1,\"max\":10},\"type\":\"area\"},\"evals\":[],\"jsHooks\":[]}<\/script>"],"styles":null}},"className":"datagrid-sparkline-cell"}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"40px"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.columns.1.renderer.type"],"jsHooks":[]}
# You can also use package highcharter for example
# by using the following renderer:
# renderer = function(data) {
#   hchart(data, type = "area", hcaes(x, y)) %>%
#     hc_add_theme(hc_theme_sparkline())
# }
```
