import "widgets";
import Editor from '@toast-ui/editor';
import '@toast-ui/editor/dist/toastui-editor.css'; 
import { ProxyEditor } from "../modules/proxy-editor";

HTMLWidgets.widget({
  name: "editor",
  
  type: "output",
  
  factory: function (el, width, height) {
    var editor;
    
    return {
      renderValue: function (x) {
        var options = x.options;
        options.el = document.getElementById(el.id + "-editor");
        editor = new Editor(options);
        if (x.getMarkdownOnChange) {
          editor.on("change", function() {
            Shiny.setInputValue(el.id + "_markdown", editor.getMarkdown());
          });
        }
        if (x.getHTMLOnChange) {
          editor.on("change", function() {
            Shiny.setInputValue(el.id + "_html", editor.getHTML());
          });
        }
      },
      
      getWidget: function () {
        return editor;
      },
      
      resize: function (width, height) {
      },
    };
  },
});


ProxyEditor();
