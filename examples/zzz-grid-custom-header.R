
library(toastui)
datagrid(iris) %>% 
  grid_columns(
    columns = "Sepal.Length"
    # , header = "truc</br><span style='font-weight:normal;'>bidule</span><a class='tui-grid-btn-sorting'></a>"
    , header = "character"
  ) %>% 
  grid_header(
    height = 80,
    complexColumns = list(
      list(
        # header = "truc</br><span style='font-weight:normal;'>bidule</span>",
        header = "Truc",
        name = "truc",
        headerAlign = "left",
        childNames = list("Sepal.Length")
        # renderer = JS("DatagridColumnHeaderHTML")
      )
    ),
    columns = list(
      list(
        name = "Sepal.Length",
        align = "left"#,
        # renderer = JS("DatagridColumnHeaderHTML"),
      )
    )
  )

library(toastui)
library(htmltools)
datagrid(mtcars, theme = "striped", colwidths = "guess") %>% 
  grid_columns(
    columns = "mpg",
    minWidth = (toastui:::maxnchar("Miles/(US) gallon")*1.3+10)*4,
    header = tags$div(
      style = "position: relative; height: 60px; padding: 5px;",
      tags$b("Miles/(US) gallon"),
      tags$br(),
      tags$i("numeric"),
      tags$div(
        style = "position: absolute; right: 5px; bottom: 5px;",
        phosphoricons::ph("sort-asc", class = "datagrid-sort-asc", style = "display: none;"),
        phosphoricons::ph("sort-desc", class = "datagrid-sort-desc", style = "display: none;")
      )
    )
  ) %>% 
  grid_header(
    height = 70,
    columns = list(
      list(
        name = "mpg",
        align = "left",
        renderer = JS("DatagridColumnHeaderSortHTML")
      )
    )
  )



datagrid(ps3_games[, c(1, 5, 6, 7, 8)], colwidths = "guess", theme = "striped") %>% 
  grid_summary(
    column = "Name",
    js_function = JS(
      "function(value) {",
      # "return \"<span style='font-style: italic;'>character</span>\";",
      sprintf("return '%s<span style=\"font-style: italic; margin-left: 5px;\">character</span>';", gsub("\n", "", htmltools::doRenderTags(phosphoricons::ph("text-aa")))),
      "}"
    ),
    position = "top"
  ) %>% 
  grid_summary(
    column = "NA_Sales",
    js_function = JS(
      "function(value) {",
      sprintf("return '%s<span style=\"font-style: italic; margin-left: 5px;\">numeric</span>';", gsub("\n", "", htmltools::doRenderTags(phosphoricons::ph("hash")))),
      "}"
    ),
    position = "top"
  )%>% 
  grid_summary(
    column = "EU_Sales",
    js_function = JS(
      "function(value) {",
      sprintf("return '%s<span style=\"font-style: italic; margin-left: 5px;\">numeric</span>';", gsub("\n", "", htmltools::doRenderTags(phosphoricons::ph("hash")))),
      "}"
    ),
    position = "top"
  )
