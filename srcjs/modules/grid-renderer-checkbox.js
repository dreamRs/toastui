export class DatagridCheckboxRenderer {
  constructor(props) {
    const el = document.createElement("div");
    const classEl = props.columnInfo.renderer.options.class;
    el.className = classEl;
    const input = document.createElement("input");
    const { grid, rowKey, columnInfo } = props;
    const checked = Boolean(props.value);
    input.type = "checkbox";
    input.className = "form-check-input";
    input.style.cursor = "pointer";
    input.checked = checked;
    input.addEventListener("change", () => {
      if (input.checked) {
        grid.setValue(rowKey, columnInfo.name, "TRUE");
      } else {
        grid.setValue(rowKey, columnInfo.name, "FALSE");
      }
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
