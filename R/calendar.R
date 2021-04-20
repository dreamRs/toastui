
#' @title Create an interactive calendar
#'
#' @description Build interactive calendar with the JavaScript tui-calendar library.
#'
#' @param data A \code{data.frame} with schedules data, see \code{\link{cal_demo_data}}.
#' @param view Default view of calendar. The default value is 'week',
#'  other possible values are 'month' and 'day'.
#' @param defaultDate Default date for displaying calendar.
#' @param taskView Show the milestone and task in weekly, daily view.
#'  The default value is true. If the value is a vector, it can be 'milestone', 'task'.
#' @param scheduleView Show the all day and time grid in weekly, daily view.
#'  The default value is false. If the value is a vector, it can be 'allday', 'time'.
#' @param useDetailPopup Logical. Display a pop-up on click with detailled informations about schedules.
#' @param useCreationPopup Logical. Allow user to create schedules with a pop-up.
#' @param isReadOnly Calendar is read-only mode and a user can't create and modify any schedule. The default value is true.
#' @param useNavigation Add navigation buttons to got to previous or next period, or return to 'today'.
#' @param bttnOpts Options tu customize buttons (only if \code{useNavigation = TRUE}), see \code{\link{bttn_options}}.
#' @param width,height A numeric input in pixels.
#' @param elementId Use an explicit element ID for the widget.
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#' @importFrom htmltools findDependencies
#' @importFrom shiny icon
#'
#' @export
#'
#' @return A \code{calendar} htmlwidget.
#'
#' @example examples/ex-calendar.R
calendar <- function(data = NULL,
                     view = c("month", "week", "day"),
                     defaultDate = NULL,
                     taskView = FALSE,
                     scheduleView = TRUE,
                     useDetailPopup = TRUE,
                     useCreationPopup = FALSE,
                     isReadOnly = TRUE,
                     useNavigation = FALSE,
                     bttnOpts = bttn_options(),
                     width = NULL,
                     height = NULL,
                     elementId = NULL) {

  x = dropNulls(list(
    options = list(
      defaultView = match.arg(view),
      taskView = taskView,
      scheduleView = scheduleView,
      useDetailPopup = useDetailPopup,
      useCreationPopup = useCreationPopup,
      isReadOnly = isReadOnly,
      usageStatistics = getOption("toastuiUsageStatistics", default = FALSE)
    ),
    schedules = list(),
    useNav = isTRUE(useNavigation),
    defaultDate = defaultDate,
    events = list(),
    bttnOpts = bttnOpts
  ))

  dependencies <- NULL
  if (isTRUE(useNavigation)) {
    dependencies <- findDependencies(icon("home"))
  }

  cal <- createWidget(
    name = "calendar",
    x = x,
    width = width,
    height = height,
    dependencies = dependencies,
    package = "toastui",
    elementId = elementId,
    sizingPolicy = sizingPolicy(
      padding = 0,
      defaultWidth = "100%",
      defaultHeight = "100%",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "100%",
      knitr.figure = FALSE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = "600px",
      browser.fill = TRUE,
      viewer.suppress = FALSE,
      browser.external = TRUE
    )
  )
  if (!is.null(data)) {
    cal <- cal_schedules(cal, data)
  }
  return(cal)
}

#' @importFrom htmltools tagList tags
calendar_html <- function(id, style, class, ...) {
  tagList(
    tags$div(
      id = paste0(id, "_menu"),
      tags$span(
        id = paste0(id, "_menu_navi"),
        tags$button(
          type = "button",
          class = "btn bttn-no-outline action-button",
          id = paste0(id, "_today"),
          "Today"
        ),
        tags$button(
          type="button", class = "btn bttn-no-outline action-button",
          id = paste0(id, "_prev"),
          tags$i(class = "fa fa-chevron-left")
        ),
        tags$button(
          type="button", class = "btn bttn-no-outline action-button",
          id = paste0(id, "_next"),
          tags$i(class = "fa fa-chevron-right")
        )
      ),
      tags$span(id = paste0(id, "_renderRange"), class = "render-range")
    ),
    tags$br(),
    tags$div(id = id, style = style, class = class, ...)
  )
}





#' Options for buttons displayed above calendar
#'
#' @param today_label Text to display on today button.
#' @param prev_label Text to display on prev button.
#' @param next_label Text to display on next button.
#' @param class Class to add to buttons.
#' @param bg,color Background and text colors.
#' @param fmt_date Format for the date displayed next to the buttons,
#'  use moment.js date format (see\url{https://momentjs.com/docs/#/displaying/})
#'
#' @note Buttons are generated with the following CSS library : \url{http://bttn.surge.sh/},
#'  where you can find available options for \code{class} argument.
#'
#' @return a \code{list}.
#' @export
#'
#' @importFrom htmltools tags doRenderTags
#' @importFrom shiny icon
#'
#' @examples
#' # Use another button style
#' calendar(
#'   useNav = TRUE,
#'   bttnOpts = bttn_options(
#'     class = "bttn-stretch bttn-sm bttn-warning"
#'   )
#' )
#'
#' # Custom colors (background and text)
#' calendar(
#'   useNav = TRUE,
#'   bttnOpts = bttn_options(bg = "#FE2E2E", color = "#FFF")
#' )
#'
#' # both
#' calendar(
#'   useNav = TRUE,
#'   bttnOpts = bttn_options(
#'     bg = "#04B431", color = "#FFF",
#'     class = "bttn-float bttn-md"
#'   )
#' )
bttn_options <- function(today_label = "Today",
                         prev_label = icon("chevron-left"),
                         next_label = icon("chevron-right"),
                         class = "bttn-bordered bttn-sm bttn-primary",
                         bg = NULL, color = NULL,
                         fmt_date = "YYYY-MM-DD") {
  dropNulls(list(
    today_label = doRenderTags(today_label),
    prev_label = doRenderTags(prev_label),
    next_label = doRenderTags(next_label),
    class = paste0(" ", class),
    bg = bg,
    color = color,
    fmt_date = fmt_date
  ))
}





#' Shiny bindings for calendar
#'
#' Output and render functions for using calendar within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a calendar
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name calendar-shiny
#'
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#'
#' @export
calendarOutput <- function(outputId, width = "100%", height = "600px"){
  shinyWidgetOutput(outputId, "calendar", width, height, package = "toastui")
}

#' @rdname calendar-shiny
#' @export
renderCalendar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, calendarOutput, env, quoted = TRUE)
}
