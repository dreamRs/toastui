% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grid-row-attributes.R
\name{grid_row_merge}
\alias{grid_row_merge}
\title{Merge rows}
\usage{
grid_row_merge(grid, columns)
}
\arguments{
\item{grid}{A grid created with \code{\link[=datagrid]{datagrid()}}.}

\item{columns}{column(s) in which merge consecutive rows.}
}
\value{
A \code{datagrid} htmlwidget.
}
\description{
Merge rows
}
\examples{
library(toastui)

datagrid(mtcars[order(mtcars$cyl), 1:5]) \%>\%
  grid_row_merge(columns = "cyl")

datagrid(mtcars[, 1:8]) \%>\%
  grid_row_merge(columns = "cyl") \%>\%
  grid_row_merge(columns = "vs")



}
