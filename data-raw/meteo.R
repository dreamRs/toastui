## code to prepare `` dataset goes here

library(data.table)
library(stationaRy)
library(lubridate)

# stations <- get_station_metadata()


# Le Bourget: 071500-99999 ------------------------------------------------

met_paris <- get_met_data(
  station_id = "071500-99999",
  years = 2020
)
setDT(met_paris)
met_paris <- met_paris[, list(
  temp = mean(temp, na.rm = TRUE),
  temp_min = min(temp, na.rm = TRUE),
  temp_max = max(temp, na.rm = TRUE)
), by = list(
  month = month.name[month(time)],
  date = as_date(time)
)]

# met_paris <- met_paris[, list(data = list(.SD)), by = month]
met_paris_nest <- met_paris[, list(
  temp_min = min(temp, na.rm = TRUE),
  temp_max = max(temp, na.rm = TRUE),
  temp = list(.SD[, list(date, temp)])
), by = month]




# MONASTIR-SKANES: 607400-99999 -------------------------------------------

met_monastir <- get_met_data(
  station_id = "607400-99999",
  years = 2020
)
setDT(met_monastir)
met_monastir <- met_monastir[, list(
  temp = mean(temp, na.rm = TRUE),
  temp_min = min(temp, na.rm = TRUE),
  temp_max = max(temp, na.rm = TRUE)
), by = list(
  month = month.name[month(time)],
  date = as_date(time)
)]

met_monastir_nest <- met_monastir[, list(
  temp_min = min(temp, na.rm = TRUE),
  temp_max = max(temp, na.rm = TRUE),
  temp = list(.SD[, list(date, temp)])
), by = month]



# Merge -------------------------------------------------------------------

meteo <- merge(
  x = met_paris_nest,
  y = met_monastir_nest,
  by = "month", 
  suffixes = c("_paris", "_monastir"), 
  sort = FALSE
)
meteo
vars <- grep("^temp_(min|max)", names(meteo), value = TRUE)
meteo[, (vars) := lapply(.SD, round, 1), .SDcols = vars]



# Grid --------------------------------------------------------------------

library(toastui)
library(apexcharter)
library(scales)

datagrid(meteo) %>%
  grid_complex_header(
    "Paris" = grep("_paris$", names(meteo), value = TRUE),
    "Monastir" = grep("_monastir$", names(meteo), value = TRUE)
  ) %>%
  grid_columns(
    vars = "month", 
    header = "Month",
    width = 120
  ) %>%
  grid_columns(
    vars = c("temp_min_paris", "temp_min_monastir"),
    header = "Min"
  ) %>%
  grid_columns(
    vars = c("temp_max_paris", "temp_max_monastir"),
    header = "Max"
  ) %>%
  grid_columns(
    vars = c("temp_paris", "temp_monastir"), 
    header = "Temperature",
    width = 200
  ) %>%
  grid_style_column(
    column = "temp_min_paris",
    background = col_numeric(
      "Blues", 
      domain = range(c(temp_min_paris, temp_min_monastir)), 
      reverse = TRUE
    )(temp_min_paris),
    color = ifelse(temp_min_paris < 5, "white", "black")
  ) %>% 
  grid_style_column(
    column = "temp_max_paris",
    background = col_numeric("Reds", domain = range(c(temp_max_paris, temp_max_monastir)))(temp_max_paris),
    color = ifelse(temp_max_paris > 25, "white", "black")
  ) %>%
  grid_style_column(
    column = "temp_min_monastir",
    background = col_numeric(
      "Blues", 
      domain = range(c(temp_min_paris, temp_min_monastir)), 
      reverse = TRUE
    )(temp_min_monastir),
    color = ifelse(temp_min_monastir < 5, "white", "black")
  ) %>% 
  grid_style_column(
    column = "temp_max_monastir",
    background = col_numeric("Reds", domain = range(c(temp_max_paris, temp_max_monastir)))(temp_max_monastir),
    color = ifelse(temp_max_monastir > 25, "white", "black")
  ) %>% 
  grid_sparkline(
    column = "temp_paris",
    renderer = function(data) {
      apex(data, aes(date, temp), type = "area") %>%
        ax_chart(sparkline = list(enabled = TRUE)) %>%
        ax_yaxis(min = -5, max = 40) %>% 
        ax_fill(opacity = 1, type = "solid")
    }
  ) %>%
  grid_sparkline(
    column = "temp_monastir",
    renderer = function(data) {
      apex(data, aes(date, temp), type = "area") %>%
        ax_chart(sparkline = list(enabled = TRUE)) %>%
        ax_yaxis(min = -5, max = 40) %>% 
        ax_fill(opacity = 1, type = "solid")
    }
  )


