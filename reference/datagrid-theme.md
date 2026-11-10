# Set global theme options

Properties to customize grid theme, see full list here :
<https://nhn.github.io/tui.grid/latest/Grid/>.

## Usage

``` r
set_grid_theme(
  selection.background = NULL,
  selection.border = NULL,
  scrollbar.border = NULL,
  scrollbar.background = NULL,
  scrollbar.emptySpace = NULL,
  scrollbar.thumb = NULL,
  scrollbar.active = NULL,
  outline.border = NULL,
  outline.showVerticalBorder = NULL,
  frozenBorder.border = NULL,
  area.header.border = NULL,
  area.header.background = NULL,
  area.body.background = NULL,
  area.summary.border = NULL,
  area.summary.background = NULL,
  row.even.background = NULL,
  row.even.text = NULL,
  row.odd.background = NULL,
  row.odd.text = NULL,
  row.dummy.background = NULL,
  row.hover.background = NULL,
  cell.normal.background = NULL,
  cell.normal.border = NULL,
  cell.normal.text = NULL,
  cell.normal.showVerticalBorder = NULL,
  cell.normal.showHorizontalBorder = NULL,
  cell.header.background = NULL,
  cell.header.border = NULL,
  cell.header.text = NULL,
  cell.header.showVerticalBorder = NULL,
  cell.header.showHorizontalBorder = NULL,
  cell.rowHeader.background = NULL,
  cell.rowHeader.border = NULL,
  cell.rowHeader.text = NULL,
  cell.rowHeader.showVerticalBorder = NULL,
  cell.rowHeader.showHorizontalBorder = NULL,
  cell.summary.background = NULL,
  cell.summary.border = NULL,
  cell.summary.text = NULL,
  cell.summary.showVerticalBorder = NULL,
  cell.summary.showHorizontalBorder = NULL,
  cell.selectedHeader.background = NULL,
  cell.selectedRowHeader.background = NULL,
  cell.focused.border = NULL,
  cell.focused.background = NULL,
  cell.focusedInactive.border = NULL,
  cell.required.background = NULL,
  cell.required.text = NULL,
  cell.editable.background = NULL,
  cell.editable.text = NULL,
  cell.disabled.background = NULL,
  cell.disabled.text = NULL,
  cell.invalid.background = NULL,
  cell.invalid.text = NULL
)

reset_grid_theme()
```

## Arguments

- selection.background:

  Background color of a selection layer.

- selection.border:

  Border color of a selection layer.

- scrollbar.border:

  Border color of scrollbars.

- scrollbar.background:

  Background color of scrollbars.

- scrollbar.emptySpace:

  Color of extra spaces except scrollbar.

- scrollbar.thumb:

  Color of thumbs in scrollbars.

- scrollbar.active:

  Color of arrows(for IE) or thumb:hover(for other browsers) in
  scrollbars.

- outline.border:

  Color of the table outline.

- outline.showVerticalBorder:

  Whether vertical outlines of the table are visible.

- frozenBorder.border:

  Border color of a frozen border.

- area.header.border:

  Border color of the header area in the table.

- area.header.background:

  Background color of the header area in the table.

- area.body.background:

  Background color of the body area in the table.

- area.summary.border:

  Border color of the summary area in the table.

- area.summary.background:

  Background color of the summary area in the table.

- row.even.background:

  background color of even row.

- row.even.text:

  text color of even row.

- row.odd.background:

  background color of cells in odd row.

- row.odd.text:

  text color of odd row.

- row.dummy.background:

  background color of dummy row.

- row.hover.background:

  background color of hovered row.

- cell.normal.background:

  Background color of normal cells.

- cell.normal.border:

  Border color of normal cells.

- cell.normal.text:

  Text color of normal cells.

- cell.normal.showVerticalBorder:

  Whether vertical borders of normal cells are visible.

- cell.normal.showHorizontalBorder:

  Whether horizontal borders of normal cells are visible.

- cell.header.background:

  Background color of header cells.

- cell.header.border:

  border color of header cells.

- cell.header.text:

  text color of header cells.

- cell.header.showVerticalBorder:

  Whether vertical borders of header cells are visible.

- cell.header.showHorizontalBorder:

  Whether horizontal borders of header cells are visible.

- cell.rowHeader.background:

  Background color of row's header cells.

- cell.rowHeader.border:

  border color of row's header cells.

- cell.rowHeader.text:

  text color of row's header cells.

- cell.rowHeader.showVerticalBorder:

  Whether vertical borders of row's header cells are visible.

- cell.rowHeader.showHorizontalBorder:

  Whether horizontal borders of row's header cells are visible.

- cell.summary.background:

  Background color of cells in the summary area.

- cell.summary.border:

  border color of cells in the summary area.

- cell.summary.text:

  text color of cells in the summary area.

- cell.summary.showVerticalBorder:

  Whether vertical borders of cells in the summary area are visible.

- cell.summary.showHorizontalBorder:

  Whether horizontal borders of cells in the summary area are visible.

- cell.selectedHeader.background:

  background color of selected header cells.

- cell.selectedRowHeader.background:

  background color of selected row's head cells.

- cell.focused.border:

  border color of a focused cell.

- cell.focused.background:

  background color of a focused cell.

- cell.focusedInactive.border:

  border color of a inactive focus cell.

- cell.required.background:

  background color of required cells.

- cell.required.text:

  text color of required cells.

- cell.editable.background:

  background color of the editable cells.

- cell.editable.text:

  text color of the selected editable cells.

- cell.disabled.background:

  background color of disabled cells.

- cell.disabled.text:

  text color of disabled cells.

- cell.invalid.background:

  background color of invalid cells.

- cell.invalid.text:

  text color of invalid cells.

## Value

No return value.

## Examples

``` r
library(toastui)

# Default is "clean" theme
datagrid(rolling_stones_50)

  

{"x":{"nrow":50,"ncol":6,"data":[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50],[1967,1966,1966,1965,1965,1971,1972,1979,1966,1968,1976,1959,1967,1969,1967,1975,1991,1975,1968,1982,1982,1990,1970,1973,1963,1977,1987,1971,1969,1971,1965,1969,1976,1968,1972,1971,1976,2001,1963,1967,1977,1967,1973,1975,1969,1984,1965,1988,1971,1957],["Sgt. Pepper's Lonely Hearts Club Band","Pet Sounds","Revolver","Highway 61 Revisited","Rubber Soul","What's Going On","Exile on Main St.","London Calling","Blonde on Blonde","The Beatles (\"\"The White Album\"\")","The Sun Sessions","Kind of Blue","The Velvet Underground & Nico","Abbey Road","Are You Experienced","Blood on the Tracks","Nevermind","Born to Run","Astral Weeks","Thriller","The Great Twenty_Eight","The Complete Recordings","John Lennon/Plastic Ono Band","Innervisions","Live at the Apollo, 1962","Rumours","The Joshua Tree","Who's Next","Led Zeppelin","Blue","Bringing It All Back Home","Let It Bleed","Ramones","Music From Big Pink","The Rise and Fall of Ziggy Stardust and the Spiders From Mars","Tapestry","Hotel California","The Anthology","Please Please Me","Forever Changes","Never Mind the Bollocks Here's the Sex Pistols","The Doors","The Dark Side of the Moon","Horses","The Band (\"\"The Brown Album\"\")","Legend: The Best of Bob Marley and The Wailers","A Love Supreme","It Takes a Nation of Millions to Hold Us Back","At Fillmore East","Here's Little Richard"],["The Beatles","The Beach Boys","The Beatles","Bob Dylan","The Beatles","Marvin Gaye","The Rolling Stones","The Clash","Bob Dylan","The Beatles","Elvis Presley","Miles Davis","The Velvet Underground","The Beatles","The Jimi Hendrix Experience","Bob Dylan","Nirvana","Bruce Springsteen","Van Morrison","Michael Jackson","Chuck Berry","Robert Johnson","John Lennon / Plastic Ono Band","Stevie Wonder","James Brown","Fleetwood Mac","U2","The Who","Led Zeppelin","Joni Mitchell","Bob Dylan","The Rolling Stones","Ramones","The Band","David Bowie","Carole King","Eagles","Muddy Waters","The Beatles","Love","Sex Pistols","The Doors","Pink Floyd","Patti Smith","The Band","Bob Marley & The Wailers","John Coltrane","Public Enemy","The Allman Brothers Band","Little Richard"],["Rock","Rock","Rock","Rock","Rock, Pop","Funk / Soul","Rock","Rock","Rock, Blues","Rock","Rock","Jazz","Rock","Rock","Rock, Blues","Rock","Rock","Rock","Jazz, Rock, Blues, Folk, World, & Country","Funk / Soul, Pop","Rock","Blues","Rock","Funk / Soul","Funk / Soul","Rock","Rock","Rock","Rock","Pop","Rock, Folk, World, & Country","Rock","Rock","Rock","Rock","Rock, Pop","Rock","Folk, World, & Country","Rock","Rock","Rock","Rock","Rock","Rock","Classical, Stage & Screen","Reggae","Jazz","Hip Hop","Rock, Blues","Rock, Blues"],["Rock & Roll, Psychedelic Rock","Pop Rock, Psychedelic Rock","Psychedelic Rock, Pop Rock","Folk Rock, Blues Rock","Pop Rock","Soul","Blues Rock, Rock & Roll, Classic Rock","Punk, New Wave","Folk Rock, Rhythm & Blues","Rock & Roll, Pop Rock, Psychedelic Rock, Experimental","Rock & Roll","Modal","Garage Rock, Art Rock, Experimental","Psychedelic Rock, Classic Rock, Pop Rock","Blues Rock, Psychedelic Rock","Folk Rock, Acoustic, Ballad","Alternative Rock, Grunge","Pop Rock","Acoustic, Classic Rock, Free Improvisation","Disco","Rock & Roll","Delta Blues","Pop Rock","Soul","Rhythm & Blues, Soul","Pop Rock","Alternative Rock, Pop Rock","Hard Rock, Mod, Prog Rock, Psychedelic Rock","Blues Rock, Hard Rock","Acoustic, Ballad, Folk","Folk Rock, Folk","Blues Rock, Hard Rock","Rock & Roll, Punk","Folk Rock, Acoustic, Blues Rock","Classic Rock, Glam","Folk Rock, Soft Rock","Classic Rock","Folk","Beat, Rock & Roll","Folk Rock, Psychedelic Rock","Punk","Psychedelic Rock","Prog Rock","Art Rock","Soundtrack, Modern Classical, Contemporary, Score","Reggae, Roots Reggae","Free Jazz, Hard Bop, Modal","Conscious","Blues Rock","Rock & Roll, Rhythm & Blues"]],"colnames":["Number","Year","Album","Artist","Genre","Subgenre"],"options":{"columns":[{"header":"Number","name":"Number","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Year","name":"Year","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Album","name":"Album","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Artist","name":"Artist","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Genre","name":"Genre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Subgenre","name":"Subgenre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":{"cell":{"normal":{"showHorizontalBorder":true}}},"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}
# others builtins themes
datagrid(rolling_stones_50, theme = "striped")

  

{"x":{"nrow":50,"ncol":6,"data":[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50],[1967,1966,1966,1965,1965,1971,1972,1979,1966,1968,1976,1959,1967,1969,1967,1975,1991,1975,1968,1982,1982,1990,1970,1973,1963,1977,1987,1971,1969,1971,1965,1969,1976,1968,1972,1971,1976,2001,1963,1967,1977,1967,1973,1975,1969,1984,1965,1988,1971,1957],["Sgt. Pepper's Lonely Hearts Club Band","Pet Sounds","Revolver","Highway 61 Revisited","Rubber Soul","What's Going On","Exile on Main St.","London Calling","Blonde on Blonde","The Beatles (\"\"The White Album\"\")","The Sun Sessions","Kind of Blue","The Velvet Underground & Nico","Abbey Road","Are You Experienced","Blood on the Tracks","Nevermind","Born to Run","Astral Weeks","Thriller","The Great Twenty_Eight","The Complete Recordings","John Lennon/Plastic Ono Band","Innervisions","Live at the Apollo, 1962","Rumours","The Joshua Tree","Who's Next","Led Zeppelin","Blue","Bringing It All Back Home","Let It Bleed","Ramones","Music From Big Pink","The Rise and Fall of Ziggy Stardust and the Spiders From Mars","Tapestry","Hotel California","The Anthology","Please Please Me","Forever Changes","Never Mind the Bollocks Here's the Sex Pistols","The Doors","The Dark Side of the Moon","Horses","The Band (\"\"The Brown Album\"\")","Legend: The Best of Bob Marley and The Wailers","A Love Supreme","It Takes a Nation of Millions to Hold Us Back","At Fillmore East","Here's Little Richard"],["The Beatles","The Beach Boys","The Beatles","Bob Dylan","The Beatles","Marvin Gaye","The Rolling Stones","The Clash","Bob Dylan","The Beatles","Elvis Presley","Miles Davis","The Velvet Underground","The Beatles","The Jimi Hendrix Experience","Bob Dylan","Nirvana","Bruce Springsteen","Van Morrison","Michael Jackson","Chuck Berry","Robert Johnson","John Lennon / Plastic Ono Band","Stevie Wonder","James Brown","Fleetwood Mac","U2","The Who","Led Zeppelin","Joni Mitchell","Bob Dylan","The Rolling Stones","Ramones","The Band","David Bowie","Carole King","Eagles","Muddy Waters","The Beatles","Love","Sex Pistols","The Doors","Pink Floyd","Patti Smith","The Band","Bob Marley & The Wailers","John Coltrane","Public Enemy","The Allman Brothers Band","Little Richard"],["Rock","Rock","Rock","Rock","Rock, Pop","Funk / Soul","Rock","Rock","Rock, Blues","Rock","Rock","Jazz","Rock","Rock","Rock, Blues","Rock","Rock","Rock","Jazz, Rock, Blues, Folk, World, & Country","Funk / Soul, Pop","Rock","Blues","Rock","Funk / Soul","Funk / Soul","Rock","Rock","Rock","Rock","Pop","Rock, Folk, World, & Country","Rock","Rock","Rock","Rock","Rock, Pop","Rock","Folk, World, & Country","Rock","Rock","Rock","Rock","Rock","Rock","Classical, Stage & Screen","Reggae","Jazz","Hip Hop","Rock, Blues","Rock, Blues"],["Rock & Roll, Psychedelic Rock","Pop Rock, Psychedelic Rock","Psychedelic Rock, Pop Rock","Folk Rock, Blues Rock","Pop Rock","Soul","Blues Rock, Rock & Roll, Classic Rock","Punk, New Wave","Folk Rock, Rhythm & Blues","Rock & Roll, Pop Rock, Psychedelic Rock, Experimental","Rock & Roll","Modal","Garage Rock, Art Rock, Experimental","Psychedelic Rock, Classic Rock, Pop Rock","Blues Rock, Psychedelic Rock","Folk Rock, Acoustic, Ballad","Alternative Rock, Grunge","Pop Rock","Acoustic, Classic Rock, Free Improvisation","Disco","Rock & Roll","Delta Blues","Pop Rock","Soul","Rhythm & Blues, Soul","Pop Rock","Alternative Rock, Pop Rock","Hard Rock, Mod, Prog Rock, Psychedelic Rock","Blues Rock, Hard Rock","Acoustic, Ballad, Folk","Folk Rock, Folk","Blues Rock, Hard Rock","Rock & Roll, Punk","Folk Rock, Acoustic, Blues Rock","Classic Rock, Glam","Folk Rock, Soft Rock","Classic Rock","Folk","Beat, Rock & Roll","Folk Rock, Psychedelic Rock","Punk","Psychedelic Rock","Prog Rock","Art Rock","Soundtrack, Modern Classical, Contemporary, Score","Reggae, Roots Reggae","Free Jazz, Hard Bop, Modal","Conscious","Blues Rock","Rock & Roll, Rhythm & Blues"]],"colnames":["Number","Year","Album","Artist","Genre","Subgenre"],"options":{"columns":[{"header":"Number","name":"Number","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Year","name":"Year","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Album","name":"Album","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Artist","name":"Artist","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Genre","name":"Genre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Subgenre","name":"Subgenre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"striped","themeOptions":{"cell":{"normal":{"showHorizontalBorder":true}}},"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}datagrid(rolling_stones_50, theme = "default")

  

{"x":{"nrow":50,"ncol":6,"data":[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50],[1967,1966,1966,1965,1965,1971,1972,1979,1966,1968,1976,1959,1967,1969,1967,1975,1991,1975,1968,1982,1982,1990,1970,1973,1963,1977,1987,1971,1969,1971,1965,1969,1976,1968,1972,1971,1976,2001,1963,1967,1977,1967,1973,1975,1969,1984,1965,1988,1971,1957],["Sgt. Pepper's Lonely Hearts Club Band","Pet Sounds","Revolver","Highway 61 Revisited","Rubber Soul","What's Going On","Exile on Main St.","London Calling","Blonde on Blonde","The Beatles (\"\"The White Album\"\")","The Sun Sessions","Kind of Blue","The Velvet Underground & Nico","Abbey Road","Are You Experienced","Blood on the Tracks","Nevermind","Born to Run","Astral Weeks","Thriller","The Great Twenty_Eight","The Complete Recordings","John Lennon/Plastic Ono Band","Innervisions","Live at the Apollo, 1962","Rumours","The Joshua Tree","Who's Next","Led Zeppelin","Blue","Bringing It All Back Home","Let It Bleed","Ramones","Music From Big Pink","The Rise and Fall of Ziggy Stardust and the Spiders From Mars","Tapestry","Hotel California","The Anthology","Please Please Me","Forever Changes","Never Mind the Bollocks Here's the Sex Pistols","The Doors","The Dark Side of the Moon","Horses","The Band (\"\"The Brown Album\"\")","Legend: The Best of Bob Marley and The Wailers","A Love Supreme","It Takes a Nation of Millions to Hold Us Back","At Fillmore East","Here's Little Richard"],["The Beatles","The Beach Boys","The Beatles","Bob Dylan","The Beatles","Marvin Gaye","The Rolling Stones","The Clash","Bob Dylan","The Beatles","Elvis Presley","Miles Davis","The Velvet Underground","The Beatles","The Jimi Hendrix Experience","Bob Dylan","Nirvana","Bruce Springsteen","Van Morrison","Michael Jackson","Chuck Berry","Robert Johnson","John Lennon / Plastic Ono Band","Stevie Wonder","James Brown","Fleetwood Mac","U2","The Who","Led Zeppelin","Joni Mitchell","Bob Dylan","The Rolling Stones","Ramones","The Band","David Bowie","Carole King","Eagles","Muddy Waters","The Beatles","Love","Sex Pistols","The Doors","Pink Floyd","Patti Smith","The Band","Bob Marley & The Wailers","John Coltrane","Public Enemy","The Allman Brothers Band","Little Richard"],["Rock","Rock","Rock","Rock","Rock, Pop","Funk / Soul","Rock","Rock","Rock, Blues","Rock","Rock","Jazz","Rock","Rock","Rock, Blues","Rock","Rock","Rock","Jazz, Rock, Blues, Folk, World, & Country","Funk / Soul, Pop","Rock","Blues","Rock","Funk / Soul","Funk / Soul","Rock","Rock","Rock","Rock","Pop","Rock, Folk, World, & Country","Rock","Rock","Rock","Rock","Rock, Pop","Rock","Folk, World, & Country","Rock","Rock","Rock","Rock","Rock","Rock","Classical, Stage & Screen","Reggae","Jazz","Hip Hop","Rock, Blues","Rock, Blues"],["Rock & Roll, Psychedelic Rock","Pop Rock, Psychedelic Rock","Psychedelic Rock, Pop Rock","Folk Rock, Blues Rock","Pop Rock","Soul","Blues Rock, Rock & Roll, Classic Rock","Punk, New Wave","Folk Rock, Rhythm & Blues","Rock & Roll, Pop Rock, Psychedelic Rock, Experimental","Rock & Roll","Modal","Garage Rock, Art Rock, Experimental","Psychedelic Rock, Classic Rock, Pop Rock","Blues Rock, Psychedelic Rock","Folk Rock, Acoustic, Ballad","Alternative Rock, Grunge","Pop Rock","Acoustic, Classic Rock, Free Improvisation","Disco","Rock & Roll","Delta Blues","Pop Rock","Soul","Rhythm & Blues, Soul","Pop Rock","Alternative Rock, Pop Rock","Hard Rock, Mod, Prog Rock, Psychedelic Rock","Blues Rock, Hard Rock","Acoustic, Ballad, Folk","Folk Rock, Folk","Blues Rock, Hard Rock","Rock & Roll, Punk","Folk Rock, Acoustic, Blues Rock","Classic Rock, Glam","Folk Rock, Soft Rock","Classic Rock","Folk","Beat, Rock & Roll","Folk Rock, Psychedelic Rock","Punk","Psychedelic Rock","Prog Rock","Art Rock","Soundtrack, Modern Classical, Contemporary, Score","Reggae, Roots Reggae","Free Jazz, Hard Bop, Modal","Conscious","Blues Rock","Rock & Roll, Rhythm & Blues"]],"colnames":["Number","Year","Album","Artist","Genre","Subgenre"],"options":{"columns":[{"header":"Number","name":"Number","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Year","name":"Year","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Album","name":"Album","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Artist","name":"Artist","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Genre","name":"Genre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Subgenre","name":"Subgenre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"default","themeOptions":{"cell":{"normal":{"showHorizontalBorder":true}}},"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}

# Set global theme options
set_grid_theme(
  row.even.background = "#ddebf7",
  cell.normal.border = "#9bc2e6",
  cell.normal.showVerticalBorder = TRUE,
  cell.normal.showHorizontalBorder = TRUE,
  cell.header.background = "#5b9bd5",
  cell.header.text = "#FFF",
  cell.selectedHeader.background = "#013ADF",
  cell.focused.border = "#013ADF"
)

datagrid(rolling_stones_50)

  

{"x":{"nrow":50,"ncol":6,"data":[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50],[1967,1966,1966,1965,1965,1971,1972,1979,1966,1968,1976,1959,1967,1969,1967,1975,1991,1975,1968,1982,1982,1990,1970,1973,1963,1977,1987,1971,1969,1971,1965,1969,1976,1968,1972,1971,1976,2001,1963,1967,1977,1967,1973,1975,1969,1984,1965,1988,1971,1957],["Sgt. Pepper's Lonely Hearts Club Band","Pet Sounds","Revolver","Highway 61 Revisited","Rubber Soul","What's Going On","Exile on Main St.","London Calling","Blonde on Blonde","The Beatles (\"\"The White Album\"\")","The Sun Sessions","Kind of Blue","The Velvet Underground & Nico","Abbey Road","Are You Experienced","Blood on the Tracks","Nevermind","Born to Run","Astral Weeks","Thriller","The Great Twenty_Eight","The Complete Recordings","John Lennon/Plastic Ono Band","Innervisions","Live at the Apollo, 1962","Rumours","The Joshua Tree","Who's Next","Led Zeppelin","Blue","Bringing It All Back Home","Let It Bleed","Ramones","Music From Big Pink","The Rise and Fall of Ziggy Stardust and the Spiders From Mars","Tapestry","Hotel California","The Anthology","Please Please Me","Forever Changes","Never Mind the Bollocks Here's the Sex Pistols","The Doors","The Dark Side of the Moon","Horses","The Band (\"\"The Brown Album\"\")","Legend: The Best of Bob Marley and The Wailers","A Love Supreme","It Takes a Nation of Millions to Hold Us Back","At Fillmore East","Here's Little Richard"],["The Beatles","The Beach Boys","The Beatles","Bob Dylan","The Beatles","Marvin Gaye","The Rolling Stones","The Clash","Bob Dylan","The Beatles","Elvis Presley","Miles Davis","The Velvet Underground","The Beatles","The Jimi Hendrix Experience","Bob Dylan","Nirvana","Bruce Springsteen","Van Morrison","Michael Jackson","Chuck Berry","Robert Johnson","John Lennon / Plastic Ono Band","Stevie Wonder","James Brown","Fleetwood Mac","U2","The Who","Led Zeppelin","Joni Mitchell","Bob Dylan","The Rolling Stones","Ramones","The Band","David Bowie","Carole King","Eagles","Muddy Waters","The Beatles","Love","Sex Pistols","The Doors","Pink Floyd","Patti Smith","The Band","Bob Marley & The Wailers","John Coltrane","Public Enemy","The Allman Brothers Band","Little Richard"],["Rock","Rock","Rock","Rock","Rock, Pop","Funk / Soul","Rock","Rock","Rock, Blues","Rock","Rock","Jazz","Rock","Rock","Rock, Blues","Rock","Rock","Rock","Jazz, Rock, Blues, Folk, World, & Country","Funk / Soul, Pop","Rock","Blues","Rock","Funk / Soul","Funk / Soul","Rock","Rock","Rock","Rock","Pop","Rock, Folk, World, & Country","Rock","Rock","Rock","Rock","Rock, Pop","Rock","Folk, World, & Country","Rock","Rock","Rock","Rock","Rock","Rock","Classical, Stage & Screen","Reggae","Jazz","Hip Hop","Rock, Blues","Rock, Blues"],["Rock & Roll, Psychedelic Rock","Pop Rock, Psychedelic Rock","Psychedelic Rock, Pop Rock","Folk Rock, Blues Rock","Pop Rock","Soul","Blues Rock, Rock & Roll, Classic Rock","Punk, New Wave","Folk Rock, Rhythm & Blues","Rock & Roll, Pop Rock, Psychedelic Rock, Experimental","Rock & Roll","Modal","Garage Rock, Art Rock, Experimental","Psychedelic Rock, Classic Rock, Pop Rock","Blues Rock, Psychedelic Rock","Folk Rock, Acoustic, Ballad","Alternative Rock, Grunge","Pop Rock","Acoustic, Classic Rock, Free Improvisation","Disco","Rock & Roll","Delta Blues","Pop Rock","Soul","Rhythm & Blues, Soul","Pop Rock","Alternative Rock, Pop Rock","Hard Rock, Mod, Prog Rock, Psychedelic Rock","Blues Rock, Hard Rock","Acoustic, Ballad, Folk","Folk Rock, Folk","Blues Rock, Hard Rock","Rock & Roll, Punk","Folk Rock, Acoustic, Blues Rock","Classic Rock, Glam","Folk Rock, Soft Rock","Classic Rock","Folk","Beat, Rock & Roll","Folk Rock, Psychedelic Rock","Punk","Psychedelic Rock","Prog Rock","Art Rock","Soundtrack, Modern Classical, Contemporary, Score","Reggae, Roots Reggae","Free Jazz, Hard Bop, Modal","Conscious","Blues Rock","Rock & Roll, Rhythm & Blues"]],"colnames":["Number","Year","Album","Artist","Genre","Subgenre"],"options":{"columns":[{"header":"Number","name":"Number","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Year","name":"Year","sortable":true,"align":"right","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Album","name":"Album","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Artist","name":"Artist","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Genre","name":"Genre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}},{"header":"Subgenre","name":"Subgenre","sortable":true,"align":"left","whiteSpace":"normal","renderer":{"styles":{"wordBreak":"normal"}}}],"bodyHeight":"fitToParent","draggable":false,"usageStatistics":false,"contextMenu":null,"rowHeight":"auto"},"theme":"clean","themeOptions":{"selection":{},"scrollbar":{},"outline":{},"frozenBorder":{},"area":{"header":{},"body":{},"summary":{}},"row":{"odd":{},"even":{"background":"#ddebf7"},"dummy":{},"hover":{}},"cell":{"normal":{"border":"#9bc2e6","showVerticalBorder":true,"showHorizontalBorder":true},"header":{"background":"#5b9bd5","text":"#FFF"},"rowHeader":{},"summary":{},"selectedHeader":{"background":"#013ADF"},"selectedRowHeader":{},"focused":{"border":"#013ADF"},"focusedInactive":{},"required":{},"editable":{},"disabled":{},"invalid":{}}},"language":"en","languageOptions":[],"filters":false,"rowAttributes":[],"validationInput":false,"dataAsInput":false,"dragInput":false},"evals":[],"jsHooks":[]}
# Remove theme
reset_grid_theme()
```
