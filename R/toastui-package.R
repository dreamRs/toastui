#' @title HTMLwidget interface to the
#'  \href{https://ui.toast.com/}{TOASTUI} javascript libraries.
#'
#' @description Create interactive tables, calendars and charts with one package.
#' 
#' @section Tables:
#' Interactive and editable tables with \href{https://ui.toast.com/tui-grid/}{tui-grid}, see [datagrid()].
#' 
#' @section Calendars:
#' Interactive and editable calendars with \href{https://ui.toast.com/tui-calendar/}{tui-calendar}, see \code{\link{calendar}}.
#' 
#' @section Charts:
#' Interactive charts with \href{https://ui.toast.com/tui-chart/}{tui-chart}, see \code{\link{chart}}.
#'
#' @name toastui
#' @docType package
#' @author Victor Perrier (@@dreamRs_fr)
NULL

#' toastui exported operators and S3 methods
#'
#' The following functions are imported and then re-exported
#' from the toastui package to avoid listing the magrittr
#' as Depends of toastui
#'
#' @name toastui-exports
NULL

#' @importFrom magrittr %>%
#' @name %>%
#' @export
#' @rdname toastui-exports
NULL

#' @importFrom htmlwidgets JS
#' @name JS
#' @export
#' @rdname toastui-exports
NULL
