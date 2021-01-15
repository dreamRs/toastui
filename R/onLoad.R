
#' @importFrom shiny registerInputHandler
#' @importFrom utils type.convert
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
  }, force = TRUE)
  registerInputHandler("datagridCellSelection", function(data, ...) {
    if (is.null(data) || is.null(data$selected))
      return(NULL)
    start <- unlist(data$selected$start) + 1
    end <- unlist(data$selected$end) + 1
    data.frame(
      rows = c(start[1], end[1]),
      cols = c(start[2], end[2])
    )
  }, force = TRUE)
  registerInputHandler("datagridEdit", function(data, ...) {
    if (is.null(data) || is.null(data$data))
      return(NULL)
    data <- do.call("rbind", lapply(
      X = data$data,
      FUN = function(x) {
        x <- x[names(x) %in% data$colnames]
        x[sapply(x, is.null)] <- NA
        as.data.frame(x, stringsAsFactors = FALSE)
      }
    ))
    type.convert(data, as.is = TRUE)
  }, force = TRUE)
  registerInputHandler("datagridValidation", function(data, ...) {
    if (is.null(data))
      return(NULL)
    do.call("rbind", lapply(
      X = data,
      FUN = function(x) {
        data.frame(
          row = x$rowKey + 1,
          column = vapply(x$errors, FUN = `[[`, "columnName", FUN.VALUE = character(1)),
          error = vapply(x$errors, FUN = function(x) {
            x$errorInfo[[1]]$code
          }, FUN.VALUE = character(1)),
          stringsAsFactors = FALSE
        )
      }
    ))
  }, force = TRUE)
}

