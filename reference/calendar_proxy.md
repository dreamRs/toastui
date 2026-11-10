# Proxy for calendar htmlwidget

Proxy for calendar htmlwidget

## Usage

``` r
calendar_proxy(shinyId, session = shiny::getDefaultReactiveDomain())
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

A `calendar_proxy` object.

## See also

Other calendar proxy methods:
[`cal_proxy_clear()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear.md),
[`cal_proxy_clear_selection()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear_selection.md),
[`cal_proxy_options()`](https://dreamrs.github.io/toastui/reference/cal_proxy_options.md),
[`cal_proxy_toggle()`](https://dreamrs.github.io/toastui/reference/cal_proxy_toggle.md),
[`cal_proxy_view()`](https://dreamrs.github.io/toastui/reference/cal_proxy_view.md),
[`calendar-proxy-navigate`](https://dreamrs.github.io/toastui/reference/calendar-proxy-navigate.md),
[`calendar-proxy-schedule`](https://dreamrs.github.io/toastui/reference/calendar-proxy-schedule.md)

## Examples

``` r
if (FALSE) { # \dontrun{

# Consider having created a calendar widget with
calendarOutput("my_calendar") # UI
output$my_calendar <- renderCalendar({}) # Server

# Then you can call proxy methods in observer:

# set calendar proxy then call a cal_proxy_* function
calendar_proxy("my_calendar") %>%
  cal_proxy_today()

# or directly
cal_proxy_today("my_calendar")

} # }
```
