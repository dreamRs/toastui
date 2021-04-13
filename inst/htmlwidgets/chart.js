/*!
 * HTMLwidget for TOAST UI Chart
 * @author Victor Perrier
 */

/*jshint
  esversion: 6
*/
/*global toastui, HTMLWidgets, Shiny */

HTMLWidgets.widget({
  name: "chart",

  type: "output",

  factory: function(el, width, height) {
    var chart;

    return {
      renderValue: function(x) {
        var type = x.config.type;
        var data = x.config.data;
        var options = x.config.options;
        chart = toastui.Chart[type]({ el, data, options });
      },

      getWidget: function() {
        return chart;
      },

      resize: function(width, height) {
        /*
        chart.updateOptions({
          chart: {width: width, height: height}
        });
        */
      }
    };
  }
});

