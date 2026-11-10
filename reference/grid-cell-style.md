# Set grid cell(s) style

Customize cell(s) appearance with CSS according to an expression in the
data used in the grid.

## Usage

``` r
grid_style_cell(
  grid,
  expr,
  column,
  background = NULL,
  color = NULL,
  fontWeight = NULL,
  ...,
  class = NULL,
  cssProperties = NULL
)

grid_style_cells(
  grid,
  fun,
  columns,
  background = NULL,
  color = NULL,
  ...,
  class = NULL,
  cssProperties = NULL
)
```

## Arguments

- grid:

  A grid created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- expr:

  An expression giving position of row. Must return a logical vector.

- column:

  Name of column (variable name) where to apply style.

- background:

  Background color.

- color:

  Text color.

- fontWeight:

  Font weight, you can use `"bold"` for example.

- ...:

  Other CSS properties.

- class:

  CSS class to apply to the row.

- cssProperties:

  Alternative to specify CSS properties with a named list.

- fun:

  Function to apply to `columns` to identify rows to style.

- columns:

  Columns names to use with `fun`.

## Value

A `datagrid` htmlwidget.

## Examples

``` r
library(toastui)

datagrid(mtcars) %>%
  grid_style_cell(
    mpg > 19,
    column = "mpg",
    background = "#F781BE",
    fontWeight = "bold"
  )

  

{"x":{"nrow":32,"ncol":11,"data":[[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.09999999999999,120.1,318,304,350,400,79,120.3,95.09999999999999,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]],"colnames":["mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"],"options":{"columns":[{"header":"mpg","name":"mpg","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"cyl","name":"cyl","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"wt","name":"wt","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"qsec","name":"qsec","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"vs","name":"vs","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"am","name":"am","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"gear","name":"gear","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"carb","name":"carb","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false,"cellClass":[{"rowKey":[0,1,2,3,7,8,9,17,18,19,20,24,25,26,27,29,31],"class":"datagrid-cell-b9f1da54c15704fa337d6283","column":"mpg","styles":".datagrid-cell-b9f1da54c15704fa337d6283{background:#F781BE !important; font-weight:bold !important;}"}]},"evals":[],"jsHooks":[]}

datagrid(mtcars) %>%
  grid_style_cell(
    vs == 0,
    column = "vs",
    background = "#E41A1C80",
    color = "#FFF"
  ) %>%
  grid_style_cell(
    vs == 1,
    column = "vs",
    background = "#377EB880"
  )

  

{"x":{"nrow":32,"ncol":11,"data":[[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.09999999999999,120.1,318,304,350,400,79,120.3,95.09999999999999,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]],"colnames":["mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"],"options":{"columns":[{"header":"mpg","name":"mpg","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"cyl","name":"cyl","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"wt","name":"wt","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"qsec","name":"qsec","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"vs","name":"vs","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"am","name":"am","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"gear","name":"gear","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"carb","name":"carb","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false,"cellClass":[{"rowKey":[0,1,4,6,11,12,13,14,15,16,21,22,23,24,26,28,29,30],"class":"datagrid-cell-609620b47e55b9fc56126716","column":"vs","styles":".datagrid-cell-609620b47e55b9fc56126716{background:#E41A1C80 !important; color:#FFF !important;}"},{"rowKey":[2,3,5,7,8,9,10,17,18,19,20,25,27,31],"class":"datagrid-cell-7c2190b02849ba1cdf624a0d","column":"vs","styles":".datagrid-cell-7c2190b02849ba1cdf624a0d{background:#377EB880 !important;}"}]},"evals":[],"jsHooks":[]}

# Use rlang to use character
library(rlang)
my_var <- "disp"
datagrid(mtcars) %>%
  grid_style_cell(
    !!sym(my_var) > 180,
    column = "disp",
    background = "#F781BE"
  )

  

{"x":{"nrow":32,"ncol":11,"data":[[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.09999999999999,120.1,318,304,350,400,79,120.3,95.09999999999999,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]],"colnames":["mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"],"options":{"columns":[{"header":"mpg","name":"mpg","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"cyl","name":"cyl","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"wt","name":"wt","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"qsec","name":"qsec","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"vs","name":"vs","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"am","name":"am","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"gear","name":"gear","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"carb","name":"carb","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false,"cellClass":[{"rowKey":[3,4,5,6,11,12,13,14,15,16,21,22,23,24,28,30],"class":"datagrid-cell-499317c7e49c4cbc563f2a20","column":"disp","styles":".datagrid-cell-499317c7e49c4cbc563f2a20{background:#F781BE !important;}"}]},"evals":[],"jsHooks":[]}



# Style multiple columns

cor_longley <- as.data.frame(cor(longley))
cor_longley$Var <- row.names(cor_longley)
vars <- c("GNP.deflator", "GNP",
          "Unemployed", "Armed.Forces",
          "Population", "Year", "Employed")
datagrid(cor_longley[, c("Var", vars)]) %>%
  grid_style_cells(
    fun = ~ . > 0.9,
    columns = vars,
    background = "#053061",
    color = "#FFF"
  ) %>%
  grid_style_cells(
    fun = ~ . > 0 & . <= 0.9,
    columns = vars,
    background = "#539dc8",
    color = "#FFF"
  ) %>%
  grid_style_cells(
    fun = ~ . < 0,
    columns = vars,
    background = "#b51f2e",
    color = "#FFF"
  )

  

{"x":{"nrow":7,"ncol":8,"data":[["GNP.deflator","GNP","Unemployed","Armed.Forces","Population","Year","Employed"],[1,0.991589178024782,0.6206333925590967,0.4647441876006747,0.9791634329774981,0.9911491900672053,0.9708985250610559],[0.991589178024782,1,0.6042609398895579,0.4464367918926265,0.9910900694584774,0.9952734837647847,0.9835516111796694],[0.6206333925590967,0.6042609398895579,1,-0.1774206295018783,0.6865515163653122,0.6682566045621746,0.5024980838759942],[0.4647441876006747,0.4464367918926265,-0.1774206295018783,1,0.3644162671890318,0.4172451498349455,0.4573073999764822],[0.9791634329774981,0.9910900694584774,0.6865515163653122,0.3644162671890318,1,0.9939528462329256,0.9603905715943756],[0.9911491900672053,0.9952734837647847,0.6682566045621746,0.4172451498349455,0.9939528462329256,1,0.9713294591921188],[0.9708985250610559,0.9835516111796694,0.5024980838759942,0.4573073999764822,0.9603905715943756,0.9713294591921188,1]],"colnames":["Var","GNP.deflator","GNP","Unemployed","Armed.Forces","Population","Year","Employed"],"options":{"columns":[{"header":"Var","name":"Var","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"GNP.deflator","name":"GNP.deflator","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"GNP","name":"GNP","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Unemployed","name":"Unemployed","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Armed.Forces","name":"Armed.Forces","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Population","name":"Population","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Year","name":"Year","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Employed","name":"Employed","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false,"cellsClass":[{"rowKey":[0,1,4,5,6],"class":"datagrid-cells-118d1ddd284712511a934432","column":"GNP.deflator","styles":".datagrid-cells-118d1ddd284712511a934432{background:#053061 !important; color:#FFF !important;}"},{"rowKey":[0,1,4,5,6],"class":"datagrid-cells-118d1ddd284712511a934432","column":"GNP","styles":".datagrid-cells-118d1ddd284712511a934432{background:#053061 !important; color:#FFF !important;}"},{"rowKey":[2],"class":"datagrid-cells-118d1ddd284712511a934432","column":"Unemployed","styles":".datagrid-cells-118d1ddd284712511a934432{background:#053061 !important; color:#FFF !important;}"},{"rowKey":[3],"class":"datagrid-cells-118d1ddd284712511a934432","column":"Armed.Forces","styles":".datagrid-cells-118d1ddd284712511a934432{background:#053061 !important; color:#FFF !important;}"},{"rowKey":[0,1,4,5,6],"class":"datagrid-cells-118d1ddd284712511a934432","column":"Population","styles":".datagrid-cells-118d1ddd284712511a934432{background:#053061 !important; color:#FFF !important;}"},{"rowKey":[0,1,4,5,6],"class":"datagrid-cells-118d1ddd284712511a934432","column":"Year","styles":".datagrid-cells-118d1ddd284712511a934432{background:#053061 !important; color:#FFF !important;}"},{"rowKey":[0,1,4,5,6],"class":"datagrid-cells-118d1ddd284712511a934432","column":"Employed","styles":".datagrid-cells-118d1ddd284712511a934432{background:#053061 !important; color:#FFF !important;}"},{"rowKey":[2,3],"class":"datagrid-cells-a0806e52d8b362704077f3d5","column":"GNP.deflator","styles":".datagrid-cells-a0806e52d8b362704077f3d5{background:#539dc8 !important; color:#FFF !important;}"},{"rowKey":[2,3],"class":"datagrid-cells-a0806e52d8b362704077f3d5","column":"GNP","styles":".datagrid-cells-a0806e52d8b362704077f3d5{background:#539dc8 !important; color:#FFF !important;}"},{"rowKey":[0,1,4,5,6],"class":"datagrid-cells-a0806e52d8b362704077f3d5","column":"Unemployed","styles":".datagrid-cells-a0806e52d8b362704077f3d5{background:#539dc8 !important; color:#FFF !important;}"},{"rowKey":[0,1,4,5,6],"class":"datagrid-cells-a0806e52d8b362704077f3d5","column":"Armed.Forces","styles":".datagrid-cells-a0806e52d8b362704077f3d5{background:#539dc8 !important; color:#FFF !important;}"},{"rowKey":[2,3],"class":"datagrid-cells-a0806e52d8b362704077f3d5","column":"Population","styles":".datagrid-cells-a0806e52d8b362704077f3d5{background:#539dc8 !important; color:#FFF !important;}"},{"rowKey":[2,3],"class":"datagrid-cells-a0806e52d8b362704077f3d5","column":"Year","styles":".datagrid-cells-a0806e52d8b362704077f3d5{background:#539dc8 !important; color:#FFF !important;}"},{"rowKey":[2,3],"class":"datagrid-cells-a0806e52d8b362704077f3d5","column":"Employed","styles":".datagrid-cells-a0806e52d8b362704077f3d5{background:#539dc8 !important; color:#FFF !important;}"},{"rowKey":[3],"class":"datagrid-cells-8cad79c120fbc6dff3362be2","column":"Unemployed","styles":".datagrid-cells-8cad79c120fbc6dff3362be2{background:#b51f2e !important; color:#FFF !important;}"},{"rowKey":[2],"class":"datagrid-cells-8cad79c120fbc6dff3362be2","column":"Armed.Forces","styles":".datagrid-cells-8cad79c120fbc6dff3362be2{background:#b51f2e !important; color:#FFF !important;}"}]},"evals":[],"jsHooks":[]}
```
