
#' @title Construct aesthetic mappings
#' 
#' @description Low-level version of `ggplot2::aes`.
#'
#' @param x,y,... List of name-value pairs in the form aesthetic = variable.
#'
#' @return a `list` of `quosure`.
#' @export
#' 
#' @importFrom rlang enquos
#'
#' @examples
#' caes(x = month, y = value)
#' caes(x = month, y = value, fill = city)
caes <- function(x, y, ...) {
  exprs <- enquos(x = x, y = y, ..., .ignore_empty = "all")
  names(exprs)[names(exprs) == "color"] <- "colour"
  names(exprs)[names(exprs) == "colorValue"] <- "colourValue"
  exprs
}


#' @importFrom rlang eval_tidy as_label
#' @importFrom stats complete.cases
construct_serie <- function(data, mapping, type, serie_name = NULL) {
  data <- as.data.frame(data)
  if (identical(type, "gauge"))
    return(construct_serie_gauge(data, serie_name))
  mapdata <- lapply(mapping, rlang::eval_tidy, data = data)
  mapdata <- as.data.frame(mapdata)
  complete <- complete.cases(mapdata)
  n_missing <- sum(!complete)
  if (n_missing > 0) {
    mapdata <- mapdata[complete, , drop = FALSE]
    warning(sprintf("chart: Removed %s rows containing missing values", n_missing), call. = FALSE)
  }
  if (nrow(mapdata) < 1)
    return(list(categories = list(), series = list()))
  if (is.null(serie_name))
    serie_name <- rlang::as_label(mapping$y)
  if (type %in% c("bar", "column")) {
    construct_serie_bar(mapdata, serie_name)
  } else if (type %in% "treemap") {
    construct_serie_treemap(mapdata)
  } else if (type %in% "heatmap") {
    construct_serie_heatmap(mapdata)
  } else if (type %in% c("scatter", "bubble")) {
    construct_serie_scatter(mapdata, serie_name)
  } else if (type %in% "pie") {
    construct_serie_pie(mapdata, serie_name)
  } else if (type %in% c("line", "area")) {
    construct_serie_line(mapdata, serie_name)
  } else {
    stop("chart: type not implemented.")
  }
}


# Bar / column ----
construct_serie_bar <- function(data, serie_name) {
  if (is.null(data$fill)) {
    list(
      categories = list1(data$x),
      series = list(
        list(
          name = serie_name, 
          data = list1(data$y)
        )
      )
    )
  } else {
    x_order <- unique(data$x)
    list(
      categories = list1(unique(data$x)),
      series = lapply(
        X = as.character(unique(data$fill)),
        FUN = function(x) {
          group <- data[data$fill %in% x, ]
          group <- group[, setdiff(names(data), "fill"), drop = FALSE]
          group <- group[order(match(x = group[["x"]], table = x_order, nomatch = 0L)), , drop = FALSE]
          list(
            name = as.character(x),
            data = list1(group$y)
          )
        }
      )
    )
  }
}


# Treemap ----
construct_serie_treemap <- function(data, ...) {
  levels <- setdiff(names(data), c("value", "colourValue"))
  list(series = construct_tree(data, levels, ...))
}

construct_tree <- function(data, levels, ...) {
  args <- list(...)
  data <- as.data.frame(data)
  if (!all(levels %in% names(data)))
    stop("All levels must be valid variables in data", call. = FALSE)
  data[levels] <- lapply(data[levels], as.character)
  lapply(
    X = unique(data[[levels[1]]][!is.na(data[[levels[1]]])]),
    FUN = function(var) {
      dat <- data[data[[levels[1]]] == var, , drop = FALSE]
      args_level <- args[[levels[1]]]
      if (length(levels) == 1) {
        if (is.null(data$value)) {
          value <- nrow(dat)
        } else {
          value <- sum(dat$value, na.rm = TRUE)
        }
        c(list(label = var, data = value, colorValue = sum(dat$colourValue)), args_level)
      } else {
        c(
          list(
            label = var,
            children = construct_tree(
              data = dat,
              levels = levels[-1],
              ...
            )
          ),
          args_level
        )
      }
    }
  )
}


# Heatmap ----

construct_serie_heatmap <- function(data) {
  categories <- list(
    x = list1(unique(data$x)),
    y = list1(unique(data$y))
  )
  list(
    categories = categories,
    series = lapply(
      X = categories$y,
      FUN = function(x) {
        list1(data$fill[data$y == x])
      }
    )
  )
}



# Scatter / bubble ----
construct_serie_scatter <- function(data, serie_name) {
  if (is.null(data$colour)) {
    data$colour <- serie_name
  }
  if (!is.null(data$size))
    data$r <- data$size
  list(
    series = lapply(
      X = unique(data$colour),
      FUN = function(x) {
        nm <- intersect(names(data), c("x", "y", "r"))
        list(
          name = x,
          data = unname(apply(
            X = data[data$colour == x, nm], 
            MARGIN = 1, 
            FUN = function(x) {
              setNames(as.list(x), nm)
            }
          ))
        )
      }
    )
  )
}



# Pie ----

construct_serie_pie <- function(data, serie_name) {
  list(
    categories = list(serie_name),
    series = unname(apply(
      X = data[, c("x", "y")], 
      MARGIN = 1, 
      FUN = function(x) {
        x <- setNames(as.list(x), c("name", "data"))
        x$data <- as.numeric(x$data)
        x
      }
    ))
  )
}


# Line / area ----

construct_serie_line <- function(data, serie_name) {
  if (is.null(data$colour)) {
    data$colour <- serie_name
  }
  if (inherits(data$x, c("Date", "POSIXct")))
    data <- data[order(data$x), ]
  categories <- unique(data$x)
  list(
    categories = list1(categories),
    series = lapply(
      X = unique(data$colour),
      FUN = function(x) {
        list(
          name = x,
          data = list1(data$y[data$colour == x])
        )
      }
    )
  )
}



# Gauge ----

#' @importFrom rlang is_list have_name
construct_serie_gauge <- function(data, serie_name = NULL) {
  data <- as.list(data)
  if (!is_list(data) || !have_name(data) || length(data) != 1) {
    stop("For gauge type, data must be a named list of length 1", call. = FALSE)
  }
  list(
    series = list(list(name = names(data), data = list(data[[1]])))
  )
}

