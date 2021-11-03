export class DatagridSliderEditor {
  constructor(props) {
    const el = document.createElement("input");
    const { min, max } = props.columnInfo.editor.options;

    el.type = "range";
    el.min = String(min);
    el.max = String(max);
    el.style.width = "100%";
    el.style.marginTop = "10px";
    el.value = String(props.value);

    this.el = el;
  }

  getElement() {
    return this.el;
  }

  getValue() {
    return this.el.value;
  }

  mounted() {
    this.el.select();
  }
}
