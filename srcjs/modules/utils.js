import 'widgets';

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
