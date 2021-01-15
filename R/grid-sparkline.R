

grid_sparkline <- function(grid,
                           column,
                           fun) {
  check_grid(grid, "grid_sparkline")
  widgets <- lapply(
    X = grid$x$data_df[[column]],
    FUN = function(x) {
      x <- fun(x)
      x <- as.tags(x)
      as.character(x)
    }
  )
  grid_columns(
    grid = grid,
    vars = column,
    renderer = list(
      type = htmlwidgets::JS("DatagridSparklineRenderer"),
      options = list(
        widgets = unlist(widgets, use.names = FALSE)
      )
    )
  )
}

add_dependencies <- function(widget, dependencies) {
  widget$dependencies <- htmltools::resolveDependencies(
    c(widget$dependencies, dependencies)
  )
  widget
}
