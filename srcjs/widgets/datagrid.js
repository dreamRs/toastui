import "widgets";
import Grid from "tui-grid";
import "tui-grid/dist/tui-grid.min.css";
import "tui-pagination/dist/tui-pagination.css";
import "tui-date-picker/dist/tui-date-picker.css";
import "tui-time-picker/dist/tui-time-picker.css";
import TuiDatePicker from "tui-date-picker";


import { ProxyGrid } from "../modules/proxy-grid";
import { addStyle } from "../modules/utils";

import { DatagridBarRenderer } from "../modules/grid-renderer-bar";
import { DatagridFormatRenderer } from "../modules/grid-renderer-format";
import { DatagridHTMLWidgetsRenderer } from "../modules/grid-renderer-htmlwidgets";
import { DatagridButtonRenderer } from "../modules/grid-renderer-button";
import { DatagridRadioRenderer } from "../modules/grid-renderer-radio";
import { DatagridCheckboxRenderer } from "../modules/grid-renderer-checkbox";
import { DatagridSliderRenderer } from "../modules/grid-renderer-slider";
import { DatagridRowNamesRenderer } from "../modules/grid-renderer-rownames";
export const renderer = {
  colorbar: DatagridBarRenderer,
  format: DatagridFormatRenderer,
  htmlwidgets: DatagridHTMLWidgetsRenderer,
  button: DatagridButtonRenderer,
  radio: DatagridRadioRenderer,
  checkbox: DatagridCheckboxRenderer,
  slider: DatagridSliderRenderer,
  rownames: DatagridRowNamesRenderer,
};

import { DatagridSliderEditor } from "../modules/grid-editor-slider";
export const editor = {
  slider: DatagridSliderEditor,
};

import {
  DatagridColumnHeaderHTML,
  DatagridColumnHeaderSortHTML,
} from "../modules/grid-header";
export const header = {
  html: DatagridColumnHeaderHTML,
  htmlsort: DatagridColumnHeaderSortHTML,
};

export const applyTheme = Grid.applyTheme;
//export default function applyTheme(presetName, extOptions)) {
//  Grid.applyTheme(presetName, extOptions);
//};

// HTMLWidgets bindings

HTMLWidgets.widget({
  name: "datagrid",

  type: "output",

  factory: function (el, width, height) {
    var grid, config;

    return {
      renderValue: function (x) {
        addStyle(".datagrid-sparkline-cell {overflow: visible !important;}");
        var container = document.getElementById(el.id + "-container");
        if (typeof grid !== "undefined") {
          grid.destroy();
          container.innerHTML = "";
        }

        config = x;
        var options = x.options;
        options.el = container;

        var rowAttributes = x.rowAttributes;

        if (config.hasOwnProperty("datepicker_locale")) {
          TuiDatePicker.localeTexts["custom"] = config.datepicker_locale;
        }

        //if (options.hasOwnProperty("bodyHeight") & HTMLWidgets.shinyMode) {
        //  if (options.bodyHeight == "fitToParent") {
        //    document.getElementById(el.id).style.marginBottom = "25px";
        //  }
        //}

        // Construct data (put back names)
        const data = [];
        for (let i = 0; i < x.nrow; i += 1) {
          const row = {};
          for (let j = 0; j < x.ncol; j += 1) {
            row[x.colnames[j]] = x.data[j][i];
          }
          if (rowAttributes.length > 0) {
            // && rowAttributes[i].length > 0
            // console.log(rowAttributes[i]);
            row._attributes = rowAttributes[i];
          }
          data.push(row);
        }
        options.data = data;

        // Generate the grid
        grid = new Grid(options);
        Grid.applyTheme(x.theme, x.themeOptions);
        Grid.setLanguage(x.language, x.languageOptions);

        /*
        // Apply focus on entire row
        grid.on('focusChange', (ev) => {
          console.log(ev.rowKey);
          grid.setSelectionRange({
            start: [grid.getIndexOfRow(ev.rowKey), 0],
            end: [grid.getIndexOfRow(ev.rowKey), grid.getColumns().length]
          });
        });
        */

        // Styles for rows
        if (x.hasOwnProperty("rowClass")) {
          //console.log(x.rowClass);
          for (let i = 0; i < x.rowClass.length; i += 1) {
            //console.log(x.rowClass[i].styles);
            addStyle(x.rowClass[i].styles);
            for (let j = 0; j < x.rowClass[i].rowKey.length; j += 1) {
              grid.addRowClassName(
                x.rowClass[i].rowKey[j],
                x.rowClass[i].class
              );
            }
          }
        }

        // Styles for cell
        if (x.hasOwnProperty("cellClass")) {
          //console.log(x.cellClass);
          for (let i = 0; i < x.cellClass.length; i += 1) {
            //console.log(x.cellClass[i].styles);
            addStyle(x.cellClass[i].styles);
            for (let j = 0; j < x.cellClass[i].rowKey.length; j += 1) {
              grid.addCellClassName(
                x.cellClass[i].rowKey[j],
                x.cellClass[i].column,
                x.cellClass[i].class
              );
            }
          }
        }
        // Styles for cells
        if (x.hasOwnProperty("cellsClass")) {
          // console.log(x.cellsClass);
          for (let i = 0; i < x.cellsClass.length; i += 1) {
            // console.log(x.cellsClass[i].styles);
            addStyle(x.cellsClass[i].styles);
            for (let j = 0; j < x.cellsClass[i].rowKey.length; j += 1) {
              grid.addCellClassName(
                x.cellsClass[i].rowKey[j],
                x.cellsClass[i].column,
                x.cellsClass[i].class
              );
            }
          }
        }

        // Selection
        if (x.hasOwnProperty("rowSelection") & HTMLWidgets.shinyMode) {
          function rowSelection(ev) {
            Shiny.setInputValue(x.rowSelection.id + ":datagridRowSelection", {
              selected: grid.getCheckedRows(),
              colnames: x.colnames,
              returnValue: x.rowSelection.returnValue,
            }, {priority: "event"});
          }
          grid.on("checkAll", rowSelection);
          grid.on("uncheckAll", rowSelection);
          grid.on("check", rowSelection);
          grid.on("uncheck", rowSelection);
        }
        if (x.hasOwnProperty("cellSelection") & HTMLWidgets.shinyMode) {
          grid.on("selection", function (ev) {
            Shiny.setInputValue(x.cellSelection.id + ":datagridCellSelection", {
              selected: grid.getSelectionRange(),
              colnames: x.colnames,
              returnValue: x.cellSelection.returnValue,
            }, {priority: "event"});
          });
        }
        if (x.hasOwnProperty("clickEvent") & HTMLWidgets.shinyMode) {
          grid.on("click", function (ev) {
            Shiny.setInputValue(x.clickEvent.id, {
              row: ev.rowKey + 1,
              col: ev.columnName,
            }, {priority: "event"});
          });
        }

        // Edit
        if (HTMLWidgets.shinyMode & (x.dataAsInput === true)) {
          Shiny.setInputValue(el.id + "_data:datagridEdit", {
            data: grid.getData(),
            colnames: x.colnames,
          }, {priority: "event"});
          Shiny.setInputValue(el.id + "_data_filtered:datagridEdit", {
            data: grid.getFilteredData(),
            colnames: x.colnames,
          }, {priority: "event"});
          grid.on("afterSort", function (ev) {
            Shiny.setInputValue(el.id + "_data:datagridEdit", {
              data: ev.instance.getData(),
              colnames: x.colnames,
            }, {priority: "event"});
            Shiny.setInputValue(el.id + "_data_filtered:datagridEdit", {
              data: ev.instance.getFilteredData(),
              colnames: x.colnames,
            }, {priority: "event"});
          });
          grid.on("afterUnsort", function (ev) {
            Shiny.setInputValue(el.id + "_data:datagridEdit", {
              data: ev.instance.getData(),
              colnames: x.colnames,
            }, {priority: "event"});
            Shiny.setInputValue(el.id + "_data_filtered:datagridEdit", {
              data: ev.instance.getFilteredData(),
              colnames: x.colnames,
            }, {priority: "event"});
          });
          grid.on("afterFilter", function (ev) {
            Shiny.setInputValue(el.id + "_data:datagridEdit", {
              data: ev.instance.getData(),
              colnames: x.colnames,
            }, {priority: "event"});
            Shiny.setInputValue(el.id + "_data_filtered:datagridEdit", {
              data: ev.instance.getFilteredData(),
              colnames: x.colnames,
            }, {priority: "event"});
          });
          grid.on("afterUnfilter", function (ev) {
            Shiny.setInputValue(el.id + "_data:datagridEdit", {
              data: ev.instance.getData(),
              colnames: x.colnames,
            }, {priority: "event"});
            Shiny.setInputValue(el.id + "_data_filtered:datagridEdit", {
              data: ev.instance.getFilteredData(),
              colnames: x.colnames,
            }, {priority: "event"});
          });
          if (x.validationInput === true) {
            Shiny.setInputValue(
              el.id + "_validation:datagridValidation",
              grid.validate(),
              {priority: "event"}
            );
            grid.on("editingFinish", function (ev) {
              Shiny.setInputValue(
                el.id + "_validation:datagridValidation",
                grid.validate(),
                {priority: "event"}
              );
            });
          }
          if (x.hasOwnProperty("updateEditOnClick")) {
            const editButton = document.getElementById(x.updateEditOnClick);
            if (editButton === null) {
              console.log("datagrid editor updateOnClick: could not find ID.");
            } else {
              editButton.addEventListener("click", function (ev) {
                ev.instance.finishEditing();
                ev.instance.blur();
                Shiny.setInputValue(el.id + "_data:datagridEdit", {
                  data: ev.instance.getData(),
                  colnames: x.colnames,
                }, {priority: "event"});
                Shiny.setInputValue(el.id + "_data_filtered:datagridEdit", {
                  data: ev.instance.getFilteredData(),
                  colnames: x.colnames,
                }, {priority: "event"});
              });
            }
          } else {
            grid.on("afterChange", function (ev) { //editingFinish
              Shiny.setInputValue(el.id + "_data:datagridEdit", {
                data: ev.instance.getData(),
                colnames: x.colnames,
              }, {priority: "event"});
              Shiny.setInputValue(el.id + "_data_filtered:datagridEdit", {
                data: ev.instance.getFilteredData(),
                colnames: x.colnames,
              }, {priority: "event"});
            });
          }
        }

        // Drag and drop
        if (HTMLWidgets.shinyMode & (x.dragInput === true)) {
          //var rowDragged = -1;
          grid.on("drag", function (ev) {
            //rowDragged = ev.rowKey + 1;
            Shiny.setInputValue(el.id + "_drag", {
              rowKey: ev.rowKey + 1,
              targetRowKey: ev.targetRowKey + 1,
            }, {priority: "event"});
          });
          grid.on("drop", function (ev) {
            Shiny.setInputValue(el.id + "_drop", {
              rowKey: ev.rowKey + 1,
              targetRowKey: ev.targetRowKey + 1,
            }, {priority: "event"});
            Shiny.setInputValue(el.id + "_data:datagridEdit", {
              data: ev.instance.getData(),
              colnames: x.colnames,
            }, {priority: "event"});
            Shiny.setInputValue(el.id + "_data_filtered:datagridEdit", {
              data: ev.instance.getFilteredData(),
              colnames: x.colnames,
            }, {priority: "event"});
          });
        }
      },

      getWidget: function () {
        return grid;
      },
      getConfig: function () {
        return config;
      },

      resize: function (width, height) {
        if (typeof grid !== "undefined") {
          grid.refreshLayout();
        }
      },
    };
  },
});

ProxyGrid();
