## code to prepare `met_paris` dataset goes here

library(data.table)
library(stationaRy)
library(lubridate)

# stations <- get_station_metadata()

# Le Bourget: 071500-99999

met_paris <- get_met_data(
  station_id = "071500-99999",
  years = 2020
)
setDT(met_paris)
met_paris <- met_paris[, list(
  temp = mean(temp, na.rm = TRUE),
  rh = mean(rh, na.rm = TRUE)
), by = list(
  month = month.name[month(time)],
  date = as_date(time)
)]

# met_paris <- met_paris[, list(data = list(.SD)), by = month]
met_paris_nest <- met_paris[, list(
  temp = list(.SD[, list(date, temp)]),
  rh = list(.SD[, list(date, rh)])
), by = month]


# Use
met_paris <- as.data.frame(met_paris_nest)
met_paris$temp <- lapply(met_paris$temp, as.data.frame)
met_paris$rh <- lapply(met_paris$rh, as.data.frame)
usethis::use_data(met_paris)



# Test --------------------------------------------------------------------

library(toastui)
library(apexcharter)
datagrid(met_paris) %>%
  grid_complex_header(
    "Le Bourget meteorological data" = names(met_paris_nest)
  ) %>%
  grid_columns(
    vars = "month", width = 150
  ) %>%
  grid_sparkline(
    column = "temp",
    renderer = function(data) {
      apex(data, aes(date, temp), type = "area") %>%
        ax_chart(sparkline = list(enabled = TRUE)) %>%
        ax_yaxis(min = -5, max = 30)
    }
  ) %>%
  grid_sparkline(
    column = "rh",
    renderer = function(data) {
      apex(data, aes(date, rh), type = "column") %>%
        ax_chart(sparkline = list(enabled = TRUE)) %>%
        ax_yaxis(min = 0, max = 100)
    }
  )




library(highcharter)
datagrid(met_paris_nest) %>%
  grid_complex_header(
    "Le Bourget climate data" = names(met_paris_nest)
  ) %>%
  grid_columns(
    vars = "month", width = 150
  ) %>%
  grid_sparkline(
    column = "temp",
    renderer = function(data) {
      hchart(data, type = "area", hcaes(date, temp)) %>%
        hc_add_theme(hc_theme_sparkline()) %>%
        hc_yAxis(min = -5, max = 30)
    }
  ) %>%
  grid_sparkline(
    column = "rh",
    renderer = function(data) {
      hchart(data, type = "column", hcaes(date, rh)) %>%
        hc_add_theme(hc_theme_sparkline()) %>%
        hc_yAxis(min = 0, max = 100)
    }
  )
