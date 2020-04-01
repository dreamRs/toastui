
# Default is "clean" theme
tuigrid(rolling_stones_50)

# others builtins themes
tuigrid(rolling_stones_50, theme = "striped")
tuigrid(rolling_stones_50, theme = "default")

# Customize theme
tuigrid(rolling_stones_50) %>%
  grid_theme(
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




