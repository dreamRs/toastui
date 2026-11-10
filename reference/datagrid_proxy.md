# Proxy for datagrid htmlwidget

Proxy for datagrid htmlwidget

## Usage

``` r
datagrid_proxy(shinyId, session = shiny::getDefaultReactiveDomain())
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

A `datagrid_proxy` object.

## See also

Other datagrid proxy methods:
[`grid_proxy_add_row()`](https://dreamrs.github.io/toastui/reference/grid_proxy_add_row.md),
[`grid_proxy_delete_row()`](https://dreamrs.github.io/toastui/reference/grid_proxy_delete_row.md)

## Examples

``` r
if (FALSE) { # \dontrun{

# Consider having created a datagrid widget with
datagridOutput("my_grid") # UI
output$my_grid <- renderDatagrid({}) # Server

# Then you can call proxy methods in observer:

# set datagrid proxy then call a cal_proxy_* function
datagrid_proxy("my_grid") %>%
  datagrid_proxy_addrow(mydata)

# or directly
datagrid_proxy_addrow("my_grid", mydata)

} # }
```
