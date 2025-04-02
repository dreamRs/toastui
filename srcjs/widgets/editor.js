import "widgets";
import Editor from '@toast-ui/editor';
import '@toast-ui/editor/dist/toastui-editor.css'; 

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
      },
      
      getWidget: function () {
        return editor;
      },
      
      resize: function (width, height) {
      },
    };
  },
});
