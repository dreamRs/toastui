# Calendar Month Options

Options for monthly view.

## Usage

``` r
cal_month_options(
  cal,
  startDayOfWeek = NULL,
  daynames = NULL,
  narrowWeekend = NULL,
  visibleWeeksCount = NULL,
  isAlways6Week = NULL,
  workweek = NULL,
  visibleEventCount = NULL,
  ...
)
```

## Arguments

- cal:

  A
  [`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md)
  object.

- startDayOfWeek:

  Numeric. The start day of week.

- daynames:

  Vector. The day names in monthly. Default values are 'Sun', 'Mon',
  'Tue', 'Wed', 'Thu', 'Fri', 'Sat'

- narrowWeekend:

  Logical. Make weekend column narrow(1/2 width).

- visibleWeeksCount:

  Numeric. The visible week count in monthly(0 or null are same with 6).

- isAlways6Week:

  Logical. Always show 6 weeks. If false, show 5 weeks or 6 weeks based
  on the month.

- workweek:

  Logical. Show only 5 days except for weekend.

- visibleEventCount:

  Numeric. The visible schedule count in monthly grid.

- ...:

  Additional options.

## Value

A `calendar` htmlwidget.

## Note

Online JavaScript documentation:
<https://github.com/nhn/tui.calendar/blob/main/docs/en/apis/options.md#month>

## Examples

``` r
# Change option for monthly view
calendar(view = "month") %>%
  cal_month_options(
    startDayOfWeek = 1,
    daynames = c("Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"),
    narrowWeekend = TRUE
  )

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false,"month":{"startDayOfWeek":1,"dayNames":["Dim","Lun","Mar","Mer","Jeu","Ven","Sam"],"narrowWeekend":true}},"schedules":[],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
```
