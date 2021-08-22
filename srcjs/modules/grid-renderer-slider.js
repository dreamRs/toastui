export class DatagridSliderRenderer {
  constructor(props) {
    const el = document.createElement("input");
    const { min, max } = props.columnInfo.renderer.options;

    el.type = "range";
    el.min = String(min);
    el.max = String(max);
    el.style.width = "100%";
    el.value = String(props.value);
    el.disabled = true;

    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    this.el.value = String(props.value);
  }
}
