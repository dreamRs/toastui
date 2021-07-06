library(toastui)

# Change text displayed when no data in grid
set_grid_lang(display.noData = "Pas de donn\u00e9es")
datagrid(data.frame())

# change text for filters
set_grid_lang(
  # Text
  filter.contains = "Contient",
  filter.eq = "Egal \u00e0",
  filter.ne = "Diff\u00e9rent de",
  filter.start = "Commence par",
  filter.end = "Fini par",
  # Date
  filter.after = "Apr\u00e8s",
  filter.afterEq = "Apr\u00e8s ou \u00e9gal \u00e0",
  filter.before = "Avant",
  filter.beforeEq = "Avant ou \u00e9gal \u00e0",
  # Buttons
  filter.apply = "Appliquer",
  filter.clear = "Supprimer",
  # Select
  filter.selectAll = "Tout s\u00e9lectionner"
)

datagrid(rolling_stones_50) %>% 
  grid_filters(
    columns = "Artist", 
    type = "text",
    showApplyBtn = TRUE,
    showClearBtn = TRUE
  ) %>% 
  grid_filters(
    columns = "Genre", 
    type = "select"
  ) %>% 
  grid_filters(
    columns = "Year", 
    type = "date"
  )
