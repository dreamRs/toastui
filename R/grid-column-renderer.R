
#' Display buttons in grid's column
#'
#' @param grid A table created with [datagrid()].
#' @param column The name of the column where to create buttons.
#' @param inputId The `input` slot that will be used to access the value.
#' @param label Label to display on button, if `NULL` use column's content.
#' @param icon Icon to display in button.
#' @param status Bootstrap status (color) of the button: default, primary, success, info, warning, danger, ...
#'  A class prefixed by `btn-` will be added to the button.
#' @param btn_width Button's width.
#' @param ... Further arguments passed to [grid_columns()].
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
                            status = "default",
                            btn_width = "100%",
                            ...) {
  check_grid(grid, "grid_col_button")
  stopifnot(is.character(status))
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
        status = status[1],
        width = btn_width,
        label = label,
        inputId = inputId,
        icon = icon
      ))
    )
  )
}



#' Display checkboxes in grid's column
#'
#' @param grid A table created with [datagrid()].
#' @param column The name of the column where to create buttons.
#' @param class CSS classes to add to checkbox container.
#' @param ... Further arguments passed to [grid_columns()].
#'
#' @return A `datagrid` htmlwidget.
#' @export
#'
#' @example examples/ex-grid_col_checkbox.R
grid_col_checkbox <- function(grid,
                              column,
                              class = "form-check d-flex justify-content-center my-1",
                              ...) {
  check_grid(grid, "grid_col_checkbox")
  stopifnot(is.character(column) & length(column) == 1)
  column <- check_grid_column(grid, column)
  grid_columns(
    grid = grid,
    columns = column,
    ...,
    renderer = list(
      type = JS("datagrid.renderer.checkbox"),
      options = dropNulls(list(
        class = class
      ))
    )
  )
}
