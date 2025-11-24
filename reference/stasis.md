# simulate phenotypic stasis

Simulates stasis of mean trait values as independent, normally
distributed random variables with mean `mean` and standard deviation
`sd`

## Usage

``` r
stasis(t, mean = 0, sd = 1)
```

## Arguments

- t:

  times at which the traits are determined

- mean:

  number, mean trait value

- sd:

  strictly positive number, standard deviation of traits

## Value

A list with two elements: `t` and `y`. `t` is a duplicate of the input
`t`, `y` are the corresponding trait values. Output list is of S3 class
`timelist` (inherits from `list`) and can thus be plotted directly using
`plot`, see
[`?admtools::plot.timelist`](https://mindthegap-erc.github.io/admtools/reference/plot.timelist.html)

## See also

- [`random_walk()`](https://mindthegap-erc.github.io/StratPal/reference/random_walk.md)
  and
  [`ornstein_uhlenbeck()`](https://mindthegap-erc.github.io/StratPal/reference/ornstein_uhlenbeck.md)
  to simulate other modes of evolution

- [`stasis_sl()`](https://mindthegap-erc.github.io/StratPal/reference/stasis_sl.md)
  to simulate stasis on specimen level - for usage in conjunction with
  the `paleoTS` package.

## Examples

``` r
 library("admtools") # required for plotting of results
 t = seq(0, 1, by = 0.01)
 l = stasis(t)
 plot(l, type = "l") # plot lineage
 l2 = stasis(t, mean = 0.5, sd = 0.3) # simulate second lineage
 lines(l2$t, l2$y, col = "red") # plot second lineage


```
