# Merge rows

Merge rows

## Usage

``` r
grid_row_merge(grid, columns)
```

## Arguments

- grid:

  A grid created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- columns:

  column(s) in which merge consecutive rows.

## Value

A `datagrid` htmlwidget.

## Examples

``` r
library(toastui)

datagrid(mtcars[order(mtcars$cyl), 1:5]) %>%
  grid_row_merge(columns = "cyl")

  

{"x":{"nrow":32,"ncol":5,"data":[[22.8,24.4,22.8,32.4,30.4,33.9,21.5,27.3,26,30.4,21.4,21,21,21.4,18.1,19.2,17.8,19.7,18.7,14.3,16.4,17.3,15.2,10.4,10.4,14.7,15.5,15.2,13.3,19.2,15.8,15],[4,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6,6,6,8,8,8,8,8,8,8,8,8,8,8,8,8,8],[108,146.7,140.8,78.7,75.7,71.09999999999999,120.1,79,120.3,95.09999999999999,121,160,160,258,225,167.6,167.6,145,360,360,275.8,275.8,275.8,472,460,440,318,304,350,400,351,301],[93,62,95,66,52,65,97,66,91,113,109,110,110,110,105,123,123,175,175,245,180,180,180,205,215,230,150,150,245,175,264,335],[3.85,3.69,3.92,4.08,4.93,4.22,3.7,4.08,4.43,3.77,4.11,3.9,3.9,3.08,2.76,3.92,3.92,3.62,3.15,3.21,3.07,3.07,3.07,2.93,3,3.23,2.76,3.15,3.73,3.08,4.22,3.54]],"colnames":["mpg","cyl","disp","hp","drat"],"options":{"columns":[{"header":"mpg","name":"mpg","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"cyl","name":"cyl","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[{"rowSpan":{"cyl":11}},[],[],[],[],[],[],[],[],[],[],{"rowSpan":{"cyl":7}},[],[],[],[],[],[],{"rowSpan":{"cyl":14}},[],[],[],[],[],[],[],[],[],[],[],[],[]],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}
datagrid(mtcars[, 1:8]) %>%
  grid_row_merge(columns = "cyl") %>%
  grid_row_merge(columns = "vs")

  

{"x":{"nrow":32,"ncol":8,"data":[[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.09999999999999,120.1,318,304,350,400,79,120.3,95.09999999999999,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1]],"colnames":["mpg","cyl","disp","hp","drat","wt","qsec","vs"],"options":{"columns":[{"header":"mpg","name":"mpg","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"cyl","name":"cyl","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"wt","name":"wt","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"qsec","name":"qsec","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"vs","name":"vs","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[{"rowSpan":{"cyl":2,"vs":2}},[],{"rowSpan":{"vs":2}},[],[],[],[],{"rowSpan":{"cyl":2,"vs":4}},[],{"rowSpan":{"cyl":2}},[],{"rowSpan":{"cyl":6,"vs":6}},[],[],[],[],[],{"rowSpan":{"cyl":4,"vs":4}},[],[],[],{"rowSpan":{"cyl":4,"vs":4}},[],[],[],{"rowSpan":{"cyl":3}},[],[],{"rowSpan":{"vs":3}},[],[],[]],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}

```
