
#' @title Set global theme options
#'
#' @description Properties to customize grid theme, see full list here :
#'  \url{https://nhn.github.io/tui.grid/latest/Grid/}.
#'
#' @param outline.border Color of the table outline.
#' @param outline.showVerticalBorder Whether vertical outlines of the table are visible.
#' @param selection.background Background color of a selection layer.
#' @param selection.border Border color of a selection layer.
#' @param scrollbar.border Border color of scrollbars.
#' @param scrollbar.background Background color of scrollbars.
#' @param scrollbar.emptySpace Color of extra spaces except scrollbar.
#' @param scrollbar.thumb Color of thumbs in scrollbars.
#' @param scrollbar.active Color of arrows(for IE) or  thumb:hover(for other browsers) in scrollbars.
#' @param frozenBorder.border Border color of a frozen border.
#' @param area.header.background Background color of the header area in the table.
#' @param area.header.border Border color of the header area in the table.
#' @param area.body.background Background color of the body area in the table.
#' @param area.summary.background Background color of the summary area in the table.
#' @param area.summary.border Border color of the summary area in the table.
#' @param row.even.background background color of even row.
#' @param row.even.text text color of even row.
#' @param row.odd.background background color of cells in odd row.
#' @param row.odd.text text color of odd row.
#' @param row.dummy.background background color of dummy row.
#' @param row.hover.background background color of hovered row.
#' @param cell.normal.background Background color of normal cells.
#' @param cell.normal.border Border color of normal cells.
#' @param cell.normal.text Text color of normal cells.
#' @param cell.normal.showVerticalBorder Whether vertical borders of normal cells are visible.
#' @param cell.normal.showHorizontalBorder Whether horizontal borders of normal cells are visible.
#' @param cell.header.background Background color of header cells.
#' @param cell.header.border border color of header cells.
#' @param cell.header.text text color of header cells.
#' @param cell.header.showVerticalBorder Whether vertical borders of header cells are visible.
#' @param cell.header.showHorizontalBorder Whether horizontal borders of header cells are visible.
#' @param cell.selectedHeader.background background color of selected header cells.
#' @param cell.rowHeader.background Background color of row's header cells.
#' @param cell.rowHeader.border border color of row's header cells.
#' @param cell.rowHeader.text text color of row's header cells.
#' @param cell.rowHeader.showVerticalBorder Whether vertical borders of row's header cells are visible.
#' @param cell.rowHeader.showHorizontalBorder Whether horizontal borders of row's header cells are visible.
#' @param cell.selectedRowHeader.background background color of selected row's head cells.
#' @param cell.summary.background Background color of cells in the summary area.
#' @param cell.summary.border border color of cells in the summary area.
#' @param cell.summary.text text color of cells in the summary area.
#' @param cell.summary.showVerticalBorder Whether vertical borders of cells in the summary area are visible.
#' @param cell.summary.showHorizontalBorder Whether horizontal borders of cells in the summary area are visible.
#' @param cell.focused.background background color of a focused cell.
#' @param cell.focused.border border color of a focused cell.
#' @param cell.focusedInactive.border border color of a inactive focus cell.
#' @param cell.required.background background color of required cells.
#' @param cell.required.text text color of required cells.
#' @param cell.editable.background background color of the editable cells.
#' @param cell.editable.text text color of the selected editable cells.
#' @param cell.disabled.background background color of disabled cells.
#' @param cell.disabled.text text color of disabled cells.
#' @param cell.invalid.background background color of invalid cells.
#' @param cell.invalid.text text color of invalid cells.
#'
#' @return No return value.
#' @export
#'
#' @name datagrid-theme
#'
#' @example examples/grid-theme.R
set_grid_theme <- function(selection.background = NULL,
                           selection.border = NULL,
                           scrollbar.border = NULL,
                           scrollbar.background = NULL,
                           scrollbar.emptySpace = NULL,
                           scrollbar.thumb = NULL,
                           scrollbar.active = NULL,
                           outline.border = NULL,
                           outline.showVerticalBorder = NULL,
                           frozenBorder.border = NULL,
                           area.header.border = NULL,
                           area.header.background = NULL,
                           area.body.background = NULL,
                           area.summary.border = NULL,
                           area.summary.background = NULL,
                           row.even.background = NULL,
                           row.even.text = NULL,
                           row.odd.background = NULL,
                           row.odd.text = NULL,
                           row.dummy.background = NULL,
                           row.hover.background = NULL,
                           cell.normal.background = NULL,
                           cell.normal.border = NULL,
                           cell.normal.text = NULL,
                           cell.normal.showVerticalBorder = NULL,
                           cell.normal.showHorizontalBorder = NULL,
                           cell.header.background = NULL,
                           cell.header.border = NULL,
                           cell.header.text = NULL,
                           cell.header.showVerticalBorder = NULL,
                           cell.header.showHorizontalBorder = NULL,
                           cell.rowHeader.background = NULL,
                           cell.rowHeader.border = NULL,
                           cell.rowHeader.text = NULL,
                           cell.rowHeader.showVerticalBorder = NULL,
                           cell.rowHeader.showHorizontalBorder = NULL,
                           cell.summary.background = NULL,
                           cell.summary.border = NULL,
                           cell.summary.text = NULL,
                           cell.summary.showVerticalBorder = NULL,
                           cell.summary.showHorizontalBorder = NULL,
                           cell.selectedHeader.background = NULL,
                           cell.selectedRowHeader.background = NULL,
                           cell.focused.border = NULL,
                           cell.focused.background = NULL,
                           cell.focusedInactive.border = NULL,
                           cell.required.background = NULL,
                           cell.required.text = NULL,
                           cell.editable.background = NULL,
                           cell.editable.text = NULL,
                           cell.disabled.background = NULL,
                           cell.disabled.text = NULL,
                           cell.invalid.background = NULL,
                           cell.invalid.text = NULL) {
  options <- list_(
    selection = list_(
      background = selection.background,
      border = selection.border
    ),
    scrollbar = list_(
      border = scrollbar.border,
      background = scrollbar.background,
      emptySpace = scrollbar.emptySpace,
      thumb = scrollbar.thumb,
      active = scrollbar.active
    ),
    outline = list_(
      border = outline.border,
      showVerticalBorder = outline.showVerticalBorder
    ),
    frozenBorder = list_(
      border = frozenBorder.border
    ),
    area = list_(
      header = list_(
        border = area.header.border, background = area.header.background
      ),
      body = list_(
        background = area.body.background
      ),
      summary = list_(
        border = area.summary.border,
        background = area.summary.background
      )
    ),
    row = list(
      odd = list_(
        background = row.odd.background,
        text = row.odd.text
      ),
      even = list_(
        background = row.even.background,
        text = row.even.text
      ),
      dummy = list_(background = row.dummy.background),
      hover = list_(background = row.hover.background)
    ),
    cell = list_(
      normal = list_(
        background = cell.normal.background,
        border = cell.normal.border,
        text = cell.normal.text,
        showVerticalBorder = cell.normal.showVerticalBorder,
        showHorizontalBorder = cell.normal.showHorizontalBorder
      ),
      header = list_(
        background = cell.header.background,
        border = cell.header.border,
        text = cell.header.text,
        showVerticalBorder = cell.header.showVerticalBorder,
        showHorizontalBorder = cell.header.showHorizontalBorder
      ),
      rowHeader = list_(
        background = cell.rowHeader.background,
        border = cell.rowHeader.border,
        text = cell.rowHeader.text,
        showVerticalBorder = cell.rowHeader.showVerticalBorder,
        showHorizontalBorder = cell.rowHeader.showHorizontalBorder
      ),
      summary = list_(
        background = cell.summary.background,
        border = cell.summary.border,
        text = cell.summary.text,
        showVerticalBorder = cell.summary.showVerticalBorder,
        showHorizontalBorder = cell.summary.showHorizontalBorder
      ),
      selectedHeader = list_(background = cell.selectedHeader.background),
      selectedRowHeader = list_(background = cell.selectedRowHeader.background),
      focused = list_(
        border = cell.focused.border,
        background = cell.focused.background
      ),
      focusedInactive = list_(border = cell.focusedInactive.border),
      required = list_(
        background = cell.required.background,
        text = cell.required.text
      ),
      editable = list_(
        background = cell.editable.background,
        text = cell.editable.text
      ),
      disabled = list_(
        background = cell.disabled.background,
        text = cell.disabled.text
      ),
      invalid = list_(
        background = cell.invalid.background,
        text = cell.invalid.text
      )
    )
  )
  options("datagrid.theme" = options)
}

#' @export
#'
#' @rdname datagrid-theme
reset_grid_theme <- function() {
  options("datagrid.theme" = list())
}

# # To create list above
# x <- jsonlite::fromJSON(txt = "data-raw/theme-defaut.json")
# u <- unlist(x)
# dput(paste(paste0(names(u), " = NULL"), collapse = ", "))
# u <- names(u)
# dput(relist(u, x))
