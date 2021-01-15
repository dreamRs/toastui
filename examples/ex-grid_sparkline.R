
library(toastui)
library(apexcharter)
library(highcharter)
library(htmltools)
data1 <- data.frame(
  x = 1:10,
  y = sample(1:100, 10)
)
ax <- apex(data1, aes(x, y), type = "line") %>%
  ax_chart(sparkline = list(enabled = TRUE))

# hcspark(data1$y, type = "area")
hchart(data1, type = "area", hcaes(x, y)) %>%
  hc_add_theme(hc_theme_sparkline())


axtag <- as.tags(ax)
as.character(axtag)

datagrid(data) %>%
  grid_sparkline(
    column = "line",
    fun = function(data) {
      apex(data1, aes(x, y), type = "line") %>%
        ax_chart(sparkline = list(enabled = TRUE))
    }
  )


spark <- expand.grid(month = month.name, x = 1:10)
spark$y <- sample(1:30, nrow(spark), TRUE)

apex(tibble(x = 1:10, y = sample(1:30, 10, TRUE)), aes(x, y), type = "line") %>%
  ax_chart(sparkline = list(enabled = TRUE))

library(tibble)
spark <- tibble(
  month = month.name,
  data = list(
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE)),
    tibble(x = 1:10, y = sample(1:30, 10, TRUE))
  )
)

datagrid(spark) %>%
  grid_columns(
    vars = "month", width = 150
  ) %>%
  grid_sparkline(
    column = "data",
    renderer = function(data) {
      hchart(data, type = "area", hcaes(x, y), height = "40px") %>%
        hc_add_theme(hc_theme_sparkline())
    }
  )

datagrid(spark) %>%
  grid_columns(
    vars = "month", width = 150
  ) %>%
  grid_sparkline(
    column = "data",
    renderer = function(data) {
      apex(data, aes(x, y), type = "area") %>%
        ax_chart(sparkline = list(enabled = TRUE))
    }
  )


datagrid(spark) %>%
  grid_columns(
    vars = "month", width = 150
  ) %>%
  toastui:::add_dependencies(htmlwidgets::getDependency("apexcharter", "apexcharter")) %>%
  toastui:::grid_sparkline(
    column = "data",
    fun = function(data) {
      apex(data, aes(x, y), type = "area", height = "40px") %>%
        ax_chart(sparkline = list(enabled = TRUE))
    }
  )





spark$data

toastui:::make_styles(list(textAlign = "center", fontWeight = "bold"), class = NULL)


my_fun <- function(data) {
  apex(data1, aes(x, y), type = "line") %>%
    ax_chart(sparkline = list(enabled = TRUE))
}

widgets <- lapply(
  X = spark$data,
  FUN = function(x) {
    x <- my_fun(x)
    # x <- as.tags(x)
    # as.character(x)
    x
  }
)
findDependencies(widgets)
dependencies <- lapply(widgets, `[[`, "dependencies")


data <- data.frame(
  col_char = month.name,
  col_num = round(rnorm(12)),
  col_int = 1L:12L,
  col_date = Sys.Date() + 0:11,
  col_time = Sys.time() + 3600*0:11,
  stringsAsFactors = FALSE
)

str(data)


flextable::autofit(flextable::flextable(data))

datagrid(data) %>%
  grid_columns(
    align = c("left", "right", "right", "right", "right")
  )


vapply(
  X = data,
  FUN = function(x) {
    if (inherits(x, c("numeric", "integer", "Date", "POSIXct"))) {
      "left"
    } else {
      "right"
    }
  },
  FUN.VALUE = character(1),
  USE.NAMES = FALSE
)

