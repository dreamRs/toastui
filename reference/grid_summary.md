# Add summary area to grid

Add summary area to grid

## Usage

``` r
grid_summary(
  grid,
  columns,
  stat = c("sum", "min", "max", "avg"),
  digits = 0,
  label = NULL,
  sep = "<br>",
  position = c("bottom", "top"),
  height = 40,
  js_function = NULL
)
```

## Arguments

- grid:

  A table created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- columns:

  Name of column (variable name) for which to add a summary.

- stat:

  Statistic to display: `"sum"`, `"min"`, `"max"` or `"avg"`. Can be
  several values.

- digits:

  Number of digits to display.

- label:

  Label to display next to statistic.

- sep:

  Separator between several statistics.

- position:

  The position of the summary area: `"bottom"` or `"top"`.

- height:

  The height of the summary area.

- js_function:

  JavaScript function to compute the statistic you want. Function should
  have one argument, it will be the values of the column. If used,
  `stat`, `digits`, `label` and `sep` will be ignored.

## Value

A `datagrid` htmlwidget.

## Examples

``` r
library(toastui)

# Add a line with sum of column
datagrid(ps3_games[, c(1, 5, 6, 7, 8)], colwidths = "guess") %>% 
  grid_summary(
    column = "NA_Sales",
    stat = "sum"
  )

  

{"x":{"nrow":20,"ncol":5,"data":[["Grand Theft Auto V","Call of Duty: Black Ops II","Call of Duty: Modern Warfare 3","Call of Duty: Black Ops","Gran Turismo 5","Call of Duty: Modern Warfare 2","Grand Theft Auto IV","Call of Duty: Ghosts","FIFA Soccer 13","Battlefield 3","FIFA 14","Uncharted 3: Drake's Deception","Uncharted 2: Among Thieves","Call of Duty 4: Modern Warfare","FIFA 12","Red Dead Redemption","The Elder Scrolls V: Skyrim","Assassin's Creed III","Metal Gear Solid 4: Guns of the Patriots","The Last of Us"],[7.01,4.99,5.54,5.98,2.96,4.99,4.76,4.09,1.06,2.85,0.78,2.77,3.27,3.1,0.84,2.79,2.55,2.64,2.63,2.41],[9.27,5.88,5.82,4.44,4.88,3.69,3.76,3.73,5.05,2.93,4.32,2.8,2.25,2.3,4.32,2.61,2.71,2.56,1.74,2.28],[0.97,0.65,0.49,0.48,0.8100000000000001,0.38,0.44,0.38,0.13,0.35,0.07000000000000001,0.19,0.21,0.28,0.11,0.17,0.25,0.16,0.83,0.28],[4.14,2.52,1.62,1.83,2.12,1.63,1.62,1.38,2.01,1.1,1.73,1.06,1,1.04,1.42,1.03,1.05,1.14,0.83,1.01]],"colnames":["Name","NA_Sales","EU_Sales","JP_Sales","Other_Sales"],"options":{"columns":[{"header":"Name","name":"Name","sortable":true,"align":"left","minWidth":160,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"NA_Sales","name":"NA_Sales","sortable":true,"align":"right","minWidth":84,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"EU_Sales","name":"EU_Sales","sortable":true,"align":"right","minWidth":84,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"JP_Sales","name":"JP_Sales","sortable":true,"align":"right","minWidth":84,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Other_Sales","name":"Other_Sales","sortable":true,"align":"right","minWidth":100,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto","summary":{"columnContent":{"NA_Sales":{"template":"function(valueMap) { \nreturn 'sum: ' + valueMap.sum.toFixed(0);\n }"}},"position":"bottom","height":40}},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.summary.columnContent.NA_Sales.template"],"jsHooks":[]}
# Do that for several columns
datagrid(ps3_games[, c(1, 5, 6, 7, 8)], colwidths = "guess") %>% 
  grid_summary(
    column = c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales"),
    stat = "sum",
    label = "Total: "
  )

  

{"x":{"nrow":20,"ncol":5,"data":[["Grand Theft Auto V","Call of Duty: Black Ops II","Call of Duty: Modern Warfare 3","Call of Duty: Black Ops","Gran Turismo 5","Call of Duty: Modern Warfare 2","Grand Theft Auto IV","Call of Duty: Ghosts","FIFA Soccer 13","Battlefield 3","FIFA 14","Uncharted 3: Drake's Deception","Uncharted 2: Among Thieves","Call of Duty 4: Modern Warfare","FIFA 12","Red Dead Redemption","The Elder Scrolls V: Skyrim","Assassin's Creed III","Metal Gear Solid 4: Guns of the Patriots","The Last of Us"],[7.01,4.99,5.54,5.98,2.96,4.99,4.76,4.09,1.06,2.85,0.78,2.77,3.27,3.1,0.84,2.79,2.55,2.64,2.63,2.41],[9.27,5.88,5.82,4.44,4.88,3.69,3.76,3.73,5.05,2.93,4.32,2.8,2.25,2.3,4.32,2.61,2.71,2.56,1.74,2.28],[0.97,0.65,0.49,0.48,0.8100000000000001,0.38,0.44,0.38,0.13,0.35,0.07000000000000001,0.19,0.21,0.28,0.11,0.17,0.25,0.16,0.83,0.28],[4.14,2.52,1.62,1.83,2.12,1.63,1.62,1.38,2.01,1.1,1.73,1.06,1,1.04,1.42,1.03,1.05,1.14,0.83,1.01]],"colnames":["Name","NA_Sales","EU_Sales","JP_Sales","Other_Sales"],"options":{"columns":[{"header":"Name","name":"Name","sortable":true,"align":"left","minWidth":160,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"NA_Sales","name":"NA_Sales","sortable":true,"align":"right","minWidth":84,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"EU_Sales","name":"EU_Sales","sortable":true,"align":"right","minWidth":84,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"JP_Sales","name":"JP_Sales","sortable":true,"align":"right","minWidth":84,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Other_Sales","name":"Other_Sales","sortable":true,"align":"right","minWidth":100,"whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto","summary":{"columnContent":{"NA_Sales":{"template":"function(valueMap) { \nreturn 'Total: ' + valueMap.sum.toFixed(0);\n }"},"EU_Sales":{"template":"function(valueMap) { \nreturn 'Total: ' + valueMap.sum.toFixed(0);\n }"},"JP_Sales":{"template":"function(valueMap) { \nreturn 'Total: ' + valueMap.sum.toFixed(0);\n }"},"Other_Sales":{"template":"function(valueMap) { \nreturn 'Total: ' + valueMap.sum.toFixed(0);\n }"}},"position":"bottom","height":40}},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.summary.columnContent.NA_Sales.template","options.summary.columnContent.EU_Sales.template","options.summary.columnContent.JP_Sales.template","options.summary.columnContent.Other_Sales.template"],"jsHooks":[]}
```
