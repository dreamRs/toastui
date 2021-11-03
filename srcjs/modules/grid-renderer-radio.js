export class DatagridRadioRenderer {
  constructor(props) {
    const { grid, rowKey } = props;

    const label = document.createElement("label");
    label.className = "datagrid-radio";
    label.setAttribute("for", String(rowKey));

    const hiddenInput = document.createElement("input");
    hiddenInput.className = "datagrid-radio-hidden";
    hiddenInput.id = String(rowKey);
    hiddenInput.style.cursor = "pointer";

    const customInput = document.createElement("span");
    customInput.className = "datagrid-radio-input";
    customInput.style.cursor = "pointer";

    label.appendChild(hiddenInput);
    label.appendChild(customInput);

    hiddenInput.type = "radio";
    hiddenInput.addEventListener("change", () => {
      if (hiddenInput.checked) {
        grid.uncheckAll();
        grid.check(rowKey);
      } else {
        grid.uncheck(rowKey);
      }
    });

    this.el = label;

    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    const hiddenInput = this.el.querySelector(".datagrid-radio-hidden");
    const checked = Boolean(props.value);

    hiddenInput.checked = checked;
  }
}
