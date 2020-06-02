
#' Set grid row style
#'
#' @param grid A grid created with \code{\link{datagrid}}.
#' @param expr An expression giving position of row. Must return a logical vector.
#' @param background Background color.
#' @param color Text color.
#' @param ... Other CSS properties.
#' @param class CSS class to apply to the row.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#'
#' @importFrom rlang enquo eval_tidy
#'
#' @example examples/ex-grid_row_style.R
grid_row_style <- function(grid,
                           expr,
                           background = NULL,
                           color = NULL,
                           ...,
                           class = NULL) {
  expr <- enquo(expr)
  check_grid(grid, "grid_row_style")
  rowKey <- eval_tidy(expr, data = grid$x$data_df)
  if (!is.logical(rowKey))
    stop("grid_row_style: expr must evaluate to a logical vector!")
  rowKey <- which(rowKey) - 1
  if (is.null(class)) {
    class <- paste0("datagrid-row-", sample.int(1e12, 1))
  }
  styles <- dropNulls(list(
    background = background,
    color = color, ...
  ))
  styles <- sprintf("%s:%s", names(styles), unlist(styles, use.names = FALSE))
  styles <- paste(styles, collapse = ";")
  styles <- sprintf(".%s{%s}", class, styles)
  grid$x$rowClass <- append(
    x = grid$x$rowClass,
    values = list(list(
      rowKey = list1(rowKey),
      class = class,
      styles = styles
    ))
  )
  return(grid)
}





#' Set grid cell(s) style
#'
#' @param grid A grid created with \code{\link{datagrid}}.
#' @param expr An expression giving position of row. Must return a logical vector.
#' @param column Name of column (variable name) to identify cells to style.
#' @param background Background color.
#' @param color Text color.
#' @param ... Other CSS properties.
#' @param class CSS class to apply to the row.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#'
#' @name grid-cell-style
#'
#' @importFrom rlang enquo eval_tidy as_function
#'
#' @example examples/ex-grid_cell_style.R
grid_cell_style <- function(grid,
                            expr,
                            column,
                            background = NULL,
                            color = NULL, ...,
                            class = NULL) {
  check_grid(grid, "grid_cell_style")
  if (!is.character(column) | length(column) != 1)
    stop("grid_cell_style: column must be a character of length one.")
  expr <- enquo(expr)
  rowKey <- eval_tidy(expr, data = grid$x$data_df)
  if (!is.logical(rowKey))
    stop("grid_cell_style: expr must evaluate to a logical vector!")
  rowKey <- which(rowKey) - 1
  if (is.null(class)) {
    class <- paste0("datagrid-cell-", sample.int(1e12, 1))
  }
  styles <- dropNulls(list(
    background = background,
    color = color, ...
  ))
  styles <- sprintf("%s:%s", names(styles), unlist(styles, use.names = FALSE))
  styles <- paste(styles, collapse = ";")
  styles <- sprintf(".%s{%s}", class, styles)
  grid$x$cellClass <- append(
    x = grid$x$cellClass,
    values = list(list(
      rowKey = list1(rowKey),
      class = class,
      column = column,
      styles = styles
    ))
  )
  return(grid)
}



#' @param fun Function to apply to \code{columns} to identify rows to style.
#' @param columns Columns names to use with \code{fun}.
#'
#' @export
#'
#' @rdname grid-cell-style
grid_cells_style <- function(grid,
                             fun,
                             columns,
                             background = NULL,
                             color = NULL,
                             ...,
                             class = NULL) {
  check_grid(grid, "grid_cells_style")
  if (!is.character(columns))
    stop("grid_cell_style: column must be character.", call. = FALSE)
  fun <- as_function(fun)
  rowKeys <- lapply(
    X = grid$x$data_df[, columns, drop = FALSE],
    FUN = fun
  )
  if (!all(vapply(rowKeys, is.logical, logical(1))))
    stop("grid_cells_style: fun must evaluate to a logical vector!", call. = FALSE)
  rowKeys <- lapply(rowKeys, function(x) {
    which(x) - 1
  })
  if (is.null(class)) {
    class <- paste0("datagrid-cells-", sample.int(1e12, 1))
  }
  styles <- dropNulls(list(
    background = background,
    color = color, ...
  ))
  styles <- sprintf("%s:%s", names(styles), unlist(styles, use.names = FALSE))
  styles <- paste(styles, collapse = ";")
  styles <- sprintf(".%s{%s}", class, styles)
  grid$x$cellsClass <- append(
    x = grid$x$cellsClass,
    values = dropNulls(lapply(
      X = seq_along(rowKeys),
      FUN = function(i) {
        if (length(rowKeys[[i]]) > 0) {
          list(
            rowKey = list1(rowKeys[[i]]),
            class = class,
            column = columns[i],
            styles = styles
          )
        } else {
          NULL
        }
      }
    ))
  )
  return(grid)
}







#' Style cells with a color bar
#'
#' @param grid A grid created with \code{\link{datagrid}}.
#' @param column The name of the column where to create a color bar.
#' @param bar_bg Background color of the color bar.
#' @param color Color of the text.
#' @param background Background of the cell.
#' @param from Range of values of the variable to represent as a color bar.
#' @param prefix,suffix String to put in front of or after the value.
#'
#' @return A \code{datagrid} htmlwidget.
#' @export
#' 
#' @importFrom htmlwidgets JS
#'
#' @example examples/ex-grid_colorbar.R
grid_colorbar <- function(grid,
                          column,
                          bar_bg = "#5E81AC",
                          color = "#ECEFF4",
                          background = "#ECEFF4",
                          from = NULL,
                          prefix = NULL,
                          suffix = NULL) {
  check_grid(grid, "grid_colorbar")
  stopifnot(is.character(column) & length(column) == 1)
  if (!column %in% grid$x$colnames) {
    stop(
      "grid_colorbar: invalid 'column' supplied, can't find in data.", 
      call. = FALSE
    )
  }
  if (is.null(from)) {
    from <- range(pretty(grid$x$data_df[[column]]), na.rm = TRUE)
  }
  if (is.null(prefix))
    prefix <- ""
  if (is.null(suffix))
    suffix <- ""
  grid_columns(
    grid = grid,
    vars = column, 
    renderer = list(
      type = htmlwidgets::JS("CustomBarRenderer"),
      options = list(
        bar_bg = bar_bg,
        color = color,
        background = background,
        from = from,
        prefix = prefix,
        suffix = suffix
      )
    )
  )
}

