
# datagrid ----------------------------------------------------------------

# datagrid() works with no data and as class "datagrid"
expect_inherits(datagrid(), "datagrid")

# datagrid() works with data and as class "datagrid"
grid_ <- datagrid(rolling_stones_50)
expect_inherits(grid_, "datagrid")
expect_inherits(grid_$x$data_df, "data.frame")



# calendar ----------------------------------------------------------------

# calendar() works with no data and as class "calendar"
expect_inherits(calendar(), "calendar")

# calendar() works with data and as class "calendar"
cal_ <- calendar(cal_demo_data(), view = "month")
expect_inherits(cal_, "calendar")
expect_true(length(cal_$x$schedules) > 0)



# chart -------------------------------------------------------------------

# chart() works with no data and as class "chart"
expect_inherits(chart(), "chart")

# chart() works with data and as class "chart"
mydata <- data.frame(
  month = month.name,
  value = sample(1:100, 12)
)
chart_ <- chart(mydata, caes(x = month, y = value), type = "bar")
expect_inherits(chart_, "chart")

