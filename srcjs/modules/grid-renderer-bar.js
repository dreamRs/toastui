import {rescale} from "./utils";

export class DatagridBarRenderer {
  constructor(props) {
    const el = document.createElement("div");
    const barContainer = document.createElement("div");
    const bar = document.createElement("div");
    const label = document.createElement("span");

    const {
      color,
      background,
      label_outside,
      label_width,
      height,
      border_radius
    } = props.columnInfo.renderer.options;

    el.style.display = "flex";
    el.style.alignItems = "center";

    barContainer.style.flexGrow = 1;
    if (label_outside) {
      barContainer.style.marginLeft = "6px";
    } else {
      barContainer.style.marginLeft = "3px";
    }
    barContainer.style.marginRight = "3px";
    barContainer.style.height = height;
    barContainer.style.lineHeight = height;
    barContainer.style.backgroundColor = background;
    barContainer.style.borderRadius = border_radius;

    bar.style.height = "100%";
    bar.style.borderRadius = border_radius;

    if (label_outside) {
      label.style.width = label_width;
    } else {
      label.style.width = 0;
    }
    label.style.textAlign = "right";

    el.appendChild(label);
    barContainer.appendChild(bar);
    el.appendChild(barContainer);

    this.label = label;
    this.bar = bar;
    this.el = el;
    this.render(props);
  }

  getElement() {
    return this.el;
  }

  render(props) {
    const prefix = props.columnInfo.renderer.options.prefix;
    const suffix = props.columnInfo.renderer.options.suffix;
    const from = props.columnInfo.renderer.options.from;
    var barBg = props.columnInfo.renderer.options.bar_bg;
    if (typeof barBg == "object") {
      barBg = barBg[props.rowKey];
    }
    const color = props.columnInfo.renderer.options.color;
    const labelOutside = props.columnInfo.renderer.options.label_outside;
    const to = [0, 100];
    var width = rescale(props.value, from, to);
    this.bar.style.background = barBg;
    this.bar.style.color = color;
    this.bar.style.width = String(width) + "%";
    if (labelOutside) {
      this.label.innerHTML = prefix + String(props.value) + suffix;
    } else {
      this.bar.innerHTML = "&nbsp;" + prefix + String(props.value) + suffix;
    }
  }
}
