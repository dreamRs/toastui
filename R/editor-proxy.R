
#' Proxy for editor htmlwidget
#'
#' @param shinyId single-element character vector indicating the output ID of the
#'   chart to modify (if invoked from a Shiny module, the namespace will be added
#'   automatically).
#' @param session the Shiny session object to which the chart belongs; usually the
#'   default value will suffice.
#'
#' @return A `editor_proxy` object.
#'
#' @family editor proxy methods
#'
#' @export
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @examples
#' \dontrun{
#'
#' # Consider having created a editor widget with
#' editorOutput("my_editor") # UI
#' output$my_editor <- renderEditor({}) # Server
#'
#' # Then you can call proxy methods in observer:
#'
#' # set editor proxy then call a cal_proxy_* function
#' editor_proxy("my_editor") %>%
#'   cal_proxy_today()
#'
#' # or directly
#' cal_proxy_today("my_editor")
#'
#' }
editor_proxy <- function(shinyId, session = shiny::getDefaultReactiveDomain()) {
  if (is.null(session)) {
    stop("editor_proxy must be called from the server function of a Shiny app")
  }
  if (!is.null(session$ns) && nzchar(session$ns(NULL)) && substring(shinyId, 1, nchar(session$ns(""))) != session$ns("")) {
    shinyId <- session$ns(shinyId)
  }
  structure(
    list(
      session = session,
      id = shinyId,
      x = list()
    ),
    class = c("editor_proxy", "htmlwidgetProxy")
  )
}


#' Change editor's preview style
#'
#' @param proxy A [editor_proxy()] or `outputId` of the editor
#' @param style Style for the editor : 'tab' or 'vertical'.
#'
#' @return A `editor_proxy` object.
#' @export
#'
#' @family editor proxy methods
#'
#' @example examples/editor-proxy.R
editor_proxy_change_preview <- function(proxy, style = c("tab", "vertical")) {
  if (is.character(proxy)) {
    proxy <- editor_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "editor-change-preview",
    style = match.arg(style)
  )
}

#' Insert text in an editor
#'
#' @param proxy A [editor_proxy()] or `outputId` of the editor
#' @param text Text to insert.
#'
#' @return A `editor_proxy` object.
#' @export
#'
#' @family editor proxy methods
#'
#' @example examples/editor-proxy.R
editor_proxy_insert <- function(proxy, text) {
  if (is.character(proxy)) {
    proxy <- editor_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "editor-insert-text",
    text = text
  )
}


#' @title Show/hide an editor
#'
#' @param proxy A [editor_proxy()] `htmlwidget` object.
#'
#' @export
#'
#' @return A `editor_proxy` object.
#'
#' @name editor-proxy-show-hide
#' @family editor proxy methods
#'
#' @example examples/editor-proxy.R
editor_proxy_show <- function(proxy) {
  if (is.character(proxy)) {
    proxy <- editor_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "editor-show"
  )
}

#' @export
#' @rdname editor-proxy-show-hide
editor_proxy_hide <- function(proxy) {
  if (is.character(proxy)) {
    proxy <- editor_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "editor-hide"
  )
}
