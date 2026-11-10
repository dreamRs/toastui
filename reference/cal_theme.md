# Calendar theme options

Full configuration for theme. "common" prefix is for entire calendar.
"common" properties can be overridden by "week", "month". "week" prefix
is for weekly and daily view. "month" prefix is for monthly view.

## Usage

``` r
cal_theme(cal, ..., .list = NULL)
```

## Arguments

- cal:

  A
  [`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md)
  object.

- ...:

  Named arguments to customize appearance with CSS. See online
  documentation for full list of options.

- .list:

  Alternative to `...` for using a list.

## Value

A `calendar` htmlwidget object.

## Note

Online JavaScript documentation:
<https://github.com/nhn/tui.calendar/blob/main/docs/en/apis/theme.md>

## Examples

``` r
calendar(view = "month") %>%
  cal_theme(
    common.border = "2px solid #E5E9F0",
    month.dayname.borderLeft = "2px solid #E5E9F0",
    common.backgroundColor = "#2E3440",
    common.holiday.color = "#88C0D0",
    common.saturday.color = "#88C0D0",
    common.dayname.color = "#ECEFF4",
    common.today.color = "#333"
  )

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false,"theme":{"common.border":"2px solid #E5E9F0","month.dayname.borderLeft":"2px solid #E5E9F0","common.backgroundColor":"#2E3440","common.holiday.color":"#88C0D0","common.saturday.color":"#88C0D0","common.dayname.color":"#ECEFF4","common.today.color":"#333"}},"schedules":[],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
```
