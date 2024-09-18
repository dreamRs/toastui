#' Rolling Stone's 500 Greatest Albums of All Time
#'
#' Data about Rolling Stone magazine's (2012) top 500 albums of all time list.
#'
#' @format A \code{data.frame} with 500 rows and 6 variables:
#' \describe{
#'   \item{Number}{Position on the list}
#'   \item{Year}{Year of release}
#'   \item{Album}{Album name}
#'   \item{Artist}{Artist name}
#'   \item{Genre}{Genre name}
#'   \item{Subgenre}{Subgenre name}
#' }
#' @source Gibs on Kaggle (https://www.kaggle.com/datasets/notgibs/500-greatest-albums-of-all-time-rolling-stone/)
"rolling_stones_500"

#' Rolling Stone's 50 Greatest Albums of All Time
#'
#' Data about Rolling Stone magazine's (2012) top 50 albums of all time list.
#'
#' @format A \code{data.frame} with 50 rows and 6 variables:
#' \describe{
#'   \item{Number}{Position on the list}
#'   \item{Year}{Year of release}
#'   \item{Album}{Album name}
#'   \item{Artist}{Artist name}
#'   \item{Genre}{Genre name}
#'   \item{Subgenre}{Subgenre name}
#' }
#' @source Gibs on Kaggle (https://www.kaggle.com/datasets/notgibs/500-greatest-albums-of-all-time-rolling-stone/)
"rolling_stones_50"



#' Information on population, region, area size, infant mortality and more.
#'
#' Data about countries of the world.
#'
#' @format A \code{data.frame} with 227 rows and 20 variables:
#'   \describe{
#'     \item{\code{Country}}{a character vector}
#'     \item{\code{Region}}{a character vector}
#'     \item{\code{Population}}{a numeric vector}
#'     \item{\samp{Area (sq. mi.)}}{a numeric vector}
#'     \item{\samp{Pop. Density (per sq. mi.)}}{a numeric vector}
#'     \item{\samp{Coastline (coast/area ratio)}}{a numeric vector}
#'     \item{\samp{Net migration}}{a numeric vector}
#'     \item{\samp{Infant mortality (per 1000 births)}}{a numeric vector}
#'     \item{\samp{GDP ($ per capita)}}{a numeric vector}
#'     \item{\samp{Literacy (\%)}}{a numeric vector}
#'     \item{\samp{Phones (per 1000)}}{a numeric vector}
#'     \item{\samp{Arable (\%)}}{a numeric vector}
#'     \item{\samp{Crops (\%)}}{a numeric vector}
#'     \item{\samp{Other (\%)}}{a numeric vector}
#'     \item{\code{Climate}}{a numeric vector}
#'     \item{\code{Birthrate}}{a numeric vector}
#'     \item{\code{Deathrate}}{a numeric vector}
#'     \item{\code{Agriculture}}{a numeric vector}
#'     \item{\code{Industry}}{a numeric vector}
#'     \item{\code{Service}}{a numeric vector}
#'   }
#' @source fernandol on Kaggle (https://www.kaggle.com/datasets/fernandol/countries-of-the-world/)
"countries"



#' Top 20 PS3 games
#'
#' This dataset contains 20 PS3 video games with sales.
#'
#' @format A \code{data.frame} with 20 rows and 8 variables:
#' \describe{
#'   \item{Name}{Name of the game}
#'   \item{Year}{Year of the game's release}
#'   \item{Genre}{Genre of the game}
#'   \item{Publisher}{Publisher of the game}
#'   \item{NA_Sales}{Sales in North America (in millions)}
#'   \item{EU_Sales}{Sales in Europe (in millions)}
#'   \item{JP_Sales}{Sales in Japan (in millions)}
#'   \item{Other_Sales}{Sales in the rest of the world (in millions)}
#' }
#' @source GregorySmith on Kaggle (https://www.kaggle.com/datasets/gregorut/videogamesales/)
"ps3_games"



#' Meteorological for Le Bourget Station
#'
#' This dataset contains temperature and relative humidity for year 2020.
#'
#' @format A \code{data.frame} with 12 rows and 3 variables:
#' \describe{
#'   \item{month}{Month of the year}
#'   \item{temp}{List column containing data.frame with 2 column "date  and"temp"}
#'   \item{rh}{List column containing data.frame with 2 column "date  and"rh"}
#' }
#' @source Data collected with package stationaRy from NOAA
"met_paris"



#' Schedules properties
#'
#' This dataset contains properties that can be use to create schedules in [calendar()].
#'
#' @format A \code{data.frame} with 26 rows and 3 variables:
#' \describe{
#'   \item{Name}{Name of property}
#'   \item{Type}{Type}
#'   \item{Description}{Description}
#' }
#' @source Toast UI documentation (\url{https://nhn.github.io/tui.calendar/latest/EventObject/})
"schedules_properties"


#' Calendar properties
#'
#' This dataset contains properties that can be used to set calendars properties in [cal_props()].
#'
#' @format A \code{data.frame} with 6 rows and 3 variables:
#' \describe{
#'   \item{Name}{Name of property}
#'   \item{Type}{Type}
#'   \item{Description}{Description}
#' }
#' @source Toast UI documentation (\url{https://nhn.github.io/tui.calendar/latest/CalendarInfo/})
"calendar_properties"

