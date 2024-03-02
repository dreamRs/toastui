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
