
#' Set grid language options
#'
#' @param display.noData,display.loadingData,display.resizeHandleGuide Display language options.
#' @param filter.contains,filter.eq,filter.ne,filter.start,filter.end,filter.after,filter.afterEq,filter.before,filter.beforeEq,filter.apply,filter.clear,filter.selectAll 
#'  Filter language options.
#'
#' @return No return value.
#' @export
#'
#' @example examples/grid-language.R
set_grid_lang <- function(display.noData = "No data",
                          display.loadingData = "Loading data...",
                          display.resizeHandleGuide = "You can change the width... [truncated]",
                          filter.contains = "Contains",
                          filter.eq = "Equals",
                          filter.ne = "Not equals",
                          filter.start = "Starts with",
                          filter.end = "Ends with",
                          filter.after = "After",
                          filter.afterEq = "After or Equal",
                          filter.before = "Before",
                          filter.beforeEq = "Before or Equal",
                          filter.apply = "Apply",
                          filter.clear = "Clear",
                          filter.selectAll = "Select All") {
  if (identical(display.resizeHandleGuide, "You can change the width... [truncated]")) {
    display.resizeHandleGuide <- paste(
      "You can change the width of the column by mouse drag",
      "and initialize the width by double-clicking."
    )
  }
  language <- list(
    display = list(
      noData = display.noData,
      loadingData = display.loadingData,
      resizeHandleGuide = display.resizeHandleGuide
    ),
    filter = list(
      contains = filter.contains,
      eq = filter.eq,
      ne = filter.ne,
      start = filter.start,
      end = filter.end,
      after = filter.after,
      afterEq = filter.afterEq,
      before = filter.before,
      beforeEq = filter.beforeEq,
      apply = filter.apply,
      clear = filter.clear,
      selectAll = filter.selectAll
    )
  )
  options("datagrid.language.options" = language)
}
