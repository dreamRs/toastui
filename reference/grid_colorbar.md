# Style cells with a color bar

Style cells with a color bar

## Usage

``` r
grid_colorbar(
  grid,
  column,
  bar_bg = "#5E81AC",
  color = "#ECEFF4",
  background = "#ECEFF4",
  from = NULL,
  prefix = NULL,
  suffix = NULL,
  label_outside = FALSE,
  label_width = "20px",
  border_radius = "0px",
  height = "16px",
  align = c("left", "center", "right")
)
```

## Arguments

- grid:

  A grid created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- column:

  The name of the column where to create a color bar.

- bar_bg:

  Background color of the color bar.

- color:

  Color of the text.

- background:

  Background of the cell.

- from:

  Range of values of the variable to represent as a color bar.

- prefix, suffix:

  String to put in front of or after the value.

- label_outside:

  Show label outside of the color bar.

- label_width:

  Width of label in case it's displayed outside the color bar.

- border_radius:

  Border radius of color bar.

- height:

  Height in pixel of color bar.

- align:

  Alignment of label if it is displayed inside the color bar.

## Value

A `datagrid` htmlwidget.

## Examples

``` r
library(toastui)

dat <- rolling_stones_50[, "Artist", drop = FALSE]
dat$percentage <- sample(1:100, size = 50, replace = TRUE)
dat$numeric <- sample(1:1500, size = 50, replace = TRUE)

datagrid(dat) %>%
  grid_colorbar(
    column = "percentage"
  )

  

{"x":{"nrow":50,"ncol":3,"data":[["The Beatles","The Beach Boys","The Beatles","Bob Dylan","The Beatles","Marvin Gaye","The Rolling Stones","The Clash","Bob Dylan","The Beatles","Elvis Presley","Miles Davis","The Velvet Underground","The Beatles","The Jimi Hendrix Experience","Bob Dylan","Nirvana","Bruce Springsteen","Van Morrison","Michael Jackson","Chuck Berry","Robert Johnson","John Lennon / Plastic Ono Band","Stevie Wonder","James Brown","Fleetwood Mac","U2","The Who","Led Zeppelin","Joni Mitchell","Bob Dylan","The Rolling Stones","Ramones","The Band","David Bowie","Carole King","Eagles","Muddy Waters","The Beatles","Love","Sex Pistols","The Doors","Pink Floyd","Patti Smith","The Band","Bob Marley & The Wailers","John Coltrane","Public Enemy","The Allman Brothers Band","Little Richard"],[81,87,19,28,46,39,23,7,15,14,95,35,34,22,1,39,100,94,75,46,39,11,10,60,57,2,89,9,64,11,1,19,35,99,46,16,12,97,91,78,58,12,24,92,38,58,68,73,83,71],[108,768,914,867,602,1070,1231,15,653,446,448,26,809,395,224,954,165,212,242,962,644,477,1484,1122,714,820,891,688,824,594,1425,211,278,345,1285,1366,700,1183,968,1500,851,991,1402,1215,474,94,650,1131,627,408]],"colnames":["Artist","percentage","numeric"],"options":{"columns":[{"header":"Artist","name":"Artist","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"percentage","name":"percentage","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.colorbar","options":{"bar_bg":"#5E81AC","color":"#ECEFF4","background":"#ECEFF4","from":[0,100],"prefix":"","suffix":"","label_outside":false,"label_width":"20px","height":"16px","border_radius":"0px"}}},{"header":"numeric","name":"numeric","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.columns.1.renderer.type"],"jsHooks":[]}
datagrid(dat) %>%
  grid_colorbar(
    column = "percentage",
    label_outside = TRUE
  )

  

{"x":{"nrow":50,"ncol":3,"data":[["The Beatles","The Beach Boys","The Beatles","Bob Dylan","The Beatles","Marvin Gaye","The Rolling Stones","The Clash","Bob Dylan","The Beatles","Elvis Presley","Miles Davis","The Velvet Underground","The Beatles","The Jimi Hendrix Experience","Bob Dylan","Nirvana","Bruce Springsteen","Van Morrison","Michael Jackson","Chuck Berry","Robert Johnson","John Lennon / Plastic Ono Band","Stevie Wonder","James Brown","Fleetwood Mac","U2","The Who","Led Zeppelin","Joni Mitchell","Bob Dylan","The Rolling Stones","Ramones","The Band","David Bowie","Carole King","Eagles","Muddy Waters","The Beatles","Love","Sex Pistols","The Doors","Pink Floyd","Patti Smith","The Band","Bob Marley & The Wailers","John Coltrane","Public Enemy","The Allman Brothers Band","Little Richard"],[81,87,19,28,46,39,23,7,15,14,95,35,34,22,1,39,100,94,75,46,39,11,10,60,57,2,89,9,64,11,1,19,35,99,46,16,12,97,91,78,58,12,24,92,38,58,68,73,83,71],[108,768,914,867,602,1070,1231,15,653,446,448,26,809,395,224,954,165,212,242,962,644,477,1484,1122,714,820,891,688,824,594,1425,211,278,345,1285,1366,700,1183,968,1500,851,991,1402,1215,474,94,650,1131,627,408]],"colnames":["Artist","percentage","numeric"],"options":{"columns":[{"header":"Artist","name":"Artist","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"percentage","name":"percentage","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.colorbar","options":{"bar_bg":"#5E81AC","color":"#ECEFF4","background":"#ECEFF4","from":[0,100],"prefix":"","suffix":"","label_outside":true,"label_width":"20px","height":"16px","border_radius":"0px"}}},{"header":"numeric","name":"numeric","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.columns.1.renderer.type"],"jsHooks":[]}
# More options
datagrid(dat) %>%
  grid_colorbar(
    column = "percentage",
    from = c(0, 100),
    suffix = "%"
  ) %>%
  grid_colorbar(
    column = "numeric",
    bar_bg = "#BF616A",
    from = c(0, 1500),
    prefix = "$",
    height = "20px"
  )

  

{"x":{"nrow":50,"ncol":3,"data":[["The Beatles","The Beach Boys","The Beatles","Bob Dylan","The Beatles","Marvin Gaye","The Rolling Stones","The Clash","Bob Dylan","The Beatles","Elvis Presley","Miles Davis","The Velvet Underground","The Beatles","The Jimi Hendrix Experience","Bob Dylan","Nirvana","Bruce Springsteen","Van Morrison","Michael Jackson","Chuck Berry","Robert Johnson","John Lennon / Plastic Ono Band","Stevie Wonder","James Brown","Fleetwood Mac","U2","The Who","Led Zeppelin","Joni Mitchell","Bob Dylan","The Rolling Stones","Ramones","The Band","David Bowie","Carole King","Eagles","Muddy Waters","The Beatles","Love","Sex Pistols","The Doors","Pink Floyd","Patti Smith","The Band","Bob Marley & The Wailers","John Coltrane","Public Enemy","The Allman Brothers Band","Little Richard"],[81,87,19,28,46,39,23,7,15,14,95,35,34,22,1,39,100,94,75,46,39,11,10,60,57,2,89,9,64,11,1,19,35,99,46,16,12,97,91,78,58,12,24,92,38,58,68,73,83,71],[108,768,914,867,602,1070,1231,15,653,446,448,26,809,395,224,954,165,212,242,962,644,477,1484,1122,714,820,891,688,824,594,1425,211,278,345,1285,1366,700,1183,968,1500,851,991,1402,1215,474,94,650,1131,627,408]],"colnames":["Artist","percentage","numeric"],"options":{"columns":[{"header":"Artist","name":"Artist","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"percentage","name":"percentage","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.colorbar","options":{"bar_bg":"#5E81AC","color":"#ECEFF4","background":"#ECEFF4","from":[0,100],"prefix":"","suffix":"%","label_outside":false,"label_width":"20px","height":"16px","border_radius":"0px"}}},{"header":"numeric","name":"numeric","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.colorbar","options":{"bar_bg":"#BF616A","color":"#ECEFF4","background":"#ECEFF4","from":[0,1500],"prefix":"$","suffix":"","label_outside":false,"label_width":"20px","height":"20px","border_radius":"0px"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.columns.1.renderer.type","options.columns.2.renderer.type"],"jsHooks":[]}

data.frame(
  rn = rownames(mtcars),
  mpg = mtcars$mpg,
  check.names = FALSE
) %>%
  datagrid(colnames = c("Automobile", "Miles/(US) gallon")) %>%
  grid_colorbar(
    column = "mpg",
    bar_bg = ifelse(mtcars$mpg > mean(mtcars$mpg), "#5cb85c", "#BF616A"),
    label_outside = TRUE,
    label_width = "25px"
  )

  

{"x":{"nrow":32,"ncol":2,"data":[["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4]],"colnames":["rn","mpg"],"options":{"columns":[{"header":"Automobile","name":"rn","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Miles/(US) gallon","name":"mpg","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"},"type":"datagrid.renderer.colorbar","options":{"bar_bg":["#5cb85c","#5cb85c","#5cb85c","#5cb85c","#BF616A","#BF616A","#BF616A","#5cb85c","#5cb85c","#BF616A","#BF616A","#BF616A","#BF616A","#BF616A","#BF616A","#BF616A","#BF616A","#5cb85c","#5cb85c","#5cb85c","#5cb85c","#BF616A","#BF616A","#BF616A","#BF616A","#5cb85c","#5cb85c","#5cb85c","#BF616A","#BF616A","#BF616A","#5cb85c"],"color":"#ECEFF4","background":"#ECEFF4","from":[10,35],"prefix":"","suffix":"","label_outside":true,"label_width":"25px","height":"16px","border_radius":"0px"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.columns.1.renderer.type"],"jsHooks":[]}
```
