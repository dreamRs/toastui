HTMLWidgets.widget({
  name: "tuigridr",

  type: "output",

  factory: function(el, width, height) {
    var grid;

    return {
      renderValue: function(x) {
        if (typeof grid !== "undefined") {
          grid.destroy();
          el.innerHTML = "";
        }

        var options = x.options;
        options.el = el;

        // Construct data (put back names)
        const data = [];
        for (let i = 0; i < x.nrow; i += 1) {
          const row = {};
          for (let j = 0; j < x.ncol; j += 1) {
            row[x.colnames[j]] = x.data[j][i];
          }
          data.push(row);
        }
        options.data = data;

        // Generate the grid
        grid = new tui.Grid(options);
        tui.Grid.applyTheme(x.theme, x.themeOptions);

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

        // Selection
        if (x.hasOwnProperty("rowSelection") & HTMLWidgets.shinyMode) {
          grid.on("check", function(ev) {
            Shiny.setInputValue(x.rowSelection.id + ":tuigridrRowSelection", {
              selected: grid.getCheckedRows(),
              colnames: x.colnames,
              returnValue: x.rowSelection.returnValue
            });
          });
          grid.on("uncheck", function(ev) {
            Shiny.setInputValue(x.rowSelection.id + ":tuigridrRowSelection", {
              selected: grid.getCheckedRows(),
              colnames: x.colnames,
              returnValue: x.rowSelection.returnValue
            });
          });
        }
        if (x.hasOwnProperty("cellSelection") & HTMLWidgets.shinyMode) {
          grid.on("click", function(ev) {
            Shiny.setInputValue(x.cellSelection.id + ":tuigridrCellSelection", {
              selected: grid.getSelectionRange(),
              colnames: x.colnames,
              returnValue: x.cellSelection.returnValue
            });
          });
        }
      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});

function addStyle(styles) {
  var css = document.createElement("style");
  css.type = "text/css";
  if (css.styleSheet) {
    css.styleSheet.cssText = styles;
  } else {
    css.appendChild(document.createTextNode(styles));
  }
  document.getElementsByTagName("head")[0].appendChild(css);
}



