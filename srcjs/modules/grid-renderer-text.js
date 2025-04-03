export class DatagridTextInputRenderer {
  constructor(props) {
    const el = document.createElement("div");
    const classEl = props.columnInfo.renderer.options.class;
    el.className = classEl;
    const input = document.createElement("input");
    const { grid, rowKey, columnInfo } = props;
    const value = String(props.value);
    input.type = "text";
    input.className = "form-check-input";
    input.style.width = "100%";
    input.value = value;
    input.addEventListener("change", () => {
      grid.setValue(rowKey, columnInfo.name, input.value);
    });
    el.appendChild(input);
    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    //const checked = Boolean(props.value);
    //this.el.checked = checked;
  }
}
