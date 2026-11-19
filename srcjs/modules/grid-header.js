export class DatagridColumnHeaderHTML {
  constructor(props) {
    const columnInfo = props.columnInfo;
    console.log(columnInfo);
    const el = document.createElement("div");
    el.className = "datagrid-header";
    el.style.padding = "0 5px";
    el.style.fontWeight = "normal";
    el.innerHTML = columnInfo.header;
    this.el = el;
  }

  getElement() {
    return this.el;
  }

  render(props) {
    this.el.innerHTML = props.columnInfo.header;
  }
}

export class DatagridColumnHeaderShiny {
  constructor(props) {
    this.el = document.createElement("div");
    this.header = props.columnInfo.header;
    this.mounted_ = false;
    this.destroyed = false;
    this.queue = Promise.resolve();
  }

  getElement() {
    return this.el;
  }

  mounted() {
    this.mounted_ = true;
    this.update();
  }

  render(props) {
    if (props.columnInfo.header !== this.header) {
      this.header = props.columnInfo.header;
      if (this.mounted_) this.update();
    }
  }

  update() {
    const header = this.header;
    this.queue = this.queue.then(async () => {
      if (this.destroyed || header !== this.header) return;

      Shiny.unbindAll(this.el);
      this.el.innerHTML = header;
      Shiny.initializeInputs(this.el);

      try {
        await Shiny.bindAll(this.el);
      } finally {
        if (this.destroyed) Shiny.unbindAll(this.el);
      }
    });
  }

  beforeDestroy() {
    this.destroyed = true;
    Shiny.unbindAll(this.el);
  }
}


export class DatagridColumnHeaderSortHTML {
  constructor(props) {
    const columnInfo = props.columnInfo;

    const el = document.createElement("div");
    el.className = "datagrid-header";

    el.style.fontWeight = "normal";
    el.style.cursor = "pointer";
    el.innerHTML = columnInfo.header;

    function findIndex(predicate, arr) {
      for (var i = 0, len = arr.length; i < len; i += 1) {
        if (predicate(arr[i])) {
          return i;
        }
      }
      return -1;
    }
    function findPropIndex(propName, value, arr) {
      return findIndex(function (item) {
        return item[propName] === value;
      }, arr);
    }

    el.addEventListener("click", function (event) {
      event.preventDefault();
      const columnName = props.columnInfo.name;
      const sortState = props.grid.getSortState();
      const columns = sortState.columns;
      const index = findPropIndex("columnName", columnName, columns);
      const ascending = index !== -1 ? !columns[index].ascending : true;
      props.grid.sort(columnName, ascending);
      const asc = el.querySelector(".datagrid-sort-asc");
      const desc = el.querySelector(".datagrid-sort-desc");
      if (ascending) {
        asc.style.display = "inline";
        desc.style.display = "none";
      } else {
        asc.style.display = "none";
        desc.style.display = "inline";
      }
    });

    this.el = el;
  }

  getElement() {
    return this.el;
  }

  render(props) {
    const el = this.el;
    //el.innerHTML = props.columnInfo.header;
  }
}
