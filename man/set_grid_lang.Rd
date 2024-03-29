% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grid-language.R
\name{set_grid_lang}
\alias{set_grid_lang}
\title{Set grid language options}
\usage{
set_grid_lang(
  display.noData = "No data",
  display.loadingData = "Loading data...",
  display.resizeHandleGuide = "You can change the width... [truncated]",
  filter.contains = "Contains",
  filter.eq = "Equals",
  filter.ne = "Not equals",
  filter.start = "Starts with",
  filter.end = "Ends with",
  filter.after = "After",
  filter.afterEq = "After or Equal",
  filter.before = "Before",
  filter.beforeEq = "Before or Equal",
  filter.apply = "Apply",
  filter.clear = "Clear",
  filter.selectAll = "Select All"
)
}
\arguments{
\item{display.noData, display.loadingData, display.resizeHandleGuide}{Display language options.}

\item{filter.contains, filter.eq, filter.ne, filter.start, filter.end, filter.after, filter.afterEq, filter.before, filter.beforeEq, filter.apply, filter.clear, filter.selectAll}{Filter language options.}
}
\value{
No return value.
}
\description{
Set grid language options
}
\examples{
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

datagrid(rolling_stones_50) \%>\% 
  grid_filters(
    columns = "Artist", 
    type = "text",
    showApplyBtn = TRUE,
    showClearBtn = TRUE
  ) \%>\% 
  grid_filters(
    columns = "Genre", 
    type = "select"
  ) \%>\% 
  grid_filters(
    columns = "Year", 
    type = "date"
  )
}
