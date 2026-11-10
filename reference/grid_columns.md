# Set columns options

Set options for one or several specific column.

## Usage

``` r
grid_columns(
  grid,
  columns,
  header = NULL,
  ellipsis = NULL,
  align = NULL,
  valign = NULL,
  className = NULL,
  width = NULL,
  minWidth = NULL,
  hidden = NULL,
  resizable = NULL,
  defaultValue = NULL,
  formatter = NULL,
  escapeHTML = NULL,
  ignored = NULL,
  sortable = NULL,
  sortingType = NULL,
  onBeforeChange = NULL,
  onAfterChange = NULL,
  whiteSpace = NULL,
  ...
)
```

## Arguments

- grid:

  A grid created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- columns:

  Name(s) of column in the data used in
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- header:

  The header of the column to be shown on the header.

- ellipsis:

  If set to true, ellipsis will be used for overflowing content.

- align:

  Horizontal alignment of the column content. Available values are
  'left', 'center', 'right'.

- valign:

  Vertical alignment of the column content. Available values are 'top',
  'middle', 'bottom'.

- className:

  The name of the class to be used for all cells of the column.

- width:

  The width of the column. The unit is pixel. If this value isn't set,
  the column's width is automatically resized.

- minWidth:

  The minimum width of the column. The unit is pixel.

- hidden:

  If set to true, the column will not be shown.

- resizable:

  If set to false, the width of the column will not be changed.

- defaultValue:

  The default value to be shown when the column doesn't have a value.

- formatter:

  The function that formats the value of the cell. The return value of
  the function will be shown as the value of the cell. If set to
  'listItemText', the value will be shown the text.

- escapeHTML:

  If set to true, the value of the cell will be encoded as HTML
  entities.

- ignored:

  If set to true, the value of the column will be ignored when setting
  up the list of modified rows.

- sortable:

  If set to true, sort button will be shown on the right side of the
  column header, which executes the sort action when clicked.

- sortingType:

  If set to 'desc', will execute descending sort initially when sort
  button is clicked. Default to 'asc'.

- onBeforeChange:

  The function that will be called before changing the value of the
  cell. If stop() method in event object is called, the changing will be
  canceled.

- onAfterChange:

  The function that will be called after changing the value of the cell.

- whiteSpace:

  If set to 'normal', the text line is broken by fitting to the column's
  width. If set to 'pre', spaces are preserved and the text is broken by
  new line characters. If set to 'pre-wrap', spaces are preserved, the
  text line is broken by fitting to the column's width and new line
  characters. If set to 'pre-line', spaces are merged, the text line is
  broken by fitting to the column's width and new line characters.

- ...:

  Additional parameters.

## Value

A `datagrid` htmlwidget.

## Note

Documentation come from <https://nhn.github.io/tui.grid/latest/Grid/>.

## Examples

``` r
library(toastui)

# New header label
datagrid(mtcars[, 1:5]) %>%
  grid_columns(columns = "mpg", header = "Miles/(US) gallon")

  

{"x":{"nrow":32,"ncol":5,"data":[[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.09999999999999,120.1,318,304,350,400,79,120.3,95.09999999999999,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11]],"colnames":["mpg","cyl","disp","hp","drat"],"options":{"columns":[{"header":"Miles/(US) gallon","name":"mpg","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"cyl","name":"cyl","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}
# Align content to right & resize
datagrid(mtcars[, 1:5]) %>%
  grid_columns(
    columns = "mpg",
    align = "left",
    resizable = TRUE
  ) %>%
  grid_columns(
    columns = "cyl",
    align = "left",
    resizable = TRUE
  )

  

{"x":{"nrow":32,"ncol":5,"data":[[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.09999999999999,120.1,318,304,350,400,79,120.3,95.09999999999999,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11]],"colnames":["mpg","cyl","disp","hp","drat"],"options":{"columns":[{"header":"mpg","name":"mpg","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"resizable":true},{"header":"cyl","name":"cyl","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"resizable":true},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}
# Hide a column
datagrid(mtcars[, 1:5]) %>%
  grid_columns(
    columns = "mpg",
    hidden = TRUE
  )

  

{"x":{"nrow":32,"ncol":5,"data":[[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.09999999999999,120.1,318,304,350,400,79,120.3,95.09999999999999,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11]],"colnames":["mpg","cyl","disp","hp","drat"],"options":{"columns":[{"header":"mpg","name":"mpg","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"hidden":true},{"header":"cyl","name":"cyl","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}

# Set options for 2 columns
datagrid(mtcars[, 1:5]) %>%
  grid_columns(
    columns = c("mpg", "cyl"),
    header = c("Miles/(US) gallon", "Number of cylinders")
  )

  

{"x":{"nrow":32,"ncol":5,"data":[[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.09999999999999,120.1,318,304,350,400,79,120.3,95.09999999999999,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11]],"colnames":["mpg","cyl","disp","hp","drat"],"options":{"columns":[{"header":"Miles/(US) gallon","name":"mpg","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Number of cylinders","name":"cyl","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}
```
