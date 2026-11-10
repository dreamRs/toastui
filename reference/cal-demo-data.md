# Calendar demo data

Create calendar demo data for schedules and properties

## Usage

``` r
cal_demo_data(view = c("month", "week", "day"))

cal_demo_props()
```

## Arguments

- view:

  Calendar view for which to use the data.

## Value

a `data.frame`.

## Examples

``` r

# Monthly schedule
cal_demo_data("month")
#>    calendarId        title                    body recurrenceRule
#> 1           1        Sport  Go to sport every week     Every week
#> 2           1        Sport  Go to sport every week     Every week
#> 3           1        Sport  Go to sport every week     Every week
#> 4           1     Week-end   Week-end with friends           <NA>
#> 5           2    Project 1       Coding cool stuff           <NA>
#> 6           2    Project 2       Coding cool stuff           <NA>
#> 7           2    Project 3       Coding cool stuff           <NA>
#> 8           3   Training 1       Learn programming           <NA>
#> 9           3   Training 2       Learn programming           <NA>
#> 10          2      Meeting Meeting with John Smith           <NA>
#> 11          2        Lunch     Lunch with Jane Doe           <NA>
#> 12          3   Conference       Cool R conference           <NA>
#> 13          4 Mum birthday          Dont forget!!!           <NA>
#>                  start                 end category          location
#> 1  2026-11-05 20:00:00 2026-11-05 22:00:00     time              <NA>
#> 2  2026-11-12 20:00:00 2026-11-12 22:00:00     time              <NA>
#> 3  2026-11-19 20:00:00 2026-11-19 22:00:00     time              <NA>
#> 4           2026-11-14          2026-11-15   allday              <NA>
#> 5           2026-11-02          2026-11-03   allday              <NA>
#> 6           2026-11-03          2026-11-06   allday              <NA>
#> 7           2026-11-29          2026-11-29   allday              <NA>
#> 8           2026-11-10          2026-11-13   allday              <NA>
#> 9           2026-11-17          2026-11-19   allday              <NA>
#> 10 2026-11-20 14:00:00 2026-11-20 17:00:00     time              <NA>
#> 11 2026-11-24 12:00:00 2026-11-24 14:00:00     time   Some restaurant
#> 12          2026-11-27          2026-11-28   allday Conference center
#> 13          2026-11-03          2026-11-03   allday              <NA>
#>    backgroundColor   color borderColor
#> 1             <NA>    <NA>        <NA>
#> 2             <NA>    <NA>        <NA>
#> 3             <NA>    <NA>        <NA>
#> 4             <NA>    <NA>        <NA>
#> 5          #5E81AC   white     #5E81AC
#> 6          #5E81AC   white     #5E81AC
#> 7          #5E81AC   white     #5E81AC
#> 8             <NA>    <NA>        <NA>
#> 9             <NA>    <NA>        <NA>
#> 10            <NA>    <NA>        <NA>
#> 11            <NA>    <NA>        <NA>
#> 12            <NA>    <NA>        <NA>
#> 13         #FAFAFA #FF0000     #FF0000

#' # Weekly schedule
cal_demo_data("week")
#>   calendarId    title                        body               start
#> 1          3 Course 1 Learn something interesting  2026-11-09 8:00:00
#> 2          3 Course 2 Learn something interesting 2026-11-09 14:00:00
#> 3          3 Course 3 Learn something interesting 2026-11-11 08:00:00
#> 4          3 Course 4 Learn something interesting 2026-11-12 16:00:00
#> 5          2    Lunch                  Work lunch 2026-11-10 12:00:00
#> 6          2  Meeting                Work meeting 2026-11-10 16:00:00
#> 7          1    Sport          Make some exercise 2026-11-12 07:00:00
#> 8          1    Movie       Go watch a cool movie 2026-11-11 18:00:00
#> 9          1  Day off              Take some rest          2026-11-13
#>                   end category
#> 1 2026-11-09 12:00:00     time
#> 2 2026-11-09 18:00:00     time
#> 3 2026-11-11 11:00:00     time
#> 4 2026-11-12 19:00:00     time
#> 5 2026-11-10 14:00:00     time
#> 6 2026-11-10 18:30:00     time
#> 7 2026-11-12 09:00:00     time
#> 8 2026-11-11 21:00:00     time
#> 9          2026-11-13   allday
```
