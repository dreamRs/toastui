
# Default
tuigrid(iris)

# Customize theme
tuigrid(iris) %>%
  tg_theme(
    row = list(
      even = list(
        background = "#ddebf7"
      )
    ),
    cell = list(
      normal = list(
        border = "#9bc2e6",
        showHorizontalBorder = TRUE
      ),
      header = list(
        background = "#5b9bd5",
        text = "#FFF"
      )
    )
  )




