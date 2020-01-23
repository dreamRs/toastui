
#' @importFrom shiny registerInputHandler
.onLoad <- function(...) {
  registerInputHandler("tuigridrRowSelection", function(data, ...) {
    if (is.null(data))
      return(NULL)
    if (is.null(data$selected))
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
}

