
#' @title Set grid row style
#'
#' @description Apply styles to an entire row identified by an expression.
#'
#' @param grid A grid created with [datagrid()].
#' @param expr An expression giving position of row. Must return a logical vector.
#' @param background Background color.
#' @param color Text color.
#' @param fontWeight Font weight, you can use \code{"bold"} for example.
#' @param ... Other CSS properties.
#' @param class CSS class to apply to the row.
#' @param cssProperties Alternative to specify CSS properties with a named list.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @importFrom rlang enquo eval_tidy
#'
#' @example examples/ex-grid_style_row.R
grid_style_row <- function(grid,
                           expr,
                           background = NULL,
                           color = NULL,
                           fontWeight = NULL,
                           ...,
                           class = NULL,
                           cssProperties = NULL) {
  expr <- enquo(expr)
  check_grid(grid, "grid_style_row")
  rowKey <- eval_tidy(expr, data = grid$x$data_df)
  if (!is.logical(rowKey))
    stop("grid_style_row: expr must evaluate to a logical vector!")
  rowKey <- which(rowKey) - 1
  if (is.null(class)) {
    class <- paste0("datagrid-row-", genId())
  }
  styles <- make_styles(c(
    list(
      background = background,
      color = color,
      fontWeight = fontWeight,
      ...
    ), cssProperties
  ), class = class)
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





#' @title Set grid cell(s) style
#'
#' @description Customize cell(s) appearance with CSS
#'  according to an expression in the data used in the grid.
#'
#' @param grid A grid created with [datagrid()].
#' @param expr An expression giving position of row. Must return a logical vector.
#' @param column Name of column (variable name) where to apply style.
#' @param background Background color.
#' @param color Text color.
#' @param fontWeight Font weight, you can use \code{"bold"} for example.
#' @param ... Other CSS properties.
#' @param class CSS class to apply to the row.
#' @param cssProperties Alternative to specify CSS properties with a named list.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @name grid-cell-style
#'
#' @importFrom rlang enquo eval_tidy as_function
#'
#' @example examples/ex-grid_style_cell.R
grid_style_cell <- function(grid,
                            expr,
                            column,
                            background = NULL,
                            color = NULL,
                            fontWeight = NULL,
                            ...,
                            class = NULL,
                            cssProperties = NULL) {
  check_grid(grid, "grid_style_cell")
  if (!is.character(column) | length(column) != 1)
    stop("grid_style_cell: `column` must be a character of length one.", call. = FALSE)
  expr <- enquo(expr)
  rowKey <- eval_tidy(expr, data = grid$x$data_df)
  if (is.list(rowKey)) {
    args <- dropNulls(list(
      background = background,
      color = color,
      fontWeight = fontWeight,
      ...
    ))
    args <- rep_list(args, length(rowKey))
    if (!is.null(class))
      class <- rep(class, times = length(rowKey))
    for (i in seq_along(rowKey)) {
      grid <- grid_style_cell(
        grid = grid,
        expr = rowKey[[i]],
        column = column,
        cssProperties = lapply(args, `[[`, i),
        class = class[i]
      )
    }
    return(grid)
  }
  if (!is.logical(rowKey))
    stop("grid_style_cell: expr must evaluate to a logical vector!")
  rowKey <- which(rowKey) - 1
  if (is.null(class)) {
    class <- paste0("datagrid-cell-", genId())
  }
  styles <- make_styles(c(
    list(
      background = background,
      color = color,
      fontWeight = fontWeight,
      ...
    ), cssProperties
  ), class = class)
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
grid_style_cells <- function(grid,
                             fun,
                             columns,
                             background = NULL,
                             color = NULL,
                             ...,
                             class = NULL,
                             cssProperties = NULL) {
  check_grid(grid, "grid_style_cells")
  if (!is.character(columns))
    stop("grid_style_cells: column must be character.", call. = FALSE)
  fun <- as_function(fun)
  rowKeys <- lapply(
    X = grid$x$data_df[, columns, drop = FALSE],
    FUN = fun
  )
  if (!all(vapply(rowKeys, is.logical, logical(1))))
    stop("grid_style_cells: fun must evaluate to a logical vector!", call. = FALSE)
  rowKeys <- lapply(rowKeys, function(x) {
    which(x) - 1
  })
  if (is.null(class)) {
    class <- paste0("datagrid-cells-", genId())
  }
  styles <- make_styles(c(
    list(
      background = background,
      color = color, ...
    ), cssProperties
  ), class = class)
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
#' @param grid A grid created with [datagrid()].
#' @param column The name of the column where to create a color bar.
#' @param bar_bg Background color of the color bar.
#' @param color Color of the text.
#' @param background Background of the cell.
#' @param from Range of values of the variable to represent as a color bar.
#' @param prefix,suffix String to put in front of or after the value.
#' @param label_outside Show label outside of the color bar.
#' @param label_width Width of label in case it's displayed outside the color bar.
#' @param border_radius Border radius of color bar.
#' @param height Height in pixel of color bar.
#' @param align Alignment of label if it is displayed inside the color bar.
#'
#' @return A `datagrid` htmlwidget.
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
                          suffix = NULL,
                          label_outside = FALSE,
                          label_width = "20px",
                          border_radius = "0px",
                          height = "16px",
                          align = c("left", "center", "right")) {
  check_grid(grid, "grid_colorbar")
  align <- match.arg(align)
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
    columns = column,
    align = align,
    renderer = list(
      type = htmlwidgets::JS("datagrid.renderer.colorbar"),
      options = list(
        bar_bg = bar_bg,
        color = color,
        background = background,
        from = from,
        prefix = prefix,
        suffix = suffix,
        label_outside = label_outside,
        label_width = label_width,
        height = height,
        border_radius = border_radius
      )
    )
  )
}





#' @title Set column style
#'
#' @description Apply styles to a column according to CSS properties
#'  declared by expression based on data passed to grid..
#'
#' @param grid A grid created with [datagrid()].
#' @param column Name of column (variable name) where to apply style.
#' @param background Background color.
#' @param color Text color.
#' @param fontWeight Font weight, you can use \code{"bold"} for example.
#' @param ... Other CSS properties.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @importFrom rlang enexprs eval_tidy exec
#'
#' @example examples/ex-grid_style_column.R
grid_style_column <- function(grid,
                              column,
                              background = NULL,
                              color = NULL,
                              fontWeight = NULL,
                              ...) {
  check_grid(grid, "grid_style_column")
  props <- lapply(
    X = enexprs(
      background = background,
      color = color,
      fontWeight = fontWeight,
      ...
    ),
    FUN = eval_tidy,
    data = grid$x$data_df
  )
  props <- as.data.frame(dropNulls(props))
  if (identical(nrow(props), 1L)) {
    props <- props[rep(1, times = nrow(grid$x$data_df)), , drop = FALSE]
  }
  props$datagridRowKey <- seq_len(nrow(grid$x$data_df))
  lprops <- split(props, props[, setdiff(names(props), "datagridRowKey"), drop = FALSE])
  for (i in seq_along(lprops)) {
    props_ <- lprops[[i]]
    lprops_ <- lapply(
      X = props_[, setdiff(names(props_), "datagridRowKey"), drop = FALSE],
      FUN = unique
    )
    args <- c(
      list(
        grid = grid,
        expr = props$datagridRowKey %in% props_$datagridRowKey,
        column = column
      ),
      lprops_
    )
    grid <- exec("grid_style_cell", !!!args)
  }
  return(grid)
}




