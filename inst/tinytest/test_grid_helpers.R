
# Grid's helpers ----------------------------------------------------------

grid_ <- datagrid(rolling_stones_50) %>% grid_selection_cell(inputId = "ID")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_click(inputId = "ID")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_col_button(column = "Album", inputId = "ID")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_colorbar(column = "Year")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_columns(align = "center")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_columns_opts(minWidth = 200)
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_complex_header("New header" = c("Album", "Artist"))
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_editor(column = "Artist", type = "text")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_editor_date(column = "Year", format = "yyyy", type = "year")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_editor_opts(editingEvent = "click")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_filters(columns = "Year", showApplyBtn = TRUE)
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% 
  grid_format("Year", function(x) paste("Year", x))
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_header(align = "center")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_row_merge(columns = "Artist")
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% grid_selection_row(inputId = "ID")
expect_inherits(grid_, "datagrid")


# grid_ <- datagrid(rolling_stones_50) %>% grid_sparkline()
# expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% 
  grid_style_cell(
    Year > 1980,
    column = "Year",
    background = "#F781BE",
    fontWeight = "bold"
  )
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% 
  grid_style_cells(
    fun = ~ . > 1980,
    columns = "Year",
    background = "#053061",
    color = "#FFF"
  )
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% 
  grid_style_column(
    column = "Year",
    background = ifelse(Year < 1980, "white", "black"),
    fontWeight = "bold",
    color = ifelse(Year > 1980, "white", "black")
  )
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>%
  grid_style_row(
    Year > 1980,
    background = "#F781BE"
  )
expect_inherits(grid_, "datagrid")


grid_ <- datagrid(rolling_stones_50) %>% 
  grid_summary("Year", "sum")
expect_inherits(grid_, "datagrid")



# theme -------------------------------------------------------------------

set_grid_theme(selection.background = "TEST")
theme <- getOption("datagrid.theme")
expect_inherits(theme, "list")
expect_identical(theme$selection$background, "TEST")
reset_grid_theme()
expect_true(length(getOption("datagrid.theme")) < 1)



# language ----------------------------------------------------------------

set_grid_lang(display.noData = "TEST")
lang <- getOption("datagrid.language.options")
expect_inherits(lang, "list")
expect_identical(lang$display$noData, "TEST")