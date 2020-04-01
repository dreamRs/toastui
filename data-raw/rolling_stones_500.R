## code to prepare `rolling_stones_500` dataset goes here

# source: https://www.kaggle.com/notgibs/500-greatest-albums-of-all-time-rolling-stone/version/1

library(data.table)
rolling_stones_500 <- fread("data-raw/albumlist.csv")
rolling_stones_50 <- rolling_stones_500[Number <= 50]


rolling_stones_500 <- as.data.frame(rolling_stones_500)
rolling_stones_50 <- as.data.frame(rolling_stones_50)

usethis::use_data(rolling_stones_500)
usethis::use_data(rolling_stones_50)
