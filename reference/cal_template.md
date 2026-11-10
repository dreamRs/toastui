# Set template for a calendar

Template JS functions to support customer renderer

## Usage

``` r
cal_template(
  cal,
  milestoneTitle = NULL,
  taskTitle = NULL,
  alldayTitle = NULL,
  ...
)
```

## Arguments

- cal:

  A
  [`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md)
  object.

- milestoneTitle:

  The milestone title (at left column) template function.

- taskTitle:

  The task title (at left column) template function.

- alldayTitle:

  The allday title (at left column) template function.

- ...:

  Additionals arguments, see online documentation.

## Value

A `calendar` htmlwidget object.

## Note

Online JavaScript documentation:
<https://github.com/nhn/tui.calendar/blob/main/docs/en/apis/template.md>.
All arguments must be JavaScript function with
[`htmlwidgets::JS()`](https://rdrr.io/pkg/htmlwidgets/man/JS.html).

## Examples

``` r
calendar(view = "week", taskView = TRUE) %>%
  cal_template(
    milestoneTitle = "TODO",
    taskTitle = "Assignment",
    alldayTitle = "Full-time"
  )

  
    
      Today
      
        
      
      
        
      
    
    
  
  


{"x":{"options":{"defaultView":"week","useDetailPopup":true,"useFormPopup":false,"isReadOnly":true,"taskView":true,"usageStatistics":false,"template":{"milestoneTitle":"function() {return  '<span class=\"tui-full-calendar-left-content\">TODO<\/span>';}","taskTitle":"function() {return  '<span class=\"tui-full-calendar-left-content\">Assignment<\/span>';}","alldayTitle":"function() {return  '<span class=\"tui-full-calendar-left-content\">Full-time<\/span>';}"}},"schedules":[],"navigation":false,"events":[],"navigationOptions":{"today_label":"Today","prev_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M164.24,203.76a6,6,0,1,1-8.48,8.48l-80-80a6,6,0,0,1,0-8.48l80-80a6,6,0,0,1,8.48,8.48L88.49,128Z\"><\/path>\n  <title>caret-left-light<\/title>\n<\/svg>","next_label":"<svg xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 256 256\" class=\"phosphor-svg\" height=\"1.33em\" fill=\"currentColor\" style=\"vertical-align:-0.25em;\">\n  <path d=\"M180.24,132.24l-80,80a6,6,0,0,1-8.48-8.48L167.51,128,91.76,52.24a6,6,0,0,1,8.48-8.48l80,80A6,6,0,0,1,180.24,132.24Z\"><\/path>\n  <title>caret-right-light<\/title>\n<\/svg>","class":" bttn-bordered bttn-sm bttn-primary","fmt_date":"YYYY-MM-DD","sep_date":" ~ "}},"evals":["options.template.milestoneTitle","options.template.taskTitle","options.template.alldayTitle"],"jsHooks":[]}
```
