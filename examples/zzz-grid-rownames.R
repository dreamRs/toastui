
library(toastui)

datagrid(
  data = mtcars, rowHeaders = list(
    list(
      type = "rowNum", 
      width = 150,
      align = "left",
      header = " ",
      renderer = list(
        type = JS("DatagridRowNamesRenderer"), 
        options = list(rowNames = rownames(mtcars))
      )
    )
  )
)
