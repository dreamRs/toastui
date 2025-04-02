import "widgets";
import Editor from '@toast-ui/editor';
import '@toast-ui/editor/dist/toastui-editor.css'; 
import { ProxyEditor } from "../modules/proxy-editor";

import '@toast-ui/editor/dist/i18n/ar';
import '@toast-ui/editor/dist/i18n/zh-cn';
import '@toast-ui/editor/dist/i18n/zh-tw';
import '@toast-ui/editor/dist/i18n/hr-hr';
import '@toast-ui/editor/dist/i18n/cs-cz';
import '@toast-ui/editor/dist/i18n/nl-nl';
import '@toast-ui/editor/dist/i18n/en-us';
import '@toast-ui/editor/dist/i18n/fi-fi';
import '@toast-ui/editor/dist/i18n/fr-fr';
import '@toast-ui/editor/dist/i18n/gl-es';
import '@toast-ui/editor/dist/i18n/de-de';
import '@toast-ui/editor/dist/i18n/it-it';
import '@toast-ui/editor/dist/i18n/ja-jp';
import '@toast-ui/editor/dist/i18n/ko-kr';
import '@toast-ui/editor/dist/i18n/nb-no';
import '@toast-ui/editor/dist/i18n/pl-pl';
import '@toast-ui/editor/dist/i18n/pt-br';
import '@toast-ui/editor/dist/i18n/ru-ru';
import '@toast-ui/editor/dist/i18n/es-es';
import '@toast-ui/editor/dist/i18n/sv-se';
import '@toast-ui/editor/dist/i18n/tr-tr';
import '@toast-ui/editor/dist/i18n/uk-ua';

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
