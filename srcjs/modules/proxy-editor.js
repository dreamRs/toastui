import "widgets";
import * as utils from "./utils";

export function ProxyEditor() {
  if (HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler(
      "proxy-toastui-editor-change-preview",
      function (obj) {
        var editor = utils.getWidget(obj.id);
        if (typeof editor != "undefined") {
          editor.changePreviewStyle(obj.data.style);
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-editor-insert-text",
      function (obj) {
        var editor = utils.getWidget(obj.id);
        if (typeof editor != "undefined") {
          editor.insertText(obj.data.text);
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-editor-show",
      function (obj) {
        var editor = utils.getWidget(obj.id);
        if (typeof editor != "undefined") {
          editor.show();
        }
      }
    );
    Shiny.addCustomMessageHandler(
      "proxy-toastui-editor-hide",
      function (obj) {
        var editor = utils.getWidget(obj.id);
        if (typeof editor != "undefined") {
          editor.hide();
        }
      }
    );
  }
}
