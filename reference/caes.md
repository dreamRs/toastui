# Construct aesthetic mappings

Low-level version of
[`ggplot2::aes`](https://ggplot2.tidyverse.org/reference/aes.html).

## Usage

``` r
caes(x, y, ...)
```

## Arguments

- x, y, ...:

  List of name-value pairs in the form aesthetic = variable.

## Value

a `list` of `quosure`.

## Examples

``` r
caes(x = month, y = value)
#> <list_of<quosure>>
#> 
#> $x
#> <quosure>
#> expr: ^month
#> env:  0x55bb0561a470
#> 
#> $y
#> <quosure>
#> expr: ^value
#> env:  0x55bb0561a470
#> 
caes(x = month, y = value, fill = city)
#> <list_of<quosure>>
#> 
#> $x
#> <quosure>
#> expr: ^month
#> env:  0x55bb0561a470
#> 
#> $y
#> <quosure>
#> expr: ^value
#> env:  0x55bb0561a470
#> 
#> $fill
#> <quosure>
#> expr: ^city
#> env:  0x55bb0561a470
#> 
```
