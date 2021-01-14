## code to prepare `video_games` dataset goes here

# source: https://www.kaggle.com/gregorut/videogamesales

library(data.table)
video_games <- fread("data-raw/vgsales.csv")

pc_games <- video_games[Platform == "PC", list(Name, Year, Genre, Publisher, Global_Sales)][1:20]
ps3_games <- video_games[Platform == "PS3", list(Name, Year, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales)][1:20]



# Use PS3 dataset
ps3_games <- as.data.frame(ps3_games)
usethis::use_data(ps3_games, overwrite = TRUE)




# Tests -------------------------------------------------------------------

datagrid(video_games)

video_games[, .N, by = Platform][order(N)]
video_games[Year > 2000][1:20]
video_games[, .N, by = Platform]
video_games[Platform == "PC", list(Name, Year, Genre, Publisher, Global_Sales)][1:20]
video_games[Platform == "PS3", list(Name, Year, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales)][1:20]

datagrid(video_games, colwidths = "guess") %>%
  grid_style_cell(
    Publisher == "Nintendo",
    column = "Publisher",
    background = "#e60012",
    color = "white",
    fontWeight = "bold"
  )



# PC Games ----------------------------------------------------------------

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




# PS3 Games ---------------------------------------------------------------

datagrid(ps3_games, colwidths = "guess")

datagrid(ps3_games, colwidths = "guess") %>%
  grid_complex_header(
    "Sales"= c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales")
  )

datagrid(ps3_games[order(ps3_games$Publisher), c(1, 4, 5, 6, 7, 8)], colwidths = "guess") %>%
  grid_columns(
    vars = c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales"),
    header = c("North America", "Europe", "Japan", "Other")
  ) %>%
  grid_complex_header(
    "Sales"= c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales")
  )


datagrid(ps3_games[, c(1, 5, 6, 7, 8)], colwidths = "guess") %>% 
  grid_summary(
    column = "NA_Sales",
    stat = "sum"
  ) %>% 
  grid_summary(
    column = "EU_Sales",
    stat = "sum"
  )

datagrid(ps3_games[, c(1, 5, 6, 7, 8)], colwidths = "guess") %>% 
  grid_summary(
    column = c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales"),
    stat = "sum",
    label = "Total: "
  )


aa <- datagrid(ps3_games[, c(1, 5, 6, 7, 8)], colwidths = "guess") %>% 
  grid_summary(
    column = "NA_Sales",
    stat = c("sum", "mean"), sep = "<br>"
  )
aa
aa$x$options$summary

jsonlite::toJSON(aa$x$options$summary, pretty = TRUE, force = TRUE)

