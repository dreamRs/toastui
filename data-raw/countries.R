## code to prepare `countries` dataset goes here

# source: https://www.kaggle.com/fernandol/countries-of-the-world

library(data.table)
countries <- fread("data-raw/countries of the world.csv")
countries <- countries[, lapply(.SD, type.convert, dec = ",", as.is = TRUE)]



countries <- as.data.frame(countries)

usethis::use_data(countries)

