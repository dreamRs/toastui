import "widgets";

// From Friss tuto (https://github.com/FrissAnalytics/shinyJsTutorials/blob/master/tutorials/tutorial_03.Rmd)
export function getWidget(id) {
  // Get the HTMLWidgets object
  var htmlWidgetsObj = HTMLWidgets.find("#" + id);

  // Use the getWidget method we created to get the underlying widget
  var widgetObj;

  if (typeof htmlWidgetsObj != "undefined") {
    widgetObj = htmlWidgetsObj.getWidget();
  }

  return widgetObj;
}

export function getConfig(id) {
  var htmlWidgetsObj = HTMLWidgets.find("#" + id);
  var configObj;
  if (typeof htmlWidgetsObj != "undefined") {
    configObj = htmlWidgetsObj.getConfig();
  }
  return configObj;
}

export function addStyle(styles) {
  var css = document.createElement("style");
  css.type = "text/css";
  if (css.styleSheet) {
    css.styleSheet.cssText = styles;
  } else {
    css.appendChild(document.createTextNode(styles));
  }
  document.getElementsByTagName("head")[0].appendChild(css);
}

export function rescale(x, from, to) {
  return ((x - from[0]) / (from[1] - from[0])) * (to[1] - to[0]) + to[0];
}
