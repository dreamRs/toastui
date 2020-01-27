
# dropNulls
dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}

`%||%` <- function(x, y) {
  if (!is.null(x)) x else y
}

list1 <- function(x) {
  if (is.null(x))
    return(x)
  if (length(x) == 1 & !is.list(x)) {
    list(x)
  } else {
    x
  }
}


#' Utility function to create Htmlwidget parameters JSON
#'
#' @param bb A \code{htmlwidget} object.
#' @param name_opt Slot's name to edit.
#' @param ... Arguments for the slot.
#' @param modify_x Modify base widgets options.
#'
#' @return A \code{htmlwidget} object.
#'
#' @importFrom utils modifyList
#'
#' @noRd
.widget_options <- function(widget, name_opt, ..., modify_x = FALSE) {

  if(!inherits(widget, "tuigridr")){
    stop("grid must be an object built with tuigridr().")
  }

  if (isTRUE(modify_x)) {
    opts <- widget$x
  } else {
    opts <- widget$x$options
  }

  if (is.null(opts[[name_opt]])) {
    opts[[name_opt]] <- dropNulls(list(...))
  } else {
    opts[[name_opt]] <- utils::modifyList(
      x = opts[[name_opt]],
      val = dropNulls(list(...)),
      keep.null = TRUE
    )
  }

  if (isTRUE(modify_x)) {
    widget$x <- opts
  } else {
    widget$x$options <- opts
  }

  return(widget)
}

#' Utility function to create Htmlwidget parameters JSON
#'
#' @param bb A \code{htmlwidget} object.
#' @param name_opt Slot's name to edit.
#' @param l List of arguments for the slot.
#' @param modify_x Modify base widgets options.
#'
#' @return A \code{htmlwidget} object.
#'
#' @noRd
.widget_options2 <- function(widget, name_opt, l, modify_x = FALSE) {

  if(!inherits(widget, "tuigridr")){
    stop("grid must be an object built with tuigridr().")
  }

  if (isTRUE(modify_x)) {
    opts <- widget$x
  } else {
    opts <- widget$x$options
  }

  if (is.null(opts[[name_opt]])) {
    opts[[name_opt]] <- l
  } else {
    opts[[name_opt]] <- utils::modifyList(
      x = opts[[name_opt]],
      val = l,
      keep.null = TRUE
    )
  }

  if (isTRUE(modify_x)) {
    widget$x <- opts
  } else {
    widget$x$options <- opts
  }

  return(widget)
}
