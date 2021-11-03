
#' @title Set columns options
#'
#' @description Set options for one or several specific column.
#'
#' @param grid A grid created with [datagrid()].
#' @param columns Name(s) of column in the data used in [datagrid()].
#' @param header The header of the column to be shown on the header.
#' @param ellipsis If set to true, ellipsis will be used for overflowing content.
#' @param align Horizontal alignment of the column content. Available values are 'left', 'center', 'right'.
#' @param valign Vertical alignment of the column content. Available values are 'top', 'middle', 'bottom'.
#' @param className The name of the class to be used for all cells of the column.
#' @param width The width of the column. The unit is pixel. If this value isn't set, the column's width is automatically resized.
#' @param minWidth The minimum width of the column. The unit is pixel.
#' @param hidden If set to true, the column will not be shown.
#' @param resizable If set to false, the width of the column will not be changed.
#' @param defaultValue The default value to be shown when the column doesn't have a value.
#' @param formatter The function that formats the value of the cell.
#'  The return value of the function will be shown as the value of the cell.
#'  If set to 'listItemText', the value will be shown the text.
#' @param escapeHTML If set to true, the value of the cell will be encoded as HTML entities.
#' @param ignored If set to true, the value of the column will be ignored when setting up the list of modified rows.
#' @param sortable If set to true, sort button will be shown on the right side
#'  of the column header, which executes the sort action when clicked.
#' @param sortingType If set to 'desc', will execute descending sort initially
#'  when sort button is clicked. Default to 'asc'.
#' @param onBeforeChange The function that will be called before changing the
#'  value of the cell. If stop() method in event object is called, the changing will be canceled.
#' @param onAfterChange The function that will be called after changing the value of the cell.
#' @param whiteSpace If set to 'normal', the text line is broken by fitting to the column's width.
#'  If set to 'pre', spaces are preserved and the text is broken by new line characters.
#'  If set to 'pre-wrap', spaces are preserved, the text line is broken by fitting to the
#'  column's width and new line characters. If set to 'pre-line', spaces are merged,
#'  the text line is broken by fitting to the column's width and new line characters.
#' @param ... Additional parameters.
#'
#' @note Documentation come from \url{https://nhn.github.io/tui.grid/latest/Grid/}.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @importFrom htmltools doRenderTags
#'
#' @example examples/ex-grid_columns.R
grid_columns <- function(grid,
                         columns,
                         header = NULL,
                         ellipsis = NULL,
                         align = NULL,
                         valign = NULL,
                         className = NULL,
                         width = NULL,
                         minWidth = NULL,
                         hidden = NULL,
                         resizable = NULL,
                         defaultValue = NULL,
                         formatter = NULL,
                         escapeHTML = NULL,
                         ignored = NULL,
                         sortable = NULL,
                         sortingType = NULL,
                         onBeforeChange = NULL,
                         onAfterChange = NULL,
                         whiteSpace = NULL,
                         ...) {
  check_grid(grid)
  if (missing(columns))
    columns <- grid$x$colnames
  columns <- check_grid_column(grid, columns)
  config <- dropNulls(list(
    header = header,
    ellipsis = ellipsis,
    align = align,
    valign = valign,
    className = className,
    width = width,
    minWidth = minWidth,
    hidden = hidden,
    resizable = resizable,
    defaultValue = defaultValue,
    formatter = formatter,
    escapeHTML = escapeHTML,
    ignored = ignored,
    sortable = sortable,
    sortingType = sortingType,
    onBeforeChange = onBeforeChange,
    onAfterChange = onAfterChange,
    whiteSpace = whiteSpace,
    ...
  ))
  config <- rep_list(config, length(columns))
  for (column in columns) {
    i <- which(grid$x$colnames == column)
    j <- which(columns == column)
    colOpts <- lapply(config, `[[`, j)
    colOpts$name <- column
    if (!is.null(colOpts$header))
      colOpts$header <- htmltools::doRenderTags(colOpts$header)
    if (!is.null(grid$x$options$columns[[i]])) {
      grid$x$options$columns[[i]] <- modifyList(
        x = grid$x$options$columns[[i]],
        val = colOpts
      )
    } else {
      grid$x$options$columns[[i]] <- colOpts
    }
  }
  return(grid)
}




#' @title Set global columns options
#'
#' @description Set options for all columns.
#'
#' @param grid A table created with [datagrid()].
#' @param minWidth Minimum width of each columns.
#' @param resizable If set to true, resize-handles of each columns will be shown.
#' @param frozenCount The number of frozen columns.
#' @param frozenBorderWidth The value of frozen border width.
#'  When the frozen columns are created by "frozenCount" option, the frozen border width set.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @example examples/ex-grid_columns_opts.R
grid_columns_opts <- function(grid,
                              minWidth = NULL,
                              resizable = NULL,
                              frozenCount = NULL,
                              frozenBorderWidth = NULL) {
  check_grid(grid, "grid_columns_opts")
  options <- dropNulls(list(
    minWidth = minWidth,
    resizable = resizable,
    frozenCount = frozenCount,
    frozenBorderWidth = frozenBorderWidth
  ))
  .widget_options2(
    grid, name_opt = "columnOptions",
    l = options
  )
}





#' Display buttons in grid's column
#'
#' @param grid A table created with [datagrid()].
#' @param column The name of the column where to create buttons.
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Label to display on button, if \code{NULL} use column's content.
#' @param icon Icon to display in button.
#' @param status Status (color) of the button: default, primary, success, info, warning, danger.
#' @param btn_width Button's width.
#' @param ... Further arguments passed to \code{\link{grid_columns}}.
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @example examples/ex-grid_col_button.R
grid_col_button <- function(grid,
                            column,
                            inputId,
                            label = NULL,
                            icon = NULL,
                            status = c("default", "primary", "success", "info", "warning", "danger"),
                            btn_width = "100%",
                            ...) {
  check_grid(grid, "grid_col_button")
  status <- match.arg(status)
  stopifnot(is.character(column) & length(column) == 1)
  column <- check_grid_column(grid, column)
  if (!is.null(icon)) {
    icon_deps <- htmltools::findDependencies(icon)
    grid$dependencies <- c(
      grid$dependencies,
      icon_deps
    )
    icon <- htmltools::doRenderTags(icon)
  }
  grid_columns(
    grid = grid,
    columns = column,
    ...,
    renderer = list(
      type = JS("datagrid.renderer.button"),
      options = dropNulls(list(
        status = status,
        width = btn_width,
        label = label,
        inputId = inputId,
        icon = icon
      ))
    )
  )
}

