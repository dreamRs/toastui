# Calendar Timezone

Set a custom time zone. You can add secondary timezone in the
weekly/daily view.

## Usage

``` r
cal_timezone(
  cal,
  timezoneName = NULL,
  displayLabel = NULL,
  tooltip = NULL,
  extra_zones = NULL,
  offsetCalculator = NULL
)
```

## Arguments

- cal:

  A
  [`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md)
  object.

- timezoneName:

  timezone name (time zone names of the IANA time zone database, such as
  'Asia/Seoul', 'America/New_York'). Basically, it will calculate the
  offset using 'Intl.DateTimeFormat' with the value of the this property
  entered.

- displayLabel:

  The display label of your timezone at weekly/daily view(e.g.
  'GMT+09:00')

- tooltip:

  The tooltip(e.g. 'Seoul')

- extra_zones:

  A `list` with additional timezones to be shown in left timegrid of
  weekly/daily view.

- offsetCalculator:

  Javascript function. If you define the 'offsetCalculator' property,
  the offset calculation is done with this function.

## Value

A `calendar` htmlwidget.

## Note

Online JavaScript documentation:
<https://github.com/nhn/tui.calendar/blob/main/docs/en/apis/options.md#timezone>

## Examples

``` r
library(toastui)
calendar(view = "week", defaultDate = "2021-06-18") %>%
  cal_schedules(
    title = "My schedule",
    start = "2021-06-18T10:00:00",
    end = "2021-06-18T17:00:00",
    category = "time"
  ) %>%
  # Set primary timezone and add secondary timezone
  cal_timezone(
    timezoneName = "Europe/Paris",
    displayLabel = "GMT+02:00",
    tooltip = "Paris",
    extra_zones = list(
      list(
        timezoneName = "Asia/Seoul",
        displayLabel = "GMT+09:00",
        tooltip = "Seoul"
      )
    )
  )

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"week","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false,"timezone":{"zones":[{"timezoneName":"Europe/Paris","displayLabel":"GMT+02:00","tooltip":"Paris"},{"timezoneName":"Asia/Seoul","displayLabel":"GMT+09:00","tooltip":"Seoul"}]}},"schedules":[{"category":"time","dueDateClass":"","id":"schedule10409be038f1220f5e280bbc","calendarId":"1","title":"My schedule","start":"2021-06-18T10:00:00","end":"2021-06-18T17:00:00"}],"navigation":false,"defaultDate":"2021-06-18","events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
```
