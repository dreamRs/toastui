import 'widgets';
import Chart from '@toast-ui/chart';
import '@toast-ui/chart/dist/toastui-chart.min.css';

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
        if (typeof chart !== "undefined") {
          chart.destroy();
        }
        chart = Chart[type]({ el, data, options });
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

