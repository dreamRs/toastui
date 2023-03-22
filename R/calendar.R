
#' @title Create an interactive calendar
#'
#' @description Build interactive calendar with the JavaScript tui-calendar library.
#'
#' @param data A `data.frame` with schedules data, see [cal_demo_data()].
#' @param view Default view of calendar. The default value is 'week',
#'  other possible values are 'month' and 'day'.
#' @param defaultDate Default date for displaying calendar.
#' @param useDetailPopup Logical. Display a pop-up on click with detailed informations about schedules.
#' @param useCreationPopup Logical. Allow user to create schedules with a pop-up.
#' @param isReadOnly Calendar is read-only mode and a user can't create and modify any schedule. The default value is true.
#' @param navigation Add navigation buttons to got to previous or next period, or return to 'today'.
#' @param navOpts Options to customize buttons (only if `navigation = TRUE`), see [navigation_options()].
#' @param ... Additional arguments passed to JavaScript method.
#' @param width,height A numeric input in pixels.
#' @param elementId Use an explicit element ID for the widget.
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#' @importFrom shinyWidgets html_dependency_bttn
#'
#' @export
#'
#' @note `taskView` and `scheduleView` arguments have been moved to [cal_week_options()].
#'
#' @seealso [calendarOutput()] / [renderCalendar()] for usage in Shiny applications.
#'
#' @return A `calendar` htmlwidget.
#'
#' @example examples/ex-calendar.R
calendar <- function(data = NULL,
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
                     elementId = NULL) {

  x <- list_(
    options = list(
      defaultView = match.arg(view),
      useDetailPopup = useDetailPopup,
      useFormPopup = useCreationPopup,
      isReadOnly = isReadOnly,
      ...,
      usageStatistics = getOption("toastuiUsageStatistics", default = FALSE)
    ),
    schedules = list(),
    navigation = isTRUE(navigation),
    defaultDate = defaultDate,
    events = list(),
    navigationOptions = navOpts
  )

  dependencies <- if (isTRUE(navigation)) {
    list(html_dependency_bttn())
  }

  cal <- createWidget(
    name = "calendar",
    x = x,
    width = width,
    height = height,
    package = "toastui",
    elementId = elementId,
    dependencies = dependencies,
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
  tags$div(
    class = "toastui-calendar", style = style, class = class,
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
#'  use dayjs library (see https://day.js.org/docs/en/display/format).
#' @param sep_date Separator to use between start date and end date.
#'
#' @note Buttons are generated with the following CSS library : http://bttn.surge.sh/,
#'  where you can find available options for `class` argument.
#'
#' @return a \code{list}.
#' @export
#'
#' @importFrom htmltools tags doRenderTags
#' @importFrom phosphoricons ph
#'
#' @examples
#' # Use another button style
#' calendar(
#'   navigation = TRUE,
#'   navOpts = navigation_options(
#'     class = "bttn-stretch bttn-sm bttn-warning"
#'   )
#' )
#'
#' # Custom colors (background and text)
#' calendar(
#'   navigation = TRUE,
#'   navOpts = navigation_options(bg = "#FE2E2E", color = "#FFF")
#' )
#'
#' # both
#' calendar(
#'   navigation = TRUE,
#'   navOpts = navigation_options(
#'     bg = "#04B431", color = "#FFF",
#'     class = "bttn-float bttn-md"
#'   )
#' )
#'
#'
#' # Change date format and separator
#' calendar(
#'   navigation = TRUE,
#'   navOpts = navigation_options(
#'     fmt_date = "DD/MM/YYYY",
#'     sep_date = " - "
#'   )
#' )
navigation_options <- function(today_label = "Today",
                               prev_label = ph("caret-left"),
                               next_label = ph("caret-right"),
                               class = "bttn-bordered bttn-sm bttn-primary",
                               bg = NULL,
                               color = NULL,
                               fmt_date = "YYYY-MM-DD",
                               sep_date = " ~ ") {
  dropNulls(list(
    today_label = doRenderTags(today_label),
    prev_label = doRenderTags(prev_label),
    next_label = doRenderTags(next_label),
    class = paste0(" ", class),
    bg = bg,
    color = color,
    fmt_date = fmt_date,
    sep_date = sep_date
  ))
}



