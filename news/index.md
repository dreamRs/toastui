# Changelog

## toastui 0.4.1

- Added proxy method
  [`editor_proxy_reset()`](https://dreamrs.github.io/toastui/reference/editor_proxy_reset.md)
  to reset an editor.

## toastui 0.4.0

CRAN release: 2025-04-03

- New htmlwidget
  [`editor()`](https://dreamrs.github.io/toastui/reference/editor.md), a
  Markdown WYSIWYG Editor (<https://ui.toast.com/tui-editor>).
- New input `input$<outputId>_data_filtered` in
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md)
  to get filtered data displayed in table.

## toastui 0.3.4

CRAN release: 2024-09-18

- Updated
  [`cal_props()`](https://dreamrs.github.io/toastui/reference/cal_props.md)
  example.
- Turn off `usageStatistics` option for
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md)
  and [`chart()`](https://dreamrs.github.io/toastui/reference/chart.md)
  (same as for
  [`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md)).
- [`datagridOutput()`](https://dreamrs.github.io/toastui/reference/datagrid-shiny.md)
  /
  [`renderDatagrid()`](https://dreamrs.github.io/toastui/reference/datagrid-shiny.md)
  fixed a bug causing table to have a css class `recalculating` added to
  the outpput element.

## toastui 0.3.3

CRAN release: 2024-03-28

- New function
  [`grid_col_checkbox()`](https://dreamrs.github.io/toastui/reference/grid_col_checkbox.md)
  to add checkboxes into a column.
- [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md):
  new argument `guess_colwidths_opts` to customize colums widths with
  function
  [`guess_colwidths_options()`](https://dreamrs.github.io/toastui/reference/guess_colwidths_options.md).

## toastui 0.3.2

CRAN release: 2024-03-02

- Updated tui-grid to 4.21.22.
- [`grid_editor_date()`](https://dreamrs.github.io/toastui/reference/grid_editor_date.md)
  new arguments `language` and `weekStartDay`.

#### Breaking changes

- [`grid_proxy_delete_row()`](https://dreamrs.github.io/toastui/reference/grid_proxy_delete_row.md):
  argument `index` renamed `rowKey` and now expect the row key of the
  row to delete, you can find the `rowKey` value in
  `input$<outputId>_data`.
- `input$<outputId>_data` is now given with an extra column `rowKey`
  thats gives the internant row key of the row.

## toastui 0.3.1

CRAN release: 2024-02-09

- Updated tui-grid to 4.21.17.
- Updated
  [`cal_events()`](https://dreamrs.github.io/toastui/reference/cal_events.md)
  example + added new event `selectDateTime`.
- Added
  [`cal_proxy_clear_selection()`](https://dreamrs.github.io/toastui/reference/cal_proxy_clear_selection.md)
  to clear selected area on calendar.

## toastui 0.3.0

CRAN release: 2023-06-20

- Updated tui-calendar to
  [@toast-ui](https://github.com/toast-ui)/calendar 2.1.3 (see
  <https://github.com/nhn/tui.calendar/blob/main/docs/en/guide/migration-guide-v2.md>)
- Updated [@toast-ui](https://github.com/toast-ui)/chart to 4.6.1
  (<https://github.com/nhn/tui.chart/releases>).
- Updated tui-grid to 4.21.12
  (<https://github.com/nhn/tui.grid/releases>).

## toastui 0.2.1

CRAN release: 2022-01-11

- First CRAN submission.
- Updated JavaScript dependencies (tui-calendar 1.15.1,
  [@toast-ui](https://github.com/toast-ui)/chart 4.4.1, tui-grid
  4.20.0).

## toastui 0.2.0

- Use [packer](https://github.com/JohnCoene/packer) to manage JavaScript
  source code and dependencies.
- Updated JavaScript dependencies (tui-calendar 1.14.1,
  [@toast-ui](https://github.com/toast-ui)/chart 4.4.1, tui-grid
  4.19.2).

## toastui 0.1.2.9000

- Updated JavaScript dependencies (tui-calendar 1.13.0,
  [@toast-ui](https://github.com/toast-ui)/chart 4.3.5, tui-grid
  4.18.0).
- New function
  [`cal_timezone()`](https://dreamrs.github.io/toastui/reference/cal_timezone.md)
  to set calendar timezone.
- New function
  [`cal_proxy_toggle()`](https://dreamrs.github.io/toastui/reference/cal_proxy_toggle.md)
  to show / hide schedules based on calendar ID.
- Grid: new options for filters language, see
  [`?set_grid_lang`](https://dreamrs.github.io/toastui/reference/set_grid_lang.md)

## toastui 0.1.2

- Added a `NEWS.md` file to track changes to the package.
- Added
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md)
  & helpers to create interactive tables based on
  [tui-grid](https://ui.toast.com/tui-grid/).
- Added
  [`calendar()`](https://dreamrs.github.io/toastui/reference/calendar.md)
  & helpers to create interactive calendars based on
  [tui-calendar](https://ui.toast.com/tui-calendar/).
- Added
  [`chart()`](https://dreamrs.github.io/toastui/reference/chart.md) &
  helpers to create interactive charts based on
  [tui-chart](https://ui.toast.com/tui-chart/).
