
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
        renderer = JS("datagrid.header.htmlsort")
      )
    )
  )


library(toastui)
library(htmltools)
# set_grid_theme(cell.summary.background = "#E6E7E7", cell.summary.showHorizontalBorder = TRUE)
datagrid(ps3_games[, c(1, 3, 5, 6, 7, 8)], colwidths = "guess", theme = "striped") %>%
  grid_summary(
    column = "Name",
    js_function = JS(
      "function(value) {",
      # "return \"<span style='font-style: italic;'>character</span>\";",
      sprintf(
        "return '%s';",
        gsub(replacement = "", pattern = "\n", x = htmltools::doRenderTags(
          tags$div(
            style = css(padding = "5px 0"),
            tags$div(
              style = css(fontStyle = "italic"),
              phosphoricons::ph("text-aa"),
              "character"
            ),
            tags$hr(),
            tags$div(
              "Unique:", length(unique(ps3_games$Name))
            ),
            tags$div(
              "Missing:", sum(is.na(ps3_games$Name))
            ),
            tags$div(
              style = css(whiteSpace = "normal", wordBreak = "break-all"),
              "Most Common:", gsub(
                pattern = "'",
                replacement = "\u07F4",
                x = names(sort(table(ps3_games$Name), decreasing = TRUE))[1]
              )
            ),
            tags$div(
              "\u00A0"
            )
          )
        ))
      ),
      "}"
    ),
    position = "top"
  ) %>%
  grid_summary(
    column = "Genre",
    js_function = JS(
      "function(value) {",
      # "return \"<span style='font-style: italic;'>character</span>\";",
      sprintf(
        "return '%s';",
        gsub(replacement = "", pattern = "\n", x = htmltools::doRenderTags(
          tags$div(
            style = css(padding = "5px 0"),
            tags$div(
              style = css(fontStyle = "italic"),
              phosphoricons::ph("text-aa"),
              "character"
            ),
            tags$hr(),
            tags$div(
              "Unique:", length(unique(ps3_games$Genre))
            ),
            tags$div(
              "Missing:", sum(is.na(ps3_games$Genre))
            ),
            tags$div(
              "Most Common:", names(sort(table(ps3_games$Genre), decreasing = TRUE))[1]
            ),
            tags$div(
              "\u00A0"
            )
          )
        ))
      ),
      "}"
    ),
    position = "top"
  ) %>%
  grid_summary(
    column = "NA_Sales",
    js_function = JS(
      "function(value) {",
      sprintf(
        "return '%s';",
        gsub(replacement = "", pattern = "\n", x = htmltools::doRenderTags(
          tags$div(
            style = css(padding = "5px 0"),
            tags$div(
              style = css(fontStyle = "italic"),
              phosphoricons::ph("hash"),
              "numeric"
            ),
            tags$hr(),
            tags$div(
              "Min:", min(ps3_games$NA_Sales, na.rm = TRUE)
            ),
            tags$div(
              "Mean:", mean(ps3_games$NA_Sales, na.rm = TRUE)
            ),
            tags$div(
              "Max:", max(ps3_games$NA_Sales, na.rm = TRUE)
            ),
            tags$div(
              "Missing:", sum(is.na(ps3_games$NA_Sales))
            )
          )
        ))
      ),
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
