# Calendar Week Options

Options for daily, weekly view.

## Usage

``` r
cal_week_options(
  cal,
  startDayOfWeek = NULL,
  daynames = NULL,
  narrowWeekend = NULL,
  workweek = NULL,
  showNowIndicator = NULL,
  showTimezoneCollapseButton = NULL,
  timezonesCollapsed = NULL,
  hourStart = NULL,
  hourEnd = NULL,
  eventView = TRUE,
  taskView = FALSE,
  collapseDuplicateEvents = NULL,
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

  Vector. The day names in weekly and daily. Default values are 'Sun',
  'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'.

- narrowWeekend:

  Logical. Make weekend column narrow(1/2 width).

- workweek:

  Logical. Show only 5 days except for weekend.

- showNowIndicator:

  Display or not the current time indicator in the weekly/daily view.

- showTimezoneCollapseButton:

  Logical. Show a collapse button to close multiple timezones

- timezonesCollapsed:

  Logical. An initial multiple timezones collapsed state.

- hourStart:

  Numeric. Can limit of render hour start.

- hourEnd:

  Numeric. Can limit of render hour end.

- eventView:

  Show the all day and time grid in weekly, daily view. The default
  value is `TRUE`. If the value is a vector, it can be `"allday"`,
  `"time"`.

- taskView:

  Show the milestone and task in weekly, daily view. The default value
  is `FALSE`. If the value is a vector, it can be `"milestone"`,
  `"task"`.

- collapseDuplicateEvents:

  Collapse duplicate events in the daily/weekly view.

- ...:

  Additional options.

## Value

A `calendar` htmlwidget.

## Note

Online JavaScript documentation:
<https://github.com/nhn/tui.calendar/blob/main/docs/en/apis/options.md#week>

## Examples

``` r
# Change option for weekly view
calendar(view = "week") %>%
  cal_week_options(
    startDayOfWeek = 1,
    daynames = c("Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"),
    narrowWeekend = TRUE
  )

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"week","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false,"week":{"startDayOfWeek":1,"dayNames":["Dim","Lun","Mar","Mer","Jeu","Ven","Sam"],"narrowWeekend":true,"eventView":true,"taskView":false}},"schedules":[],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
```
