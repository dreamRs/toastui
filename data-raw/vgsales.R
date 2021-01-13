## code to prepare `video_games` dataset goes here

# source: https://www.kaggle.com/gregorut/videogamesales

library(data.table)
video_games <- fread("data-raw/vgsales.csv")

pc_games <- video_games[Platform == "PC", list(Name, Year, Genre, Publisher, Global_Sales)][1:20]


# Test
datagrid(video_games)

video_games[Year > 2000][1:20]
video_games[, .N, by = Platform]
video_games[Platform == "PC", list(Name, Year, Genre, Publisher, Global_Sales)][1:20]

datagrid(video_games, colwidths = "guess") %>%
  grid_style_cell(
    Publisher == "Nintendo",
    column = "Publisher",
    background = "#e60012",
    color = "white",
    fontWeight = "bold"
  )


datagrid(pc_games, colwidths = "guess") %>%
  grid_style_cell(
    Genre == "Simulation",
    column = "Genre",
    background = "steelblue",
    color = "white",
    fontWeight = "bold"
  ) %>%
  grid_style_cell(
    Year > 2000,
    column = "Year",
    color = "firebrick",
    fontStyle = "italic"
  )

datagrid(pc_games, colwidths = "guess") %>%
  grid_style_column(
    column = "Global_Sales",
    background = col_numeric("Blues", domain = NULL)(Global_Sales),
    fontWeight = "bold",
    color = ifelse(Global_Sales > 5, "#E6E6E6", "black")
  )


datagrid(pc_games, colwidths = "guess") %>%
  grid_style_row(
    Global_Sales > 5,
    fontWeight = "bold"
  )


