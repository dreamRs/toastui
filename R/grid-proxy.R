
#' Proxy for datagrid htmlwidget
#'
#' @param shinyId single-element character vector indicating the output ID of the
#'   chart to modify (if invoked from a Shiny module, the namespace will be added
#'   automatically).
#' @param session the Shiny session object to which the chart belongs; usually the
#'   default value will suffice.
#'
#' @return A `datagrid_proxy` object.
#'
#' @family datagrid proxy methods
#'
#' @export
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @examples
#' \dontrun{
#'
#' # Consider having created a datagrid widget with
#' datagridOutput("my_grid") # UI
#' output$my_grid <- renderDatagrid({}) # Server
#'
#' # Then you can call proxy methods in observer:
#'
#' # set datagrid proxy then call a cal_proxy_* function
#' datagrid_proxy("my_grid") %>%
#'   datagrid_proxy_addrow(mydata)
#'
#' # or directly
#' datagrid_proxy_addrow("my_grid", mydata)
#'
#' }
datagrid_proxy <- function(shinyId, session = shiny::getDefaultReactiveDomain()) {
  if (is.null(session)) {
    stop("grid_proxy must be called from the server function of a Shiny app")
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
    class = c("datagrid_proxy", "htmlwidgetProxy")
  )
}


#' Add rows to an existent datagrid
#'
#' @param proxy A [datagrid_proxy()] or `outputId` of the grid.
#' @param data `data.frame` to append in the grid.
#'
#' @return A `datagrid_proxy` object.
#' @export
#'
#' @family datagrid proxy methods
#'
#' @example examples/grid-proxy-add-row.R
grid_proxy_add_row <- function(proxy, data) {
  data <- as.data.frame(data)
  if (is.character(proxy)) {
    proxy <- datagrid_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "grid-add-rows",
    nrow = nrow(data),
    ncol = ncol(data),
    data = unname(data),
    colnames = names(data)
  )
}


#' Delete row in an existent grid
#'
#' @param proxy A [datagrid_proxy()] or `outputId` of the grid.
#' @param index Row indice of the row to delete.
#'
#' @return A `datagrid_proxy` object.
#' @export
#'
#' @family datagrid proxy methods
#'
#' @example examples/grid-proxy-delete-row.R
grid_proxy_delete_row <- function(proxy, index) {
  if (is.character(proxy)) {
    proxy <- datagrid_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "grid-delete-rows",
    index = list1(as.numeric(index) - 1)
  )
}

