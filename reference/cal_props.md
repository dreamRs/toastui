# Calendar properties

Define calendar properties for grouping schedules under common theme.

## Usage

``` r
cal_props(cal, ...)
```

## Arguments

- cal:

  A
  [`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md)
  object.

- ...:

  Either named arguments to use as calendar properties or a `data.frame`
  with rows as calendars and columns as properties. See
  <https://nhn.github.io/tui.calendar/latest/CalendarInfo/> for options.

## Value

A `calendar` htmlwidget.

## Examples

``` r
library(toastui)

# Define theme for schedules
calendar(cal_demo_data()[, -c(9, 10, 11)]) %>%
  cal_props(
    list(
      id = "1",
      name = "PERSO",
      color = "lightblue",
      backgroundColor = "purple",
      borderColor = "magenta"
    ),
    list(
      id = "2",
      name = "WORK",
      color = "red",
      backgroundColor = "yellow",
      borderColor = "orange"
    )
  )

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false,"calendars":[{"id":"1","name":"PERSO","color":"lightblue","backgroundColor":"purple","borderColor":"magenta"},{"id":"2","name":"WORK","color":"red","backgroundColor":"yellow","borderColor":"orange"}]},"schedules":[{"category":"time","dueDateClass":"","id":"schedule0d04e672cbf064100ce560a0","calendarId":"1","title":"Sport","body":"Go to sport every week","recurrenceRule":"Every week","start":"2026-11-05 20:00:00","end":"2026-11-05 22:00:00","location":null},{"category":"time","dueDateClass":"","id":"schedule4cd11fc4360aa0230696d721","calendarId":"1","title":"Sport","body":"Go to sport every week","recurrenceRule":"Every week","start":"2026-11-12 20:00:00","end":"2026-11-12 22:00:00","location":null},{"category":"time","dueDateClass":"","id":"schedulec7483268bafca56cec1834a2","calendarId":"1","title":"Sport","body":"Go to sport every week","recurrenceRule":"Every week","start":"2026-11-19 20:00:00","end":"2026-11-19 22:00:00","location":null},{"category":"allday","dueDateClass":"","id":"schedule2cd196f3aa03a128515d92cb","calendarId":"1","title":"Week-end","body":"Week-end with friends","recurrenceRule":null,"start":"2026-11-14","end":"2026-11-15","location":null},{"category":"allday","dueDateClass":"","id":"schedule327f90c9eb0caf26d4e3c002","calendarId":"2","title":"Project 1","body":"Coding cool stuff","recurrenceRule":null,"start":"2026-11-02","end":"2026-11-03","location":null},{"category":"allday","dueDateClass":"","id":"schedule06b0c5da0b268a2927f570eb","calendarId":"2","title":"Project 2","body":"Coding cool stuff","recurrenceRule":null,"start":"2026-11-03","end":"2026-11-06","location":null},{"category":"allday","dueDateClass":"","id":"schedulef30ed12bb554391c49c2e3ec","calendarId":"2","title":"Project 3","body":"Coding cool stuff","recurrenceRule":null,"start":"2026-11-29","end":"2026-11-29","location":null},{"category":"allday","dueDateClass":"","id":"schedule658d41f8c4f2d124e96b8352","calendarId":"3","title":"Training 1","body":"Learn programming","recurrenceRule":null,"start":"2026-11-10","end":"2026-11-13","location":null},{"category":"allday","dueDateClass":"","id":"schedule3733b890d61edcb3f7c917b6","calendarId":"3","title":"Training 2","body":"Learn programming","recurrenceRule":null,"start":"2026-11-17","end":"2026-11-19","location":null},{"category":"time","dueDateClass":"","id":"schedulec8ff580948d258b2ee1c304e","calendarId":"2","title":"Meeting","body":"Meeting with John Smith","recurrenceRule":null,"start":"2026-11-20 14:00:00","end":"2026-11-20 17:00:00","location":null},{"category":"time","dueDateClass":"","id":"schedulebe1664b8f31ebacaee3527bb","calendarId":"2","title":"Lunch","body":"Lunch with Jane Doe","recurrenceRule":null,"start":"2026-11-24 12:00:00","end":"2026-11-24 14:00:00","location":"Some restaurant"},{"category":"allday","dueDateClass":"","id":"schedule86b25b670b028f478bf74146","calendarId":"3","title":"Conference","body":"Cool R conference","recurrenceRule":null,"start":"2026-11-27","end":"2026-11-28","location":"Conference center"},{"category":"allday","dueDateClass":"","id":"scheduled1193f7ba074d981c8382a20","calendarId":"4","title":"Mum birthday","body":"Dont forget!!!","recurrenceRule":null,"start":"2026-11-03","end":"2026-11-03","location":null}],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
```
