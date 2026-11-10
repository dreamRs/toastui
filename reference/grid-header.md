# Header options

Properties to modify grid's header, like creating grouped header.

## Usage

``` r
grid_header(
  grid,
  complexColumns = NULL,
  columns = NULL,
  align = NULL,
  valign = NULL,
  height = NULL
)

grid_complex_header(grid, ..., height = 80)
```

## Arguments

- grid:

  A table created with
  [`datagrid()`](https://dreamrs.github.io/toastui/reference/datagrid.md).

- complexColumns:

  `list`. This options creates new parent headers of the multiple
  columns which includes the headers of specified columns, and sets up
  the hierarchy.

- columns:

  `list`. Options for column's header.

- align:

  Horizontal alignment of the header content. Available values are
  'left', 'center', 'right'.

- valign:

  Vertical alignment of the row header content. Available values are
  'top', 'middle', 'bottom'.

- height:

  Numeric. The height of the header area.

- ...:

  Named arguments to merge columns under a common header, e.g.
  `newcol = c("col1", "col2")`.

## Value

A `datagrid` htmlwidget.

## Examples

``` r
library(toastui)

datagrid(rolling_stones_50) %>%
  grid_header(
    align = "left",
    height = "150px"
  )

  

{"x":{"nrow":50,"ncol":6,"data":[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50],[1967,1966,1966,1965,1965,1971,1972,1979,1966,1968,1976,1959,1967,1969,1967,1975,1991,1975,1968,1982,1982,1990,1970,1973,1963,1977,1987,1971,1969,1971,1965,1969,1976,1968,1972,1971,1976,2001,1963,1967,1977,1967,1973,1975,1969,1984,1965,1988,1971,1957],["Sgt. Pepper's Lonely Hearts Club Band","Pet Sounds","Revolver","Highway 61 Revisited","Rubber Soul","What's Going On","Exile on Main St.","London Calling","Blonde on Blonde","The Beatles (\"\"The White Album\"\")","The Sun Sessions","Kind of Blue","The Velvet Underground & Nico","Abbey Road","Are You Experienced","Blood on the Tracks","Nevermind","Born to Run","Astral Weeks","Thriller","The Great Twenty_Eight","The Complete Recordings","John Lennon/Plastic Ono Band","Innervisions","Live at the Apollo, 1962","Rumours","The Joshua Tree","Who's Next","Led Zeppelin","Blue","Bringing It All Back Home","Let It Bleed","Ramones","Music From Big Pink","The Rise and Fall of Ziggy Stardust and the Spiders From Mars","Tapestry","Hotel California","The Anthology","Please Please Me","Forever Changes","Never Mind the Bollocks Here's the Sex Pistols","The Doors","The Dark Side of the Moon","Horses","The Band (\"\"The Brown Album\"\")","Legend: The Best of Bob Marley and The Wailers","A Love Supreme","It Takes a Nation of Millions to Hold Us Back","At Fillmore East","Here's Little Richard"],["The Beatles","The Beach Boys","The Beatles","Bob Dylan","The Beatles","Marvin Gaye","The Rolling Stones","The Clash","Bob Dylan","The Beatles","Elvis Presley","Miles Davis","The Velvet Underground","The Beatles","The Jimi Hendrix Experience","Bob Dylan","Nirvana","Bruce Springsteen","Van Morrison","Michael Jackson","Chuck Berry","Robert Johnson","John Lennon / Plastic Ono Band","Stevie Wonder","James Brown","Fleetwood Mac","U2","The Who","Led Zeppelin","Joni Mitchell","Bob Dylan","The Rolling Stones","Ramones","The Band","David Bowie","Carole King","Eagles","Muddy Waters","The Beatles","Love","Sex Pistols","The Doors","Pink Floyd","Patti Smith","The Band","Bob Marley & The Wailers","John Coltrane","Public Enemy","The Allman Brothers Band","Little Richard"],["Rock","Rock","Rock","Rock","Rock, Pop","Funk / Soul","Rock","Rock","Rock, Blues","Rock","Rock","Jazz","Rock","Rock","Rock, Blues","Rock","Rock","Rock","Jazz, Rock, Blues, Folk, World, & Country","Funk / Soul, Pop","Rock","Blues","Rock","Funk / Soul","Funk / Soul","Rock","Rock","Rock","Rock","Pop","Rock, Folk, World, & Country","Rock","Rock","Rock","Rock","Rock, Pop","Rock","Folk, World, & Country","Rock","Rock","Rock","Rock","Rock","Rock","Classical, Stage & Screen","Reggae","Jazz","Hip Hop","Rock, Blues","Rock, Blues"],["Rock & Roll, Psychedelic Rock","Pop Rock, Psychedelic Rock","Psychedelic Rock, Pop Rock","Folk Rock, Blues Rock","Pop Rock","Soul","Blues Rock, Rock & Roll, Classic Rock","Punk, New Wave","Folk Rock, Rhythm & Blues","Rock & Roll, Pop Rock, Psychedelic Rock, Experimental","Rock & Roll","Modal","Garage Rock, Art Rock, Experimental","Psychedelic Rock, Classic Rock, Pop Rock","Blues Rock, Psychedelic Rock","Folk Rock, Acoustic, Ballad","Alternative Rock, Grunge","Pop Rock","Acoustic, Classic Rock, Free Improvisation","Disco","Rock & Roll","Delta Blues","Pop Rock","Soul","Rhythm & Blues, Soul","Pop Rock","Alternative Rock, Pop Rock","Hard Rock, Mod, Prog Rock, Psychedelic Rock","Blues Rock, Hard Rock","Acoustic, Ballad, Folk","Folk Rock, Folk","Blues Rock, Hard Rock","Rock & Roll, Punk","Folk Rock, Acoustic, Blues Rock","Classic Rock, Glam","Folk Rock, Soft Rock","Classic Rock","Folk","Beat, Rock & Roll","Folk Rock, Psychedelic Rock","Punk","Psychedelic Rock","Prog Rock","Art Rock","Soundtrack, Modern Classical, Contemporary, Score","Reggae, Roots Reggae","Free Jazz, Hard Bop, Modal","Conscious","Blues Rock","Rock & Roll, Rhythm & Blues"]],"colnames":["Number","Year","Album","Artist","Genre","Subgenre"],"options":{"columns":[{"header":"Number","name":"Number","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Year","name":"Year","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Album","name":"Album","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Artist","name":"Artist","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Genre","name":"Genre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Subgenre","name":"Subgenre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto","header":{"align":"left","height":"150px"}},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}

# Create columns groups
datagrid(iris) %>%
  grid_complex_header(
    "Sepal" = c("Sepal.Length", "Sepal.Width"),
    "Petal" = c("Petal.Length", "Petal.Width")
  )

  

{"x":{"nrow":150,"ncol":5,"data":[[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7,4.8,5.4,5.2,5.5,4.9,5,5.5,4.9,4.4,5.1,5,4.5,4.4,5,5.1,4.8,5.1,4.6,5.3,5,7,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,5,5.9,6,6.1,5.6,6.7,5.6,5.8,6.2,5.6,5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6,5.7,5.5,5.5,5.8,6,5.4,6,6.7,6.3,5.6,5.5,5.5,6.1,5.8,5,5.6,5.7,5.7,6.2,5.1,5.7,6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6,6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6,6.9,6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3,3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8,3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,1.7,1.5,1,1.7,1.9,1.6,1.6,1.5,1.4,1.6,1.6,1.5,1.5,1.4,1.5,1.2,1.3,1.4,1.3,1.5,1.3,1.3,1.3,1.6,1.9,1.4,1.6,1.4,1.5,1.4,4.7,4.5,4.9,4,4.6,4.5,4.7,3.3,4.6,3.9,3.5,4.2,4,4.7,3.6,4.4,4.5,4.1,4.5,3.9,4.8,4,4.9,4.7,4.3,4.4,4.8,5,4.5,3.5,3.8,3.7,3.9,5.1,4.5,4.5,4.7,4.4,4.1,4,4.4,4.6,4,3.3,4.2,4.2,4.2,4.3,3,4.1,6,5.1,5.9,5.6,5.8,6.6,4.5,6.3,5.8,6.1,5.1,5.3,5.5,5,5.1,5.3,5.5,6.7,6.9,5,5.7,4.9,6.7,4.9,5.7,6,4.8,4.9,5.6,5.8,6.1,6.4,5.6,5.1,5.6,6.1,5.6,5.5,4.8,5.4,5.6,5.1,5.1,5.9,5.7,5.2,5,5.2,5.4,5.1],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2,0.2,0.4,0.1,0.2,0.2,0.2,0.2,0.1,0.2,0.2,0.3,0.3,0.2,0.6,0.4,0.3,0.2,0.2,0.2,0.2,1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3,2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8],["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica"]],"colnames":["Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species"],"options":{"columns":[{"header":"Sepal.Length","name":"Sepal.Length","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Sepal.Width","name":"Sepal.Width","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Petal.Length","name":"Petal.Length","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Petal.Width","name":"Petal.Width","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Species","name":"Species","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto","header":{"complexColumns":[{"header":"Sepal","name":"Sepal","childNames":["Sepal.Length","Sepal.Width"]},{"header":"Petal","name":"Petal","childNames":["Petal.Length","Petal.Width"]}],"height":80}},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}

# or use the full form to use more options
datagrid(iris) %>%
  grid_columns(
    columns = c("Petal.Length", "Petal.Width"),
    header = c("Length", "Width")
  ) %>%
  grid_header(
    complexColumns = list(
      list(
        header = "Sepal",
        name = "Sepal",
        hideChildHeaders = TRUE,
        resizable = TRUE,
        childNames = c("Sepal.Length", "Sepal.Width")
      ),
      list(
        header = "Petal",
        name = "Petal",
        childNames = c("Petal.Length", "Petal.Width")
      )
    ),
    height = 80,
    valign = "middle"
  )

  

{"x":{"nrow":150,"ncol":5,"data":[[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7,4.8,5.4,5.2,5.5,4.9,5,5.5,4.9,4.4,5.1,5,4.5,4.4,5,5.1,4.8,5.1,4.6,5.3,5,7,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,5,5.9,6,6.1,5.6,6.7,5.6,5.8,6.2,5.6,5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6,5.7,5.5,5.5,5.8,6,5.4,6,6.7,6.3,5.6,5.5,5.5,6.1,5.8,5,5.6,5.7,5.7,6.2,5.1,5.7,6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6,6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6,6.9,6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3,3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8,3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,1.7,1.5,1,1.7,1.9,1.6,1.6,1.5,1.4,1.6,1.6,1.5,1.5,1.4,1.5,1.2,1.3,1.4,1.3,1.5,1.3,1.3,1.3,1.6,1.9,1.4,1.6,1.4,1.5,1.4,4.7,4.5,4.9,4,4.6,4.5,4.7,3.3,4.6,3.9,3.5,4.2,4,4.7,3.6,4.4,4.5,4.1,4.5,3.9,4.8,4,4.9,4.7,4.3,4.4,4.8,5,4.5,3.5,3.8,3.7,3.9,5.1,4.5,4.5,4.7,4.4,4.1,4,4.4,4.6,4,3.3,4.2,4.2,4.2,4.3,3,4.1,6,5.1,5.9,5.6,5.8,6.6,4.5,6.3,5.8,6.1,5.1,5.3,5.5,5,5.1,5.3,5.5,6.7,6.9,5,5.7,4.9,6.7,4.9,5.7,6,4.8,4.9,5.6,5.8,6.1,6.4,5.6,5.1,5.6,6.1,5.6,5.5,4.8,5.4,5.6,5.1,5.1,5.9,5.7,5.2,5,5.2,5.4,5.1],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2,0.2,0.4,0.1,0.2,0.2,0.2,0.2,0.1,0.2,0.2,0.3,0.3,0.2,0.6,0.4,0.3,0.2,0.2,0.2,0.2,1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3,2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8],["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica"]],"colnames":["Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species"],"options":{"columns":[{"header":"Sepal.Length","name":"Sepal.Length","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Sepal.Width","name":"Sepal.Width","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Length","name":"Petal.Length","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Width","name":"Petal.Width","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Species","name":"Species","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto","header":{"complexColumns":[{"header":"Sepal","name":"Sepal","hideChildHeaders":true,"resizable":true,"childNames":["Sepal.Length","Sepal.Width"]},{"header":"Petal","name":"Petal","childNames":["Petal.Length","Petal.Width"]}],"valign":"middle","height":80}},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}

# Custom HTML in header
# (not that sorting is incompatible with)
library(htmltools)
datagrid(mtcars) %>% 
  grid_columns(
    columns = "mpg",
    minWidth = 120,
    header = tags$div(
      tags$b("Miles/(US) gallon"),
      tags$br(),
      tags$i("numeric")
    )
  ) %>% 
  grid_header(
    columns = list(
      list(
        name = "mpg",
        align = "left",
        renderer = JS("DatagridColumnHeaderHTML")
      )
    )
  )

  

{"x":{"nrow":32,"ncol":11,"data":[[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.09999999999999,120.1,318,304,350,400,79,120.3,95.09999999999999,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]],"colnames":["mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"],"options":{"columns":[{"header":"<div>\n  <b>Miles/(US) gallon<\/b>\n  <br/>\n  <i>numeric<\/i>\n<\/div>","name":"mpg","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"minWidth":120},{"header":"cyl","name":"cyl","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"disp","name":"disp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"hp","name":"hp","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"drat","name":"drat","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"wt","name":"wt","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"qsec","name":"qsec","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"vs","name":"vs","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"am","name":"am","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"gear","name":"gear","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"carb","name":"carb","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto","header":{"columns":[{"name":"mpg","align":"left","renderer":"DatagridColumnHeaderHTML"}]}},"theme":"clean","themeOptions":[],"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":["options.header.columns.0.renderer"],"jsHooks":[]}
```
