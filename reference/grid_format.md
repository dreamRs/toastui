# Format column content

Format column content

## Usage

``` r
grid_format(grid, column, formatter)
```

## Arguments

- grid:

  A table created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- column:

  Name of the column to format.

- formatter:

  Either an R function or a JavaScript function wrapped in
  [`JS()`](https://dreamrs.github.io/toastui/reference/toastui-exports.md).

## Value

A `datagrid` htmlwidget.

## Examples

``` r
library(toastui)
library(scales)

# Create some data
data <- data.frame(
  col_num = rnorm(12),
  col_currency = sample(1:1e6, 12, TRUE),
  col_percentage = sample(1:100, 12, TRUE) / 100,
  col_date = sample(Sys.Date() + 0:364, 12),
  col_time = Sys.time() + sample.int(86400 * 365, 12),
  col_logical = sample(c(TRUE, FALSE), 12, TRUE),
  stringsAsFactors = FALSE
)


# Use R functions
datagrid(data, colwidths = "fit") %>% 
  grid_format(
    "col_percentage", label_percent(accuracy = 1)
  ) %>%
  grid_format(
    "col_currency", label_dollar(prefix = "$", big.mark = ",")
  ) %>%
  grid_format(
    "col_num", label_number(accuracy = 0.01)
  ) %>% 
  grid_format(
    "col_date", label_date(format = "%d/%m/%Y")
  ) %>% 
  grid_format(
    "col_time", label_date(format = "%d/%m/%Y %H:%M")
  ) %>% 
  grid_format(
    "col_logical", function(value) {
      lapply(
        X = value,
        FUN = function(x) {
          if (x)
            shiny::icon("check")
          else
            shiny::icon("times")
        }
      )
    }
  )

  

{"x":{"nrow":12,"ncol":6,"data":[[-0.9976304916432087,1.197114834157949,-1.772680937751618,0.7848441118815217,-0.4373411309348529,-0.351740874418067,1.303965632514347,-1.083202293048638,-1.22477581085736,0.08493307905952115,0.5814244354011255,0.4505869533444272],[930268,721882,333214,479132,149449,28417,372672,857945,812429,572977,902630,643238],[0.73,0.11,0.9,0.6,0.68,0.88,0.61,0.12,0.23,0.71,0.11,0.6899999999999999],["2027-04-18","2027-03-10","2027-10-01","2027-06-03","2027-11-06","2027-01-26","2027-07-02","2027-03-03","2027-06-06","2027-04-21","2027-01-07","2027-03-30"],["2027-01-26T08:08:17Z","2027-06-06T14:51:36Z","2027-05-31T18:54:01Z","2027-08-02T13:19:39Z","2026-12-06T10:41:50Z","2027-07-25T20:05:09Z","2027-06-04T10:40:53Z","2027-02-20T06:37:14Z","2027-05-04T05:46:26Z","2027-10-11T15:34:02Z","2027-09-20T04:14:34Z","2027-05-30T08:48:18Z"],[true,true,true,false,true,false,false,true,false,false,true,false]],"colnames":["col_num","col_currency","col_percentage","col_date","col_time","col_logical"],"options":{"columns":[{"header":"col_num","name":"col_num","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.format","options":{"formatted":["-1.00","1.20","-1.77","0.78","-0.44","-0.35","1.30","-1.08","-1.22","0.08","0.58","0.45"]}}},{"header":"col_currency","name":"col_currency","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.format","options":{"formatted":["$930,268","$721,882","$333,214","$479,132","$149,449","$28,417","$372,672","$857,945","$812,429","$572,977","$902,630","$643,238"]}}},{"header":"col_percentage","name":"col_percentage","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.format","options":{"formatted":["73%","11%","90%","60%","68%","88%","61%","12%","23%","71%","11%","69%"]}}},{"header":"col_date","name":"col_date","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.format","options":{"formatted":["18/04/2027","10/03/2027","01/10/2027","03/06/2027","06/11/2027","26/01/2027","02/07/2027","03/03/2027","06/06/2027","21/04/2027","07/01/2027","30/03/2027"]}}},{"header":"col_time","name":"col_time","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.format","options":{"formatted":["26/01/2027 08:08","06/06/2027 14:51","31/05/2027 18:54","02/08/2027 13:19","06/12/2026 10:41","25/07/2027 20:05","04/06/2027 10:40","20/02/2027 06:37","04/05/2027 05:46","11/10/2027 15:34","20/09/2027 04:14","30/05/2027 08:48"]}}},{"header":"col_logical","name":"col_logical","sortable":true,"align":"center","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.format","options":{"formatted":["<i class=\"fas fa-check\" role=\"presentation\" aria-label=\"check icon\"><\/i>","<i class=\"fas fa-check\" role=\"presentation\" aria-label=\"check icon\"><\/i>","<i class=\"fas fa-check\" role=\"presentation\" aria-label=\"check icon\"><\/i>","<i class=\"fas fa-xmark\" role=\"presentation\" aria-label=\"xmark icon\"><\/i>","<i class=\"fas fa-check\" role=\"presentation\" aria-label=\"check icon\"><\/i>","<i class=\"fas fa-xmark\" role=\"presentation\" aria-label=\"xmark icon\"><\/i>","<i class=\"fas fa-xmark\" role=\"presentation\" aria-label=\"xmark icon\"><\/i>","<i class=\"fas fa-check\" role=\"presentation\" aria-label=\"check icon\"><\/i>","<i class=\"fas fa-xmark\" role=\"presentation\" aria-label=\"xmark icon\"><\/i>","<i class=\"fas fa-xmark\" role=\"presentation\" aria-label=\"xmark icon\"><\/i>","<i class=\"fas fa-check\" role=\"presentation\" aria-label=\"check icon\"><\/i>","<i class=\"fas fa-xmark\" role=\"presentation\" aria-label=\"xmark icon\"><\/i>"]}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.columns.0.renderer.type","options.columns.1.renderer.type","options.columns.2.renderer.type","options.columns.3.renderer.type","options.columns.4.renderer.type","options.columns.5.renderer.type"],"jsHooks":[]}

# Use a JavaScript function
datagrid(data) %>% 
  grid_format(
    column = "col_percentage",
    formatter = JS("function(obj) {return (obj.value*100).toFixed(0) + '%';}")
  )

  

{"x":{"nrow":12,"ncol":6,"data":[[-0.9976304916432087,1.197114834157949,-1.772680937751618,0.7848441118815217,-0.4373411309348529,-0.351740874418067,1.303965632514347,-1.083202293048638,-1.22477581085736,0.08493307905952115,0.5814244354011255,0.4505869533444272],[930268,721882,333214,479132,149449,28417,372672,857945,812429,572977,902630,643238],[0.73,0.11,0.9,0.6,0.68,0.88,0.61,0.12,0.23,0.71,0.11,0.6899999999999999],["2027-04-18","2027-03-10","2027-10-01","2027-06-03","2027-11-06","2027-01-26","2027-07-02","2027-03-03","2027-06-06","2027-04-21","2027-01-07","2027-03-30"],["2027-01-26T08:08:17Z","2027-06-06T14:51:36Z","2027-05-31T18:54:01Z","2027-08-02T13:19:39Z","2026-12-06T10:41:50Z","2027-07-25T20:05:09Z","2027-06-04T10:40:53Z","2027-02-20T06:37:14Z","2027-05-04T05:46:26Z","2027-10-11T15:34:02Z","2027-09-20T04:14:34Z","2027-05-30T08:48:18Z"],[true,true,true,false,true,false,false,true,false,false,true,false]],"colnames":["col_num","col_currency","col_percentage","col_date","col_time","col_logical"],"options":{"columns":[{"header":"col_num","name":"col_num","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"col_currency","name":"col_currency","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"col_percentage","name":"col_percentage","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"formatter":"function(obj) {return (obj.value*100).toFixed(0) + '%';}"},{"header":"col_date","name":"col_date","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"col_time","name":"col_time","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"col_logical","name":"col_logical","sortable":true,"align":"center","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.columns.2.formatter"],"jsHooks":[]}

```
