HTMLWidgets.widget({

  name: "tuigridr",

  type: "output",

  factory: function(el, width, height) {

    var grid;

    return {

      renderValue: function(x) {

        var options = x.options;
        options.el = el;
        console.log(x.data);
        const data = [];
        for (let i = 0; i < x.nrow; i += 1) {
          const row = { };
          for (let j = 0; j < x.ncol; j += 1) {
            row[x.colnames[j]] = x.data[j][i];
          }
          data.push(row);
        }
        console.log(data);
        options.data = data;

        grid = new tui.Grid(options);
        tui.Grid.applyTheme(x.theme, x.themeOptions);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
