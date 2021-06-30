
# datagrid ----------------------------------------------------------------

grid_output <- datagridOutput("grid")
expect_inherits(grid_output, "shiny.tag.list")
expect_true(length(htmltools::htmlDependencies(grid_output)) > 0)

expect_inherits(renderDatagrid(datagrid()), "shiny.render.function")


# calendar ----------------------------------------------------------------

cal_output <- calendarOutput("cal")
expect_inherits(cal_output, "shiny.tag.list")
expect_true(length(htmltools::htmlDependencies(cal_output)) > 0)

expect_inherits(renderCalendar(calendar()), "shiny.render.function")


# chart -------------------------------------------------------------------

chart_output <- chartOutput("chart")
expect_inherits(chart_output, "shiny.tag.list")
expect_true(length(htmltools::htmlDependencies(chart_output)) > 0)

expect_inherits(renderChart(chart()), "shiny.render.function")

