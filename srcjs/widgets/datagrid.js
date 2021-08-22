import 'widgets';
import Grid from 'tui-grid';
import 'tui-grid/dist/tui-grid.min.css';
import 'tui-pagination/dist/tui-pagination.css';
import 'tui-date-picker/dist/tui-date-picker.css';
import 'tui-time-picker/dist/tui-time-picker.css';

import { ProxyGrid } from '../modules/proxy-grid';
import { addStyle } from '../modules/utils';

// Custom renderers

class DatagridBarRenderer {
  constructor(props) {
    const el = document.createElement("div");
    const barContainer = document.createElement("div");
    const bar = document.createElement("div");
    const label = document.createElement("span");

    const {
      color,
      background,
      label_outside,
      label_width,
      height,
      border_radius
    } = props.columnInfo.renderer.options;

    el.style.display = "flex";
    el.style.alignItems = "center";

    barContainer.style.flexGrow = 1;
    if (label_outside) {
      barContainer.style.marginLeft = "6px";
    } else {
      barContainer.style.marginLeft = "3px";
    }
    barContainer.style.marginRight = "3px";
    barContainer.style.height = height;
    barContainer.style.lineHeight = height;
    barContainer.style.backgroundColor = background;
    barContainer.style.borderRadius = border_radius;

    bar.style.height = "100%";
    bar.style.borderRadius = border_radius;

    if (label_outside) {
      label.style.width = label_width;
    } else {
      label.style.width = 0;
    }
    label.style.textAlign = "right";

    el.appendChild(label);
    barContainer.appendChild(bar);
    el.appendChild(barContainer);

    this.label = label;
    this.bar = bar;
    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    const prefix = props.columnInfo.renderer.options.prefix;
    const suffix = props.columnInfo.renderer.options.suffix;
    const from = props.columnInfo.renderer.options.from;
    var barBg = props.columnInfo.renderer.options.bar_bg;
    if (typeof barBg == "object") {
      barBg = barBg[props.rowKey];
    }
    const color = props.columnInfo.renderer.options.color;
    const labelOutside = props.columnInfo.renderer.options.label_outside;
    const to = [0, 100];
    var width = rescale(props.value, from, to);
    this.bar.style.background = barBg;
    this.bar.style.color = color;
    this.bar.style.width = String(width) + "%";
    if (labelOutside) {
      this.label.innerHTML = prefix + String(props.value) + suffix;
    } else {
      this.bar.innerHTML = "&nbsp;" + prefix + String(props.value) + suffix;
    }
  }
}

class DatagridFormatRenderer {
  constructor(props) {
    const el = document.createElement("div");
    el.style.padding = "4px 5px";
    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    var formatted = props.columnInfo.renderer.options.formatted;
    if (typeof formatted == "object") {
      formatted = formatted[props.rowKey];
    }
    this.el.innerHTML = formatted;
  }
}

class DatagridHTMLRenderer {
  constructor(props) {
    const el = document.createElement("div");
    const options = props.columnInfo.renderer.options;
    el.style.cssText = options.styles;
    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    var rendered = props.columnInfo.renderer.options.rendered;
    if (typeof rendered == "object") {
      rendered = rendered[props.rowKey];
    }
    this.el.innerHTML = rendered;
    setTimeout(function() {
      window.HTMLWidgets.staticRender();
    }, 10);
  }
}

class DatagridButtonRenderer {
  constructor(props) {
    const el = document.createElement("button");
    const width = props.columnInfo.renderer.options.width;
    const status = props.columnInfo.renderer.options.status;
    el.type = "button";
    el.style.width = width;
    el.style.padding = "5px 0";
    el.style.boxSizing = "border-box";
    el.classList.add("btn");
    el.classList.add("btn-sm");
    el.classList.add("btn-" + status);

    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    var label;
    if (props.columnInfo.renderer.options.hasOwnProperty("label")) {
      label = props.columnInfo.renderer.options.label;
    } else {
      label = String(props.value);
    }
    if (props.columnInfo.renderer.options.hasOwnProperty("icon")) {
      label = props.columnInfo.renderer.options.icon + " " + label;
    }
    const inputId = props.columnInfo.renderer.options.inputId;
    this.el.onclick = function() {
      if (HTMLWidgets.shinyMode) {
        Shiny.setInputValue(inputId, String(props.value));
      }
    };
    this.el.innerHTML = label;
  }
}

class DatagridRadioRenderer {
  constructor(props) {
    const { grid, rowKey } = props;

    const label = document.createElement("label");
    label.className = "datagrid-radio";
    label.setAttribute("for", String(rowKey));

    const hiddenInput = document.createElement("input");
    hiddenInput.className = "datagrid-radio-hidden";
    hiddenInput.id = String(rowKey);
    hiddenInput.style.cursor = "pointer";

    const customInput = document.createElement("span");
    customInput.className = "datagrid-radio-input";
    customInput.style.cursor = "pointer";

    label.appendChild(hiddenInput);
    label.appendChild(customInput);

    hiddenInput.type = "radio";
    hiddenInput.addEventListener("change", () => {
      if (hiddenInput.checked) {
        grid.uncheckAll();
        grid.check(rowKey);
      } else {
        grid.uncheck(rowKey);
      }
    });

    this.el = label;

    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    const hiddenInput = this.el.querySelector(".datagrid-radio-hidden");
    const checked = Boolean(props.value);

    hiddenInput.checked = checked;
  }
}

class DatagridSliderEditor {
  constructor(props) {
    const el = document.createElement("input");
    const { min, max } = props.columnInfo.editor.options;

    el.type = "range";
    el.min = String(min);
    el.max = String(max);
    el.style.width = "100%";
    el.style.marginTop = "10px";
    el.value = String(props.value);

    this.el = el;
  }

  getElement() {
    return this.el;
  }

  getValue() {
    return this.el.value;
  }

  mounted() {
    this.el.select();
  }
}

class DatagridSliderRenderer {
  constructor(props) {
    const el = document.createElement("input");
    const { min, max } = props.columnInfo.renderer.options;

    el.type = "range";
    el.min = String(min);
    el.max = String(max);
    el.style.width = "100%";
    el.value = String(props.value);
    el.disabled = true;

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

class DatagridRowNamesRenderer {
  constructor(props) {
    const el = document.createElement("span");
    var rowNames = props.columnInfo.renderer.options.rowNames;
    el.innerHTML = rowNames[props.rowKey];
    this.el = el;
  }

  getElement() {
    return this.el;
  }

  render(props) {
    var rowNames = props.columnInfo.renderer.options.rowNames;
    this.el.innerHTML = rowNames[props.rowKey];
  }
}

class DatagridColumnHeaderHTML {
  constructor(props) {
    const columnInfo = props.columnInfo;
    console.log(columnInfo);
    const el = document.createElement("div");
    el.className = "datagrid-header";
    el.style.padding = "0 5px";
    el.style.fontWeight = "normal";
    el.innerHTML = columnInfo.header;
    this.el = el;
  }

  getElement() {
    return this.el;
  }

  render(props) {
    this.el.innerHTML = props.columnInfo.header;
  }
}

class DatagridColumnHeaderSortHTML {
  constructor(props) {
    const columnInfo = props.columnInfo;

    const el = document.createElement("div");
    el.className = "datagrid-header";

    el.style.fontWeight = "normal";
    el.style.cursor = "pointer";
    el.innerHTML = columnInfo.header;

    function findIndex(predicate, arr) {
      for (var i = 0, len = arr.length; i < len; i += 1) {
        if (predicate(arr[i])) {
          return i;
        }
      }
      return -1;
    }
    function findPropIndex(propName, value, arr) {
      return findIndex(function(item) {
        return item[propName] === value;
      }, arr);
    }

    el.addEventListener("click", function(event) {
      event.preventDefault();
      const columnName = props.columnInfo.name;
      const sortState = props.grid.getSortState();
      const columns = sortState.columns;
      const index = findPropIndex("columnName", columnName, columns);
      const ascending = index !== -1 ? !columns[index].ascending : true;
      props.grid.sort(columnName, ascending);
      const asc = el.querySelector(".datagrid-sort-asc");
      const desc = el.querySelector(".datagrid-sort-desc");
      if (ascending) {
        asc.style.display = "inline";
        desc.style.display = "none";
      } else {
        asc.style.display = "none";
        desc.style.display = "inline";
      }
    });

    this.el = el;
  }

  getElement() {
    return this.el;
  }

  render(props) {
    const el = this.el;
    //el.innerHTML = props.columnInfo.header;
  }
}

// HTMLWidgets bindings

HTMLWidgets.widget({
  name: "datagrid",

  type: "output",

  factory: function(el, width, height) {
    var grid;

    return {
      renderValue: function(x) {
        addStyle(".datagrid-sparkline-cell {overflow: visible !important;}");
        var container = document.getElementById(el.id + "-container");
        if (typeof grid !== "undefined") {
          grid.destroy();
          container.innerHTML = "";
        }

        var options = x.options;
        options.el = container;

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
            Shiny.setInputValue(x.cellSelection.id + ":datagridCellSelection", {
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

        // Edit
        if (HTMLWidgets.shinyMode & (x.editorInput === true)) {
          Shiny.setInputValue(el.id + "_data:datagridEdit", {
            data: grid.getData(),
            colnames: x.colnames
          });
          if (x.validationInput === true) {
            Shiny.setInputValue(
              el.id + "_validation:datagridValidation",
              grid.validate()
            );
            grid.on("editingFinish", function(ev) {
              Shiny.setInputValue(
                el.id + "_validation:datagridValidation",
                grid.validate()
              );
            });
          }
          if (x.hasOwnProperty("updateEditOnClick")) {
            const editButton = document.getElementById(x.updateEditOnClick);
            if (editButton === null) {
              console.log("datagrid editor updateOnClick: could not find ID.");
            } else {
              editButton.addEventListener("click", function(event) {
                Shiny.setInputValue(el.id + "_data:datagridEdit", {
                  data: grid.getData(),
                  colnames: x.colnames
                });
              });
            }
          } else {
            grid.on("editingFinish", function(ev) {
              Shiny.setInputValue(el.id + "_data:datagridEdit", {
                data: ev.instance.getData(),
                colnames: x.colnames
              });
            });
          }
        }
      },

      getWidget: function() {
        return grid;
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



ProxyGrid();

