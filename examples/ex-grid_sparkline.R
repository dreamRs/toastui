
library(toastui)
library(apexcharter)

# Create some fake data
spark <- data.frame(
  month = month.name,
  stringsAsFactors = FALSE
)
# Create a list-columns with data.frames
# from which to create charts
spark$data <- lapply(
  X = seq_len(12),
  FUN = function(x) {
    data.frame(x = 1:10, y = sample(1:30, 10, TRUE))
  }
)

# Create the grid
datagrid(spark) %>%
  grid_columns(
    vars = "month", width = 150
  ) %>%
  grid_sparkline(
    column = "data",
    renderer = function(data) { # this function will render a chart
      apex(data, aes(x, y), type = "area") %>%
        ax_chart(sparkline = list(enabled = TRUE))
    }
  )

# You can also use package highcharter for example
# by using the following renderer:
# renderer = function(data) {
#   hchart(data, type = "area", hcaes(x, y)) %>%
#     hc_add_theme(hc_theme_sparkline())
# }
