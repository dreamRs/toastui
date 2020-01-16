HTMLWidgets.widget({

  name: "tuigridr",

  type: "output",

  factory: function(el, width, height) {

    var grid;

    return {

      renderValue: function(x) {

        var options = x.options;
        options.el = el;

        grid = new tui.Grid(options);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
