library(toastui)

# Some data
mydata <- data.frame(
  month = month.name,
  value = sample(1:100, 12)
)

# Chart using mapping
chart(mydata, caes(x = month, y = value), type = "bar")

# Otherwise:
chart(
  data = list(
    categories = mydata$month,
    series = list(
      list(
        name = "Value", 
        data = mydata$value
      )
    )
  ),
  options = list(
    chart = list(title = "My title"),
    legend = list(visible = FALSE)
  ),
  type = "column"
)
