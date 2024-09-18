# toastui 0.3.4

* Updated `cal_props()` example.
* Turn off `usageStatistics` option for `datagrid()` and `chart()` (same as for `calendar()`).
* `datagridOutput()` / `renderDatagrid()` fixed a bug causing table to have a css class `recalculating` added to the outpput element.


# toastui 0.3.3

* New function `grid_col_checkbox()` to add checkboxes into a column.
* `datagrid()`: new argument `guess_colwidths_opts` to customize colums widths with function `guess_colwidths_options()`.



# toastui 0.3.2

* Updated tui-grid to 4.21.22.
* `grid_editor_date()` new arguments `language` and `weekStartDay`.

### Breaking changes

* `grid_proxy_delete_row()`: argument `index` renamed `rowKey` and now expect the row key of the row to delete, you can find the `rowKey` value in `input$<outputId>_data`.
* `input$<outputId>_data` is now given with an extra column `rowKey` thats gives the internant row key of the row.



# toastui 0.3.1

* Updated tui-grid to 4.21.17.
* Updated `cal_events()` example + added new event `selectDateTime`.
* Added `cal_proxy_clear_selection()` to clear selected area on calendar. 



# toastui 0.3.0

* Updated tui-calendar to @toast-ui/calendar 2.1.3 (see https://github.com/nhn/tui.calendar/blob/main/docs/en/guide/migration-guide-v2.md)
* Updated @toast-ui/chart to 4.6.1 (https://github.com/nhn/tui.chart/releases).
* Updated tui-grid to 4.21.12 (https://github.com/nhn/tui.grid/releases).



# toastui 0.2.1

* First CRAN submission.
* Updated JavaScript dependencies (tui-calendar 1.15.1, @toast-ui/chart 4.4.1, tui-grid 4.20.0).



# toastui 0.2.0

* Use [packer](https://github.com/JohnCoene/packer) to manage JavaScript source code and dependencies.
* Updated JavaScript dependencies (tui-calendar 1.14.1, @toast-ui/chart 4.4.1, tui-grid 4.19.2).



# toastui 0.1.2.9000

* Updated JavaScript dependencies (tui-calendar 1.13.0, @toast-ui/chart 4.3.5, tui-grid 4.18.0).
* New function `cal_timezone()` to set calendar timezone.
* New function `cal_proxy_toggle()` to show / hide schedules based on calendar ID.
* Grid: new options for filters language, see `?set_grid_lang`



# toastui 0.1.2

* Added a `NEWS.md` file to track changes to the package.
* Added `datagrid()` & helpers to create interactive tables based on [tui-grid](https://ui.toast.com/tui-grid/).
* Added `calendar()` & helpers to create interactive calendars based on [tui-calendar](https://ui.toast.com/tui-calendar/).
* Added `chart()` & helpers to create interactive charts based on [tui-chart](https://ui.toast.com/tui-chart/).
