
library(toastui)
library(shiny)

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5L),
  tags$h2("Checkbox column grid demo"),
  tags$script(HTML(
    'class DatagridCheckboxRenderer {
  constructor(props) {
    const el = document.createElement("div");
    el.className = "form-check form-switch my-1 d-flex justify-content-center";
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
'
  )),
  fluidRow(
    column(
      width = 8,
      datagridOutput("grid1"),
      verbatimTextOutput("edited1")
    )
  )
)

server <- function(input, output, session) {
  
  output$grid1 <- renderDatagrid({
    mydata <- data.frame(
      month = month.name,
      value = sample(c(TRUE, FALSE), 12, replace = TRUE)
    )
    grid <- datagrid(mydata, data_as_input = TRUE)
    # grid$x$options$editingEvent <- "click"
    grid %>%
      grid_columns(
        columns = "value",
        # editor = list(
        #   type = htmlwidgets::JS("DatagridCheckboxRenderer"),
        #   options = list()
        # ),
        renderer = list(
          type = htmlwidgets::JS("DatagridCheckboxRenderer"),
          options = list()
        )
      )
    
  })
  
  output$edited1 <- renderPrint({
    input$grid1_data
  })
  
}

if (interactive())
  shinyApp(ui, server)

