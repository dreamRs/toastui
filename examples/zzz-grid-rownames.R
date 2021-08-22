
library(toastui)

datagrid(
  data = mtcars, rowHeaders = list(
    list(
      type = "rowNum",
      width = 150,
      align = "left",
      header = " ",
      renderer = list(
        type = JS("datagrid.renderer.rownames"),
        options = list(rowNames = rownames(mtcars))
      )
    )
  )
)
