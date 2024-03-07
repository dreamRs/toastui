import "widgets";
import * as utils from "./utils";

export function ProxyGrid() {
  if (HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler(
      "proxy-toastui-grid-custom",
      function (obj) {
        var grid = utils.getWidget(obj.id);
        if (typeof grid != "undefined") {
          grid[obj.method].apply(null, obj.config);
          var config = utils.getConfig(obj.id);
          if (config.dataAsInput === true) {
            Shiny.setInputValue(obj.id + "_data:datagridEdit", {
              data: grid.getData(),
              colnames: config.colnames,
            });
          }
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-grid-set-column-values",
      function (obj) {
        var grid = utils.getWidget(obj.id);
        if (typeof grid != "undefined") {
          grid.setColumnValues(
            obj.columnName, 
            obj.columnValue, 
            obj.checkCellState
          );
          var config = utils.getConfig(obj.id);
          if (config.dataAsInput === true) {
            Shiny.setInputValue(obj.id + "_data:datagridEdit", {
              data: grid.getData(),
              colnames: config.colnames,
            });
          }
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-grid-set-row",
      function (obj) {
        var grid = utils.getWidget(obj.id);
        if (typeof grid != "undefined") {
          grid.setRow(
            obj.rowKey, 
            obj.row
          );
          var config = utils.getConfig(obj.id);
          if (config.dataAsInput === true) {
            Shiny.setInputValue(obj.id + "_data:datagridEdit", {
              data: grid.getData(),
              colnames: config.colnames,
            });
          }
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-grid-add-rows",
      function (obj) {
        var grid = utils.getWidget(obj.id);
        if (typeof grid != "undefined") {
          const data = [];
          for (let i = 0; i < obj.data.nrow; i += 1) {
            const row = {};
            for (let j = 0; j < obj.data.ncol; j += 1) {
              row[obj.data.colnames[j]] = obj.data.data[j][i];
            }
            data.push(row);
          }
          grid.appendRows(data, true);
          //console.log(grid);

          var config = utils.getConfig(obj.id);
          if (config.dataAsInput === true) {
            Shiny.setInputValue(obj.id + "_data:datagridEdit", {
              data: grid.getData(),
              colnames: config.colnames,
            });
          }
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-grid-delete-rows",
      function (obj) {
        var grid = utils.getWidget(obj.id);
        if (typeof grid != "undefined") {
          const idx = obj.data.rowKey;
          for (let i = 0; i < idx.length; i += 1) {
            //console.log(idx[i]);
            //console.log(grid);
            grid.removeRow(idx[i]);
          }
          var config = utils.getConfig(obj.id);
          if (config.dataAsInput === true) {
            Shiny.setInputValue(obj.id + "_data:datagridEdit", {
              data: grid.getData(),
              colnames: config.colnames,
            });
          }
        }
      }
    );
  }
}
