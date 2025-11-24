# simulate (un)biased random walk

Simulates a (continuous time) random walk as a Brownian drift. For
`mu = 0` the random walk is unbiased, otherwise it is biased.

## Usage

``` r
random_walk(t, sigma = 1, mu = 0, y0 = 0)
```

## Arguments

- t:

  numeric vector with strictly increasing elements, can be
  heterodistant. Times at which the random walk is evaluated

- sigma:

  positive number, variance parameter

- mu:

  number, directionality parameter

- y0:

  number, starting value (value of the random walk at the first entry of
  `t`)

## Value

A list with elements `t` and `y`. `t` is a duplicate of the input
parameter and is the times at which the random walk is evaluated. `y`
are the values of the random walk at said times. Output list is of S3
class `timelist` (inherits from `list`) and can thus be plotted directly
using `plot`, see
[`?admtools::plot.timelist`](https://mindthegap-erc.github.io/admtools/reference/plot.timelist.html)

## See also

- [`stasis()`](https://mindthegap-erc.github.io/StratPal/reference/stasis.md)
  and
  [`ornstein_uhlenbeck()`](https://mindthegap-erc.github.io/StratPal/reference/ornstein_uhlenbeck.md)
  to simulate other modes of evolution

- [`random_walk_sl()`](https://mindthegap-erc.github.io/StratPal/reference/random_walk_sl.md)
  to simulate random walk on specimen level - for usage in conjunction
  with the `paleoTS` package

## Examples

``` r
library("admtools") # required for plotting of results
t = seq(0, 1, by = 0.01)
l = random_walk(t, sigma = 3) # high variability, no direction
plot(l, type = "l")
l2 = random_walk(t, mu = 1) # low variabliity, increasing trend
lines(l2$t, l2$y, col = "red")


```
