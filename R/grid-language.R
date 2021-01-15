
#' Set grid language options
#'
#' @param display.noData,display.loadingData,display.resizeHandleGuide Language options.
#'
#' @return No return value.
#' @export
#'
#' @example examples/ex-language.R
set_grid_lang <- function(display.noData = "No data",
                          display.loadingData = "Loading data...",
                          display.resizeHandleGuide = NULL) {
  if (is.null(display.resizeHandleGuide)) {
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
    )
  )
  options("datagrid.language.options" = language)
}
