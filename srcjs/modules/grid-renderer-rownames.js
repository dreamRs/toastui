
export class DatagridRowNamesRenderer {
  constructor(props) {
    const el = document.createElement("span");
    var rowNames = props.columnInfo.renderer.options.rowNames;
    el.innerHTML = rowNames[props.rowKey];
    this.el = el;
  }

  getElement() {
    return this.el;
  }

  render(props) {
    var rowNames = props.columnInfo.renderer.options.rowNames;
    this.el.innerHTML = rowNames[props.rowKey];
  }
}
