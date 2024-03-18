
check_grid <- function(grid, fun = as.character(sys.call(sys.parent()))[1L]) {
  if(!inherits(grid, "datagrid")){
    stop(paste(c(
      fun, "grid must be an object built with datagrid()."
    ), collapse = ": "), call. = FALSE)
  }
}

check_cal <- function(cal, fun = as.character(sys.call(sys.parent()))[1L]) {
  if(!inherits(cal, "calendar")){
    stop(paste(c(
      fun, "cal must be an object built with calendar()."
    ), collapse = ": "), call. = FALSE)
  }
}

check_chart <- function(chart, fun = as.character(sys.call(sys.parent()))[1L]) {
  if(!inherits(chart, "chart")){
    stop(paste(c(
      fun, "chart must be an object built with chart()."
    ), collapse = ": "), call. = FALSE)
  }
}

check_grid_column <- function(grid, column, fun = as.character(sys.call(sys.parent()))[1L]) {
  if (is.numeric(column)) {
    column <- grid$x$colnames[column]
  }
  if (!is.character(column)) {
    stop(fun, ": column(s) must be a character vector or a numeric indice.", call. = FALSE)
  }
  var_diff <- setdiff(column, grid$x$colnames)
  if (length(var_diff) > 0) {
    stop(fun, ": Variable(s) ", paste(var_diff, collapse = ", "),
         " are not valid columns in data passed to datagrid()", call. = FALSE)
  }
  return(column)
}

to_hyphen <- function(x) {
  tolower(gsub("([A-Z])", "-\\1", x))
}

make_styles <- function(styles, class) {
  styles <- dropNulls(styles)
  styles <- sprintf("%s:%s !important;", to_hyphen(names(styles)), unlist(styles, use.names = FALSE))
  styles <- paste(styles, collapse = " ")
  if (is.null(class)) {
    return(styles)
  } else {
    sprintf(".%s{%s}", class, styles)
  }
}

genId <- function(bytes = 12, n = 1) {
  replicate(
    n = n,
    paste(format(as.hexmode(sample(256, bytes, replace = TRUE) - 1), width = 2), collapse = "")
  )
}


get_align <- function(data) {
  vapply(
    X = data,
    FUN = function(x) {
      if (inherits(x, c("numeric", "integer", "Date", "POSIXct"))) {
        "right"
      } else if (inherits(x, "logical")) {
        "center"
      } else {
        "left"
      }
    },
    FUN.VALUE = character(1),
    USE.NAMES = FALSE
  )
}

is_tag <- function(x) {
  if (inherits(x, c("shiny.tag", "shiny.tag.list")))
    return(TRUE)
  x <- lapply(x, inherits, what = c("shiny.tag", "shiny.tag.list"))
  any(unlist(x, use.names = FALSE))
}

is_htmlwidget <- function(x) {
  if (inherits(x, "htmlwidget"))
    return(TRUE)
  x <- lapply(x, inherits, what = "htmlwidget")
  any(unlist(x, use.names = FALSE))
}


#' @importFrom htmltools resolveDependencies
add_dependencies <- function(widget, dependencies) {
  widget$dependencies <- resolveDependencies(
    c(widget$dependencies, dependencies)
  )
  widget
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
  if (is.logical(x))
    return(x)
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

rows_to_list <- function(data) {
  data <- as.data.frame(data)
  l <- lapply(split(data, seq_len(nrow(data))), as.list)
  names(l) <- NULL
  return(l)
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
    max(nchar(as.character(x), keepNA = FALSE), na.rm = TRUE)
  }
}
nchar_cols <- function(data, min_width = 70, max_width = 400, mul = 1, add = 0, add_header = 12) {
  cols <- vapply(data, maxnchar, numeric(1))
  colsnms <- ceiling(nchar(names(data), keepNA = FALSE) * 1.3) + add_header
  widths <- pmax(cols, colsnms) * 4
  pmin(pmax(min_width, widths * mul + add), max_width)
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

  if (!inherits(widget, "htmlwidget")){
    stop("widget must be an htmlwidget.")
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

  if (!inherits(widget, "htmlwidget")){
    stop("widget must be an htmlwidget.")
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

