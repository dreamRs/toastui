HTMLWidgets.widget({

  name: "tuigridr",

  type: "output",

  factory: function(el, width, height) {

    const grid = new tui.Grid({el: el, columns: [], data: []});

    return {

      renderValue: function(x) {

        grid.setColumns(x.columns);
        grid.resetData(x.data);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
