
check_grid <- function(grid, fun = NULL) {
  if(!inherits(grid, "datagrid")){
    stop(paste(c(
      fun, "grid must be an object built with datagrid()."
    ), collapse = ": "), call. = FALSE)
  }
}


to_hyphen <- function(x) {
  tolower(gsub("([A-Z])", "-\\1", x))
}

make_styles <- function(styles, class) {
  styles <- dropNulls(styles)
  styles <- sprintf("%s:%s", to_hyphen(names(styles)), unlist(styles, use.names = FALSE))
  styles <- paste(styles, collapse = ";")
  sprintf(".%s{%s}", class, styles)
}

genId <- function(bytes = 12) {
  paste(format(as.hexmode(sample(256, bytes, replace = TRUE) - 1), width = 2), collapse = "")
}



# Functions to create JSON parameters -------------------------------------

# dropNulls
dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}

list_ <- function(...) {
  dropNulls(list(...))
}

`%||%` <- function(x, y) {
  if (!is.null(x)) x else y
}

list1 <- function(x) {
  if (is.null(x))
    return(NULL)
  if (length(x) == 1 & !is.list(x)) {
    list(x)
  } else {
    x
  }
}

rep_list <- function(l, n) {
  lapply(l, function(x) {
    if (is.atomic(x) & !inherits(x, "JS_EVAL")) {
      rep_len(x, length.out = n)
    } else {
      lapply(seq_len(n), function(i) x)
    }
  })
}



# Guess columns size ------------------------------------------------------


maxnchar <- function(x) {
  if (length(x) < 1L)
    return(0)
  if (inherits(x, "character")) {
    max(nchar(x, keepNA = FALSE), na.rm = TRUE)
  } else if (inherits(x, "factor")) {
    max(nchar(levels(x), keepNA = FALSE), na.rm = TRUE)
  } else {
    0
  }
}
nchar_cols <- function(data, min_width = 70, add_header = 12) {
  cols <- vapply(data, maxnchar, numeric(1))
  colsnms <- ceiling(nchar(names(data), keepNA = FALSE) * 1.3) + add_header
  widths <- pmax(cols, colsnms)
  pmin(pmax(min_width, widths * 4), 500)
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

  if(!inherits(widget, "datagrid")){
    stop("grid must be an object built with datagrid().")
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

  if(!inherits(widget, "datagrid")){
    stop("grid must be an object built with datagrid().")
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



#' Call a proxy method
#'
#' @param proxy  A \code{proxy} \code{htmlwidget} object.
#' @param name Proxy method.
#' @param ... Arguments passed to method.
#'
#' @return A \code{htmlwidgetProxy} \code{htmlwidget} object.
#' @noRd
.call_proxy <- function(proxy, name, ...) {
  if (!"htmlwidgetProxy" %in% class(proxy))
    stop("This function must be used with a htmlwidgetProxy object", call. = FALSE)
  proxy$session$sendCustomMessage(
    type = sprintf("proxy-toastui-%s", name),
    message = list(id = proxy$id, data = dropNulls(list(...)))
  )
  proxy
}
.call_proxy2 <- function(proxy, name, l) {
  if (!"htmlwidgetProxy" %in% class(proxy))
    stop("This function must be used with a htmlwidgetProxy object", call. = FALSE)
  proxy$session$sendCustomMessage(
    type = sprintf("proxy-toastui-%s", name),
    message = list(id = proxy$id, data = l)
  )
  proxy
}

