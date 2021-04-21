
#' Proxy for datagrid htmlwidget
#'
#' @param shinyId single-element character vector indicating the output ID of the
#'   chart to modify (if invoked from a Shiny module, the namespace will be added
#'   automatically).
#' @param session the Shiny session object to which the chart belongs; usually the
#'   default value will suffice.
#'
#' @export
#' 
#' @importFrom shiny getDefaultReactiveDomain
grid_proxy <- function(shinyId, session = shiny::getDefaultReactiveDomain()) {
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
    class = c("datagridProxy", "htmlwidgetProxy")
  )
}


#' Add rows to a existent \code{datagrid}
#'
#' @param proxy A \code{\link{grid_proxy}} or \code{outputId} of the grid.
#' @param data \code{data.frame} to append in the grid.
#'
#' @return No value.
#' @export
#'
#' @example examples/grid-prox-addrow.R
grid_proxy_addrow <- function(proxy, data) {
  data <- as.data.frame(data)
  if (is.character(proxy)) {
    proxy <- grid_proxy(proxy)
  }
  .call_proxy(
    proxy = proxy,
    name = "grid-addrows",
    nrow = nrow(data),
    ncol = ncol(data),
    data = unname(data),
    colnames = names(data)
  )
}


