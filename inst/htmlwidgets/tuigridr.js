
function rescale(x, from, to) {
  return (x - from[0])/(from[1] - from[0]) * (to[1] - to[0]) + to[0];
}


class CustomBarRenderer {
  constructor(props) {
    const el = document.createElement("div");
    const bar = document.createElement("div");

    const { bar_bg, color, background } = props.columnInfo.renderer.options;

    el.style.background = background;
    el.style.margin = "0 5px 0 5px";

    bar.style.background = bar_bg;
    bar.style.color = color;
    bar.style.height = "20px";
    bar.style.lineHeight = "20px";
    bar.style.paddingLeft = "3px";
    bar.style.minWidth = "6px";
    bar.style.fontWeight = "bold";

    el.appendChild(bar);

    this.bar = bar;
    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    const from = props.columnInfo.renderer.options.from;
    const to = [0, 100];
    var width = rescale(props.value, from, to);
    this.bar.style.width = String(width) + "%";
    this.bar.innerHTML = String(props.value);
  }
}

class CustomSliderRenderer {
  constructor(props) {
    const el = document.createElement('input');
    const { min, max } = props.columnInfo.renderer.options;

    el.type = 'range';
    el.min = String(min);
    el.max = String(max);

    el.addEventListener('mousedown', (ev) => {
      ev.stopPropagation();
    });

    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    this.el.value = String(props.value);
  }
}

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
        options.el = document.getElementById(el.id + "-container");

        var rowAttributes = x.rowAttributes;

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
            console.log(rowAttributes[i]);
            row._attributes = rowAttributes[i];
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
        // Styles for cells
        if (x.hasOwnProperty("cellsClass")) {
          console.log(x.cellsClass);
          for (let i = 0; i < x.cellsClass.length; i += 1) {
            console.log(x.cellsClass[i].styles);
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
            Shiny.setInputValue(x.rowSelection.id + ":tuigridrRowSelection", {
              selected: grid.getCheckedRows(),
              colnames: x.colnames,
              returnValue: x.rowSelection.returnValue
            });
          }
          grid.on("checkAll", rowSelection);
          grid.on("uncheckAll", rowSelection);
          grid.on("check", rowSelection);
          grid.on("uncheck", rowSelection);
        }
        if (x.hasOwnProperty("cellSelection") & HTMLWidgets.shinyMode) {
          grid.on("selection", function(ev) {
            Shiny.setInputValue(x.cellSelection.id + ":tuigridrCellSelection", {
              selected: grid.getSelectionRange(),
              colnames: x.colnames,
              returnValue: x.cellSelection.returnValue
            });
          });
        }
        if (x.hasOwnProperty("clickEvent") & HTMLWidgets.shinyMode) {
          grid.on("click", function(ev) {
            Shiny.setInputValue(x.clickEvent.id, {
              row: ev.rowKey + 1,
              col: ev.columnName
            });
          });
        }
      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
        if (typeof grid !== "undefined") {
          grid.refreshLayout();
        }
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

