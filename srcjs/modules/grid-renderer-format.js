export class DatagridFormatRenderer {
  constructor(props) {
    const el = document.createElement("div");
    el.style.padding = "4px 5px";
    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    var formatted = props.columnInfo.renderer.options.formatted;
    if (typeof formatted == "object") {
      formatted = formatted[props.rowKey];
    }
    this.el.innerHTML = formatted;
  }
}
