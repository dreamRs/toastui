# Set grid language options

Set grid language options

## Usage

``` r
set_grid_lang(
  display.noData = "No data",
  display.loadingData = "Loading data...",
  display.resizeHandleGuide = "You can change the width... [truncated]",
  filter.contains = "Contains",
  filter.eq = "Equals",
  filter.ne = "Not equals",
  filter.start = "Starts with",
  filter.end = "Ends with",
  filter.after = "After",
  filter.afterEq = "After or Equal",
  filter.before = "Before",
  filter.beforeEq = "Before or Equal",
  filter.apply = "Apply",
  filter.clear = "Clear",
  filter.selectAll = "Select All"
)
```

## Arguments

- display.noData, display.loadingData, display.resizeHandleGuide:

  Display language options.

- filter.contains, filter.eq, filter.ne, filter.start, filter.end,
  filter.after, filter.afterEq, filter.before, filter.beforeEq,
  filter.apply, filter.clear, filter.selectAll:

  Filter language options.

## Value

No return value.

## Examples

``` r
library(toastui)

# Change text displayed when no data in grid
set_grid_lang(display.noData = "Pas de donn\u00e9es")
datagrid(data.frame())

  

{"x":{"nrow":0,"ncol":0,"data":[],"colnames":[],"options":{"columns":[],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":{"display":{"noData":"Pas de données","loadingData":"Loading data...","resizeHandleGuide":"You can change the width of the column by mouse drag and initialize the width by double-clicking."},"filter":{"contains":"Contains","eq":"Equals","ne":"Not equals","start":"Starts with","end":"Ends with","after":"After","afterEq":"After or Equal","before":"Before","beforeEq":"Before or Equal","apply":"Apply","clear":"Clear","selectAll":"Select All"}},"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}
# change text for filters
set_grid_lang(
  # Text
  filter.contains = "Contient",
  filter.eq = "Egal \u00e0",
  filter.ne = "Diff\u00e9rent de",
  filter.start = "Commence par",
  filter.end = "Fini par",
  # Date
  filter.after = "Apr\u00e8s",
  filter.afterEq = "Apr\u00e8s ou \u00e9gal \u00e0",
  filter.before = "Avant",
  filter.beforeEq = "Avant ou \u00e9gal \u00e0",
  # Buttons
  filter.apply = "Appliquer",
  filter.clear = "Supprimer",
  # Select
  filter.selectAll = "Tout s\u00e9lectionner"
)

datagrid(rolling_stones_50) %>% 
  grid_filters(
    columns = "Artist", 
    type = "text",
    showApplyBtn = TRUE,
    showClearBtn = TRUE
  ) %>% 
  grid_filters(
    columns = "Genre", 
    type = "select"
  ) %>% 
  grid_filters(
    columns = "Year", 
    type = "date"
  )

  

{"x":{"nrow":50,"ncol":6,"data":[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50],[1967,1966,1966,1965,1965,1971,1972,1979,1966,1968,1976,1959,1967,1969,1967,1975,1991,1975,1968,1982,1982,1990,1970,1973,1963,1977,1987,1971,1969,1971,1965,1969,1976,1968,1972,1971,1976,2001,1963,1967,1977,1967,1973,1975,1969,1984,1965,1988,1971,1957],["Sgt. Pepper's Lonely Hearts Club Band","Pet Sounds","Revolver","Highway 61 Revisited","Rubber Soul","What's Going On","Exile on Main St.","London Calling","Blonde on Blonde","The Beatles (\"\"The White Album\"\")","The Sun Sessions","Kind of Blue","The Velvet Underground & Nico","Abbey Road","Are You Experienced","Blood on the Tracks","Nevermind","Born to Run","Astral Weeks","Thriller","The Great Twenty_Eight","The Complete Recordings","John Lennon/Plastic Ono Band","Innervisions","Live at the Apollo, 1962","Rumours","The Joshua Tree","Who's Next","Led Zeppelin","Blue","Bringing It All Back Home","Let It Bleed","Ramones","Music From Big Pink","The Rise and Fall of Ziggy Stardust and the Spiders From Mars","Tapestry","Hotel California","The Anthology","Please Please Me","Forever Changes","Never Mind the Bollocks Here's the Sex Pistols","The Doors","The Dark Side of the Moon","Horses","The Band (\"\"The Brown Album\"\")","Legend: The Best of Bob Marley and The Wailers","A Love Supreme","It Takes a Nation of Millions to Hold Us Back","At Fillmore East","Here's Little Richard"],["The Beatles","The Beach Boys","The Beatles","Bob Dylan","The Beatles","Marvin Gaye","The Rolling Stones","The Clash","Bob Dylan","The Beatles","Elvis Presley","Miles Davis","The Velvet Underground","The Beatles","The Jimi Hendrix Experience","Bob Dylan","Nirvana","Bruce Springsteen","Van Morrison","Michael Jackson","Chuck Berry","Robert Johnson","John Lennon / Plastic Ono Band","Stevie Wonder","James Brown","Fleetwood Mac","U2","The Who","Led Zeppelin","Joni Mitchell","Bob Dylan","The Rolling Stones","Ramones","The Band","David Bowie","Carole King","Eagles","Muddy Waters","The Beatles","Love","Sex Pistols","The Doors","Pink Floyd","Patti Smith","The Band","Bob Marley & The Wailers","John Coltrane","Public Enemy","The Allman Brothers Band","Little Richard"],["Rock","Rock","Rock","Rock","Rock, Pop","Funk / Soul","Rock","Rock","Rock, Blues","Rock","Rock","Jazz","Rock","Rock","Rock, Blues","Rock","Rock","Rock","Jazz, Rock, Blues, Folk, World, & Country","Funk / Soul, Pop","Rock","Blues","Rock","Funk / Soul","Funk / Soul","Rock","Rock","Rock","Rock","Pop","Rock, Folk, World, & Country","Rock","Rock","Rock","Rock","Rock, Pop","Rock","Folk, World, & Country","Rock","Rock","Rock","Rock","Rock","Rock","Classical, Stage & Screen","Reggae","Jazz","Hip Hop","Rock, Blues","Rock, Blues"],["Rock & Roll, Psychedelic Rock","Pop Rock, Psychedelic Rock","Psychedelic Rock, Pop Rock","Folk Rock, Blues Rock","Pop Rock","Soul","Blues Rock, Rock & Roll, Classic Rock","Punk, New Wave","Folk Rock, Rhythm & Blues","Rock & Roll, Pop Rock, Psychedelic Rock, Experimental","Rock & Roll","Modal","Garage Rock, Art Rock, Experimental","Psychedelic Rock, Classic Rock, Pop Rock","Blues Rock, Psychedelic Rock","Folk Rock, Acoustic, Ballad","Alternative Rock, Grunge","Pop Rock","Acoustic, Classic Rock, Free Improvisation","Disco","Rock & Roll","Delta Blues","Pop Rock","Soul","Rhythm & Blues, Soul","Pop Rock","Alternative Rock, Pop Rock","Hard Rock, Mod, Prog Rock, Psychedelic Rock","Blues Rock, Hard Rock","Acoustic, Ballad, Folk","Folk Rock, Folk","Blues Rock, Hard Rock","Rock & Roll, Punk","Folk Rock, Acoustic, Blues Rock","Classic Rock, Glam","Folk Rock, Soft Rock","Classic Rock","Folk","Beat, Rock & Roll","Folk Rock, Psychedelic Rock","Punk","Psychedelic Rock","Prog Rock","Art Rock","Soundtrack, Modern Classical, Contemporary, Score","Reggae, Roots Reggae","Free Jazz, Hard Bop, Modal","Conscious","Blues Rock","Rock & Roll, Rhythm & Blues"]],"colnames":["Number","Year","Album","Artist","Genre","Subgenre"],"options":{"columns":[{"header":"Number","name":"Number","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Year","name":"Year","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"filter":{"type":"date","options":{"format":"yyyy-MM-dd"}}},{"header":"Album","name":"Album","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Artist","name":"Artist","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"filter":{"type":"text","showApplyBtn":true,"showClearBtn":true}},{"header":"Genre","name":"Genre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}},"filter":"select"},{"header":"Subgenre","name":"Subgenre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":[],"language":"en","languageOptions":{"display":{"noData":"No data","loadingData":"Loading data...","resizeHandleGuide":"You can change the width of the column by mouse drag and initialize the width by double-clicking."},"filter":{"contains":"Contient","eq":"Egal à","ne":"Différent de","start":"Commence par","end":"Fini par","after":"Après","afterEq":"Après ou égal à","before":"Avant","beforeEq":"Avant ou égal à","apply":"Appliquer","clear":"Supprimer","selectAll":"Tout sélectionner"}},"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}
```
