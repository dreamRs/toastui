# Grid editor for date/time columns

Allow to edit content of columns with a calendar and time picker, then
retrieve value server-side in shiny application with
`input$<outputId>_data`.

## Usage

``` r
grid_editor_date(
  grid,
  column,
  format = "yyyy-MM-dd",
  type = c("date", "month", "year"),
  timepicker = c("none", "tab", "normal"),
  weekStartDay = NULL,
  language = NULL
)
```

## Arguments

- grid:

  A table created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- column:

  Column for which to activate the date picker.

- format:

  Date format, default is `"yyyy-MM-dd"`.

- type:

  Type of selection: date, month or year.

- timepicker:

  Add a timepicker.

- weekStartDay:

  Start of the week : 'Sun' (default), 'Mon', ..., 'Sat'

- language:

  Either `"en"` or `"ko"` the builtin language, or `"custom"` to use
  texts defined in `datagrid(datepicker_locale = list(...))`, see
  example.

## Value

A `datagrid` htmlwidget.

## See also

[`grid_editor`](https://dreamrs.github.io/toastui/reference/grid-editor.md)
for normal inputs.

## Examples

``` r
library(toastui)

dat <- data.frame(
  date = Sys.Date() + 1:10,
  date_locale = format(Sys.Date() + 1:10, format = "%d/%m/%Y"),
  month = format(Sys.Date() + 1:10, format = "%Y-%m"),
  year = format(Sys.Date() + 1:10, format = "%Y"),
  time1 = Sys.time() + 1:10,
  time2 = Sys.time() + 1:10
)


datagrid(
  data = dat,
  datepicker_locale = list(
    titles = list(
      DD = c(
        "Dimanche", "Lundi", "Mardi",
        "Mercredi", "Jeudi", "Vendredi", "Samedi"
      ),
      D = c("Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"),
      MMMM = c(
        "Janvier", "F\u00e9vrier", "Mars",
        "Avril", "Mai", "Juin", "Juillet",
        "Ao\u00fbt", "Septembre", "Octobre",
        "Novembre", "D\u00e9cembre"
      ),
      MMM = c(
        "Jan", "F\u00e9v", "Mar", "Avr",
        "Mai", "Juin", "Juil", "Aou",
        "Sept", "Oct", "Nov", "D\u00e9c"
      )
    ),
    titleFormat = "MMM yyyy",
    todayFormat = "DD dd MMMM yyyy",
    date = "Date",
    time = "Heure"
  )
) %>%
  grid_editor_date(
    column = "date"
  )%>%
  grid_editor_date(
    column = "date_locale",
    format = "dd/MM/yyyy",
    language = "custom",
    weekStartDay = "Mon"
  ) %>%
  grid_editor_date(
    column = "month",
    type = "month",
    format = "yyyy-MM"
  ) %>%
  grid_editor_date(
    column = "year",
    type = "year",
    format = "yyyy"
  ) %>%
  grid_editor_date(
    column = "time1",
    timepicker = "tab",
    format = "yyyy-MM-dd HH:mm"
  ) %>%
  grid_editor_date(
    column = "time2",
    timepicker = "normal",
    format = "yyyy-MM-dd HH:mm"
  )

  

{"x":{"nrow":10,"ncol":6,"data":[["2026-11-20","2026-11-21","2026-11-22","2026-11-23","2026-11-24","2026-11-25","2026-11-26","2026-11-27","2026-11-28","2026-11-29"],["20/11/2026","21/11/2026","22/11/2026","23/11/2026","24/11/2026","25/11/2026","26/11/2026","27/11/2026","28/11/2026","29/11/2026"],["2026-11","2026-11","2026-11","2026-11","2026-11","2026-11","2026-11","2026-11","2026-11","2026-11"],["2026","2026","2026","2026","2026","2026","2026","2026","2026","2026"],["2026-11-19T13:48:05Z","2026-11-19T13:48:06Z","2026-11-19T13:48:07Z","2026-11-19T13:48:08Z","2026-11-19T13:48:09Z","2026-11-19T13:48:10Z","2026-11-19T13:48:11Z","2026-11-19T13:48:12Z","2026-11-19T13:48:13Z","2026-11-19T13:48:14Z"],["2026-11-19T13:48:05Z","2026-11-19T13:48:06Z","2026-11-19T13:48:07Z","2026-11-19T13:48:08Z","2026-11-19T13:48:09Z","2026-11-19T13:48:10Z","2026-11-19T13:48:11Z","2026-11-19T13:48:12Z","2026-11-19T13:48:13Z","2026-11-19T13:48:14Z"]],"colnames":["date","date_locale","month","year","time1","time2"],"options":{"columns":[{"header":"date","name":"date","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"editor":{"type":"datePicker","options":{"format":"yyyy-MM-dd"}}},{"header":"date_locale","name":"date_locale","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"editor":{"type":"datePicker","options":{"format":"dd/MM/yyyy","language":"custom","weekStartDay":"Mon"}}},{"header":"month","name":"month","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"editor":{"type":"datePicker","options":{"format":"yyyy-MM","type":"month"}}},{"header":"year","name":"year","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"editor":{"type":"datePicker","options":{"format":"yyyy","type":"year"}}},{"header":"time1","name":"time1","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"editor":{"type":"datePicker","options":{"format":"yyyy-MM-dd HH:mm","timepicker":{"layoutType":"tab","inputType":"spinbox"}}}},{"header":"time2","name":"time2","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"editor":{"type":"datePicker","options":{"format":"yyyy-MM-dd HH:mm","timepicker":true}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false,"datepicker_locale":{"titles":{"DD":["Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi"],"D":["Dim","Lun","Mar","Mer","Jeu","Ven","Sam"],"MMMM":["Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre"],"MMM":["Jan","Fév","Mar","Avr","Mai","Juin","Juil","Aou","Sept","Oct","Nov","Déc"]},"titleFormat":"MMM yyyy","todayFormat":"DD dd MMMM yyyy","date":"Date","time":"Heure"}},"evals":[],"jsHooks":[]}
```
