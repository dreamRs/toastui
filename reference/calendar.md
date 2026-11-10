# Create an interactive calendar

Build interactive calendar with the JavaScript tui-calendar library.

## Usage

``` r
calendar(
  data = NULL,
  view = c("month", "week", "day"),
  defaultDate = NULL,
  useDetailPopup = TRUE,
  useCreationPopup = FALSE,
  isReadOnly = TRUE,
  navigation = FALSE,
  navOpts = navigation_options(),
  ...,
  width = NULL,
  height = NULL,
  elementId = NULL
)
```

## Arguments

- data:

  A `data.frame` with schedules data, see
  [`cal_demo_data()`](https://dreamrs.github.io/toastui/reference/cal-demo-data.md).

- view:

  Default view of calendar. The default value is 'week', other possible
  values are 'month' and 'day'.

- defaultDate:

  Default date for displaying calendar.

- useDetailPopup:

  Logical. Display a pop-up on click with detailed informations about
  schedules.

- useCreationPopup:

  Logical. Allow user to create schedules with a pop-up.

- isReadOnly:

  Calendar is read-only mode and a user can't create and modify any
  schedule. The default value is true.

- navigation:

  Add navigation buttons to got to previous or next period, or return to
  'today'.

- navOpts:

  Options to customize buttons (only if `navigation = TRUE`), see
  [`navigation_options()`](https://dreamrs.github.io/toastui/reference/navigation_options.md).

- ...:

  Additional arguments passed to JavaScript method.

- width, height:

  A numeric input in pixels.

- elementId:

  Use an explicit element ID for the widget.

## Value

A `calendar` htmlwidget.

## Note

`taskView` and `scheduleView` arguments have been moved to
[`cal_week_options()`](https://dreamrs.github.io/toastui/reference/cal_week_options.md).

## See also

[`calendarOutput()`](https://dreamrs.github.io/toastui/reference/calendar-shiny.md)
/
[`renderCalendar()`](https://dreamrs.github.io/toastui/reference/calendar-shiny.md)
for usage in Shiny applications.

## Examples

``` r

# Default: monthly view
calendar()

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false},"schedules":[],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
# Weekly view
calendar(view = "week")

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"week","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false},"schedules":[],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
# Or only day:
calendar(view = "day")

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"day","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false},"schedules":[],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
# Add navigation buttons
calendar(navigation = TRUE)

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false},"schedules":[],"navigation":true,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
# Add schedules data
ex_data <- cal_demo_data()
calendar(ex_data)

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false},"schedules":[{"category":"time","dueDateClass":"","id":"schedule8cedfbfb644765ba3c8093a9","calendarId":"1","title":"Sport","body":"Go to sport every week","recurrenceRule":"Every week","start":"2026-11-05 20:00:00","end":"2026-11-05 22:00:00","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"time","dueDateClass":"","id":"schedulea251260de9a9ce2114057ea9","calendarId":"1","title":"Sport","body":"Go to sport every week","recurrenceRule":"Every week","start":"2026-11-12 20:00:00","end":"2026-11-12 22:00:00","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"time","dueDateClass":"","id":"schedule3cc625e22362e523c92f06ca","calendarId":"1","title":"Sport","body":"Go to sport every week","recurrenceRule":"Every week","start":"2026-11-19 20:00:00","end":"2026-11-19 22:00:00","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"scheduleefcc5888d03aab6db1f2097c","calendarId":"1","title":"Week-end","body":"Week-end with friends","recurrenceRule":null,"start":"2026-11-14","end":"2026-11-15","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"schedule6cb00d8c6a89049fe48a6f46","calendarId":"2","title":"Project 1","body":"Coding cool stuff","recurrenceRule":null,"start":"2026-11-02","end":"2026-11-03","location":null,"backgroundColor":"#5E81AC","color":"white","borderColor":"#5E81AC"},{"category":"allday","dueDateClass":"","id":"schedule36372fc43afd45712bce1b44","calendarId":"2","title":"Project 2","body":"Coding cool stuff","recurrenceRule":null,"start":"2026-11-03","end":"2026-11-06","location":null,"backgroundColor":"#5E81AC","color":"white","borderColor":"#5E81AC"},{"category":"allday","dueDateClass":"","id":"schedule040c40d47b4899030a1fedd5","calendarId":"2","title":"Project 3","body":"Coding cool stuff","recurrenceRule":null,"start":"2026-11-29","end":"2026-11-29","location":null,"backgroundColor":"#5E81AC","color":"white","borderColor":"#5E81AC"},{"category":"allday","dueDateClass":"","id":"schedule59a25e5ff2a05fe724581312","calendarId":"3","title":"Training 1","body":"Learn programming","recurrenceRule":null,"start":"2026-11-10","end":"2026-11-13","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"schedulec8e9f8c0374f958905070244","calendarId":"3","title":"Training 2","body":"Learn programming","recurrenceRule":null,"start":"2026-11-17","end":"2026-11-19","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"time","dueDateClass":"","id":"scheduleaf18d59c19102d4833d58590","calendarId":"2","title":"Meeting","body":"Meeting with John Smith","recurrenceRule":null,"start":"2026-11-20 14:00:00","end":"2026-11-20 17:00:00","location":null,"backgroundColor":null,"color":null,"borderColor":null},{"category":"time","dueDateClass":"","id":"scheduleaa620ac048fab09dd921dc2c","calendarId":"2","title":"Lunch","body":"Lunch with Jane Doe","recurrenceRule":null,"start":"2026-11-24 12:00:00","end":"2026-11-24 14:00:00","location":"Some restaurant","backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"schedulec72939cff063e85a1f6c3c00","calendarId":"3","title":"Conference","body":"Cool R conference","recurrenceRule":null,"start":"2026-11-27","end":"2026-11-28","location":"Conference center","backgroundColor":null,"color":null,"borderColor":null},{"category":"allday","dueDateClass":"","id":"schedule2142b1d07728ac4d3684310b","calendarId":"4","title":"Mum birthday","body":"Dont forget!!!","recurrenceRule":null,"start":"2026-11-03","end":"2026-11-03","location":null,"backgroundColor":"#FAFAFA","color":"#FF0000","borderColor":"#FF0000"}],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}

# By default detail popup is activated
# you can click on a schedule to view detail
calendar(useDetailPopup = TRUE) %>%
  cal_schedules(
    title = "My schedule",
    body = "Some detail about it",
    start = format(Sys.Date(), "%Y-%m-03"),
    end = format(Sys.Date(), "%Y-%m-04"),
    category = "allday"
  )

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false},"schedules":[{"category":"allday","dueDateClass":"","id":"schedule36397c2b06099971fa23af59","calendarId":"1","title":"My schedule","body":"Some detail about it","start":"2026-11-03","end":"2026-11-04"}],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
# to disable it use useDetailPopup = FALSE

# You can use HTML tags inside it:
library(htmltools)
calendar(useDetailPopup = TRUE) %>%
  cal_schedules(
    title = "My schedule",
    body = doRenderTags(tags$div(
      tags$h3("Title for my schedule"),
      tags$p(
        "Yan can write", tags$em("custom"), tags$b("HTML"),
        "in a popup !"
      ),
      tags$p(
        style = "color: firebrick;",
        "For example write in red !"
      ),
      tags$ul(
        tags$li("Or make a bullet list!"),
        tags$li("With another item"),
        tags$li("And one more")
      )
    )),
    start = format(Sys.Date(), "%Y-%m-03"),
    end = format(Sys.Date(), "%Y-%m-04"),
    category = "allday"
  )

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"month","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"usageStatistics":false},"schedules":[{"category":"allday","dueDateClass":"","id":"schedulea1b7eae713875b181103845d","calendarId":"1","title":"My schedule","body":"<div>\n  <h3>Title for my schedule<\/h3>\n  <p>\n    Yan can write\n    <em>custom<\/em>\n    <b>HTML<\/b>\n    in a popup !\n  <\/p>\n  <p style=\"color: firebrick;\">For example write in red !<\/p>\n  <ul>\n    <li>Or make a bullet list!<\/li>\n    <li>With another item<\/li>\n    <li>And one more<\/li>\n  <\/ul>\n<\/div>","start":"2026-11-03","end":"2026-11-04"}],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":[],"jsHooks":[]}
```
