export class DatagridSliderRenderer {
  constructor(props) {
    const el = document.createElement("div");
    const { min, max, step } = props.columnInfo.renderer.options;

    const input = document.createElement("input");
    input.type = "range";
    input.className = "form-range";
    input.min = String(min);
    input.max = String(max);
    input.step = String(step);
    input.style.width = "100%";
    input.value = String(props.value);
    //el.disabled = true;

    input.addEventListener("input", (event) => {
      grid.setValue(rowKey, columnInfo.name, event.target.value);
      event.preventDefault();
    });

    el.appendChild(input);
    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    //this.el.value = String(props.value);
  }
}
