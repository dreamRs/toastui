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
        const data = [];
        for (let i = 0; i < x.nrow; i += 1) {
          const row = { };
          for (let j = 0; j < x.ncol; j += 1) {
            row[x.colnames[j]] = x.data[j][i];
          }
          data.push(row);
        }
        options.data = data;

        grid = new tui.Grid(options);
        tui.Grid.applyTheme(x.theme, x.themeOptions);

        /*
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
          console.log(x.rowClass);
          for (let i = 0; i < x.rowClass.length; i += 1) {
            console.log(x.rowClass[i].styles);
            addStyle(x.rowClass[i].styles);
            for (let j = 0; j < x.rowClass[i].rowKey.length; j += 1) {
              grid.addRowClassName(
                x.rowClass[i].rowKey[j],
                x.rowClass[i].class
              );
            }
          }
        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});


function addStyle(styles) {
  var css = document.createElement('style');
  css.type = 'text/css';
  if (css.styleSheet) {
    css.styleSheet.cssText = styles;
  } else {
    css.appendChild(document.createTextNode(styles));
  }
  document.getElementsByTagName("head")[0].appendChild(css);
}


