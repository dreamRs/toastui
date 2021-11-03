export class DatagridHTMLWidgetsRenderer {
  constructor(props) {
    const el = document.createElement("div");
    const options = props.columnInfo.renderer.options;
    el.style.cssText = options.styles;
    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    var rendered = props.columnInfo.renderer.options.rendered;
    if (typeof rendered == "object") {
      rendered = rendered[props.rowKey];
    }
    this.el.innerHTML = rendered;
    setTimeout(function () {
      window.HTMLWidgets.staticRender();
    }, 10);
  }
}
