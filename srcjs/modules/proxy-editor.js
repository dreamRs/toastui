import "widgets";
import * as utils from "./utils";

export function ProxyEditor() {
  if (HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler("proxy-toastui-editor-get-markdown", function (obj) {
      var editor = utils.getWidget(obj.id);
      Shiny.setInputValue(obj.id + "_markdown", editor.getMarkdown());
    });
  }
}
