
export class DatagridButtonRenderer {
  constructor(props) {
    const el = document.createElement("button");
    const width = props.columnInfo.renderer.options.width;
    const status = props.columnInfo.renderer.options.status;
    el.type = "button";
    el.style.width = width;
    el.style.padding = "5px 0";
    el.style.boxSizing = "border-box";
    el.classList.add("btn");
    el.classList.add("btn-sm");
    el.classList.add("btn-" + status);

    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    var label;
    if (props.columnInfo.renderer.options.hasOwnProperty("label")) {
      label = props.columnInfo.renderer.options.label;
    } else {
      label = String(props.value);
    }
    if (props.columnInfo.renderer.options.hasOwnProperty("icon")) {
      label = props.columnInfo.renderer.options.icon + " " + label;
    }
    const inputId = props.columnInfo.renderer.options.inputId;
    this.el.onclick = function() {
      if (HTMLWidgets.shinyMode) {
        Shiny.setInputValue(inputId, String(props.value));
      }
    };
    this.el.innerHTML = label;
  }
}
