library(toastui)
library(scales)

# Create some data
data <- data.frame(
  col_num = rnorm(12),
  col_currency = sample(1:1e6, 12, TRUE),
  col_percentage = sample(1:100, 12, TRUE) / 100,
  col_date = sample(Sys.Date() + 0:364, 12),
  col_time = Sys.time() + sample.int(86400 * 365, 12),
  col_logical = sample(c(TRUE, FALSE), 12, TRUE),
  stringsAsFactors = FALSE
)


# Use R functions
datagrid(data, colwidths = "fit") %>% 
  grid_format(
    "col_percentage", label_percent(accuracy = 1)
  ) %>%
  grid_format(
    "col_currency", label_dollar(prefix = "$", big.mark = ",")
  ) %>%
  grid_format(
    "col_num", label_number(accuracy = 0.01)
  ) %>% 
  grid_format(
    "col_date", label_date(format = "%d/%m/%Y")
  ) %>% 
  grid_format(
    "col_time", label_date(format = "%d/%m/%Y %H:%M")
  ) %>% 
  grid_format(
    "col_logical", function(value) {
      lapply(
        X = value,
        FUN = function(x) {
          if (x)
            shiny::icon("check")
          else
            shiny::icon("times")
        }
      )
    }
  )


# Use a JavaScript function
datagrid(data) %>% 
  grid_format(
    column = "col_percentage",
    formatter = JS("function(obj) {return (obj.value*100).toFixed(0) + '%';}")
  )



