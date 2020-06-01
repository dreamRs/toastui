
#' @importFrom shiny registerInputHandler
.onLoad <- function(...) {
  registerInputHandler("datagridRowSelection", function(data, ...) {
    if (is.null(data) || is.null(data$selected))
      return(NULL)
    if (identical(data$returnValue, "data")) {
      do.call("rbind", lapply(
        X = data$selected,
        FUN = function(x) {
          x <- x[names(x) %in% data$colnames]
          as.data.frame(x)
        }
      ))
    } else {
      unlist(lapply(data$selected, `[[`, "rowKey")) + 1
    }
  })
  registerInputHandler("datagridCellSelection", function(data, ...) {
    if (is.null(data) || is.null(data$selected))
      return(NULL)
    start <- unlist(data$selected$start) + 1
    end <- unlist(data$selected$end) + 1
    data.frame(
      rows = c(start[1], end[1]),
      cols = c(start[2], end[2])
    )
  })
}

