# plot pre-paleoTS objects

This functions throws an error on purpose, as `pre_paleoTS` objects can
not be plotted directly. To plot them, first use `reduce_to_paleoTS` and
use `plot` on the results

## Usage

``` r
# S3 method for class 'pre_paleoTS'
plot(x, ...)
```

## Arguments

- x:

  object

- ...:

  other arguments

## See also

[`reduce_to_paleoTS()`](https://mindthegap-erc.github.io/StratPal/reference/reduce_to_paleoTS.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x = stasis_sl(1:4)
# throws error
plot(x)
library("paleoTS")
# correct way to plot pre-paleoTS objects
y = reduce_to_paleoTs(x)
plot(y)
# this plots via the procedures of the paleoTS package (which must be installed and loaded)
} # }
```
