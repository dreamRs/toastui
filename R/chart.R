
#' Interactive charts
#'
#' @param data 
#' @param mapping 
#' @param type 
#' @param ... 
#' @param options 
#' @param height 
#' @param width 
#' @param elementId 
#'
#' @return A \code{chart} htmlwidget.
#' @export
#'
#' @example examples/ex-chart.R
chart <- function(data,
                  mapping = NULL, 
                  type = c("column", "bar", "area", "line",
                           "scatter", "bubble", "boxPlot", 
                           "heatmap", "treemap", "radialBar", "pie"),
                  ...,
                  options = list(),
                  height = NULL, 
                  width = NULL, 
                  elementId = NULL) {
  type <- match.arg(type)
  if (!is.list(options))
    stop("options must be a list")
  if (is.null(height))
    options$chart$height <- "auto"
  if (is.null(width))
    options$chart$width <- "auto"
  if (!is.null(mapping)) {
    data <- construct_serie(data, mapping, type)
  }
  createWidget(
    name = "chart",
    x = list(
      config = list(
        type = paste0(type, "Chart"),
        data = data,
        options = options
      )
    ),
    width = width,
    height = height,
    package = "toastui",
    elementId = elementId,
    sizingPolicy = sizingPolicy(
      defaultWidth = "100%",
      defaultHeight = "100%",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "100%",
      knitr.figure = FALSE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = "350px",
      browser.fill = TRUE,
      viewer.suppress = FALSE,
      browser.external = TRUE,
      padding = 0
    )
  )
}


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
  exprs
}


#' @importFrom rlang eval_tidy as_label
construct_serie <- function(data, mapping, type, serie_name = NULL) {
  data <- as.data.frame(data)
  mapdata <- lapply(mapping, rlang::eval_tidy, data = data)
  mapdata <- as.data.frame(mapdata)
  complete <- complete.cases(mapdata)
  n_missing <- sum(!complete)
  if (n_missing > 0) {
    mapdata <- mapdata[complete, , drop = FALSE]
    warning(sprintf("chart: Removed %s rows containing missing values", n_missing), call. = FALSE)
  }
  if (is.null(serie_name))
    serie_name <- rlang::as_label(mapping$y)
  if (type %in% c("bar", "column")) {
    construct_serie_bar(mapdata, serie_name)
  } else if (type %in% "treemap") {
    construct_serie_treemap(mapdata, setdiff(names(mapdata), "colorValue"))
  } else if (type %in% "heatmap") {
    construct_serie_heatmap(mapdata)
  } else if (type %in% "scatter") {
    construct_serie_scatter(mapdata, serie_name)
  }
}


# Bar / column ----
construct_serie_bar <- function(data, serie_name) {
  if (is.null(data$fill)) {
    list(
      categories = data$x,
      series = list(
        list(
          name = serie_name, 
          data = data$y
        )
      )
    )
  } else {
    x_order <- unique(data$x)
    list(
      categories = unique(data$x),
      series = lapply(
        X = as.character(unique(data$fill)),
        FUN = function(x) {
          group <- data[data$fill %in% x, ]
          group <- group[, setdiff(names(data), "fill"), drop = FALSE]
          group <- group[order(match(x = group[["x"]], table = x_order, nomatch = 0L)), , drop = FALSE]
          list(
            name = as.character(x),
            data = group$y
          )
        }
      )
    )
  }
}


# Treemap ----
construct_serie_treemap <- function(data, levels, ...) {
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
        c(list(label = var, data = nrow(dat), colorValue = sum(dat$colorValue)), args_level)
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
    x = unique(data$x),
    y = unique(data$y)
  )
  list(
    categories = categories,
    series = lapply(
      X = categories$y,
      FUN = function(x) {
        data$fill[data$y == x]
      }
    )
  )
}



# Scatter / bubble ----
construct_serie_scatter <- function(data, serie_name) {
  if (is.null(data$colour)) {
    list(
      series = list(list(
        name = serie_name,
        data = unname(apply(
          X = data[, c("x", "y")], 
          MARGIN = 1, 
          FUN = function(x) {
            setNames(as.list(x), c("x", "y"))
          }
        ))
      ))
    )
  } else {
    list(
      series = lapply(
        X = unique(data$colour),
        FUN = function(x) {
          list(
            name = x,
            data = unname(apply(
              X = data[data$colour == x, c("x", "y")], 
              MARGIN = 1, 
              FUN = function(x) {
                setNames(as.list(x), c("x", "y"))
              }
            ))
          )
        }
      )
    )
  }
}

