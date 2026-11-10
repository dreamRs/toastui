# Add schedules to calendar

Add schedules to calendar

## Usage

``` r
cal_schedules(cal, ...)
```

## Arguments

- cal:

  A `calendar` htmlwidget.

- ...:

  Either named arguments to use as schedule properties or a `data.frame`
  with rows as schedules and columns as properties. See
  <https://nhn.github.io/tui.calendar/latest/EventObject/> for options.

## Value

A `calendar` htmlwidget.

## Examples

``` r
# Add schedule data from a data.frame
ex_data <- cal_demo_data()
calendar() %>%
  cal_schedules(ex_data)

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false},"schedules":[{"category":"time","dueDateClass":"","id":"schedule0f56fb8e6a1fd3da403bf818","calendarId":"1","title":"Sport","body":"Go to sport every week","recurrenceRule":"Every week","start":"2026-11-05 20:00:00","end":"2026-11-05 22:00:00","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"time","dueDateClass":"","id":"schedule7c892ade73756e3bf13eb93e","calendarId":"1","title":"Sport","body":"Go to sport every week","recurrenceRule":"Every week","start":"2026-11-12 20:00:00","end":"2026-11-12 22:00:00","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"time","dueDateClass":"","id":"schedulebd21f92931a41253ddcd61f4","calendarId":"1","title":"Sport","body":"Go to sport every week","recurrenceRule":"Every week","start":"2026-11-19 20:00:00","end":"2026-11-19 22:00:00","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"schedule64853270d7a7ddd5c78dff42","calendarId":"1","title":"Week-end","body":"Week-end with friends","recurrenceRule":null,"start":"2026-11-14","end":"2026-11-15","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"schedule11ee8e5b9f7bea17a6593447","calendarId":"2","title":"Project 1","body":"Coding cool stuff","recurrenceRule":null,"start":"2026-11-02","end":"2026-11-03","location":null,"backgroundColor":"#5E81AC","color":"white","borderColor":"#5E81AC"},{"category":"allday","dueDateClass":"","id":"schedule19eea48f3263a01c18eca156","calendarId":"2","title":"Project 2","body":"Coding cool stuff","recurrenceRule":null,"start":"2026-11-03","end":"2026-11-06","location":null,"backgroundColor":"#5E81AC","color":"white","borderColor":"#5E81AC"},{"category":"allday","dueDateClass":"","id":"schedulecc321e99f782903e20e82fe9","calendarId":"2","title":"Project 3","body":"Coding cool stuff","recurrenceRule":null,"start":"2026-11-29","end":"2026-11-29","location":null,"backgroundColor":"#5E81AC","color":"white","borderColor":"#5E81AC"},{"category":"allday","dueDateClass":"","id":"schedulee96ad491e95a97e1d3447d8b","calendarId":"3","title":"Training 1","body":"Learn programming","recurrenceRule":null,"start":"2026-11-10","end":"2026-11-13","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"scheduleab16ec33930352bd7ed49514","calendarId":"3","title":"Training 2","body":"Learn programming","recurrenceRule":null,"start":"2026-11-17","end":"2026-11-19","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"time","dueDateClass":"","id":"scheduleef52fbad8d1b5398fd94457e","calendarId":"2","title":"Meeting","body":"Meeting with John Smith","recurrenceRule":null,"start":"2026-11-20 14:00:00","end":"2026-11-20 17:00:00","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"time","dueDateClass":"","id":"schedule0686f905840b078a1f8f4a61","calendarId":"2","title":"Lunch","body":"Lunch with Jane Doe","recurrenceRule":null,"start":"2026-11-24 12:00:00","end":"2026-11-24 14:00:00","location":"Some restaurant","backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"schedulec98a07d1d575d0c44ec49b8b","calendarId":"3","title":"Conference","body":"Cool R conference","recurrenceRule":null,"start":"2026-11-27","end":"2026-11-28","location":"Conference center","backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"schedulee5d81cae1bd0606873ff51f7","calendarId":"4","title":"Mum birthday","body":"Dont forget!!!","recurrenceRule":null,"start":"2026-11-03","end":"2026-11-03","location":null,"backgroundColor":"#FAFAFA","color":"#FF0000","borderColor":"#FF0000"}],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
# Or add item by item
calendar() %>%
  cal_schedules(
    title = "R - introduction",
    body = "What is R?",
    start = format(Sys.Date(), "%Y-%m-03 08:00:00"),
    end = format(Sys.Date(), "%Y-%m-03 12:00:00"),
    category = "time"
  ) %>%
  cal_schedules(
    title = "R - visualisation",
    body = "With ggplot2",
    start = format(Sys.Date(), "%Y-%m-05 08:00:00"),
    end = format(Sys.Date(), "%Y-%m-05 12:00:00"),
    category = "time"
  ) %>%
  cal_schedules(
    title = "Build first package",
    body = "Build first package",
    start = format(Sys.Date(), "%Y-%m-12"),
    end = format(Sys.Date(), "%Y-%m-18"),
    category = "allday"
  ) %>%
  cal_schedules(
    title = "Lunch",
    body = "With friends",
    start = format(Sys.Date(), "%Y-%m-15 12:00:00"),
    end = format(Sys.Date(), "%Y-%m-15 14:00:00"),
    category = "time"
  )

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false},"schedules":[{"category":"time","dueDateClass":"","id":"schedule2fd67ddf96bf8a1986c594a9","calendarId":"1","title":"R - introduction","body":"What is R?","start":"2026-11-03 08:00:00","end":"2026-11-03 12:00:00"},{"category":"time","dueDateClass":"","id":"schedule2835ed3cd7bd7ea2cb09ff49","calendarId":"1","title":"R - visualisation","body":"With ggplot2","start":"2026-11-05 08:00:00","end":"2026-11-05 12:00:00"},{"category":"allday","dueDateClass":"","id":"schedule3b1a21a946b6332b8c1b6f76","calendarId":"1","title":"Build first package","body":"Build first package","start":"2026-11-12","end":"2026-11-18"},{"category":"time","dueDateClass":"","id":"scheduled9c1c8298b052c39e1c1e820","calendarId":"1","title":"Lunch","body":"With friends","start":"2026-11-15 12:00:00","end":"2026-11-15 14:00:00"}],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
```
