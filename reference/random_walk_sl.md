# simulate (un)biased random walk (specimen level)

Simulates a (continuous time) random walk as a Brownian drift on
specimen level. For `mu = 0` the random walk is unbiased, otherwise it
is biased.

## Usage

``` r
random_walk_sl(
  t,
  sigma = 1,
  mu = 0,
  y0 = 0,
  intrapop_var = 1,
  n_per_sample = 10
)
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

- intrapop_var:

  intrapopulation variance, determines how much specimens from the same
  population vary

- n_per_sample:

  integer, number of specimens sampled per population/sampling locality

## Value

an object of S3 class `pre_paleoTS`, inherits from `timelist` and
`list`. The list has two elements: `t`, containing a vector of times of
sampling, and `vals`, a list of trait values of the same length as `t`,
with element containing trait values of individual specimens. This
object can be transformed using `apply_taphonomy`, `apply_niche` or
`time_to_strat`, and then reduced to a `paleoTS` object using
`reduce_to_paleoTS`. This can then be used to test for different modes
of evolution.

## See also

- [`random_walk()`](https://mindthegap-erc.github.io/StratPal/reference/random_walk.md)
  for the equivalent function to simulate mean trait values

- [`reduce_to_paleoTS()`](https://mindthegap-erc.github.io/StratPal/reference/reduce_to_paleoTS.md)
  to transform outputs into `paleoTS` format.

- [`stasis_sl()`](https://mindthegap-erc.github.io/StratPal/reference/stasis_sl.md),
  [`strict_stasis_sl()`](https://mindthegap-erc.github.io/StratPal/reference/strict_stasis_sl.md)
  and
  [`ornstein_uhlenbeck_sl()`](https://mindthegap-erc.github.io/StratPal/reference/ornstein_uhlenbeck_sl.md)
  to simulate other modes of evolution

## Examples

``` r
library("paleoTS")
x = random_walk_sl(1:5)
y = reduce_to_paleoTS(x) # turn into paleoTS format
plot(y) # plot using the paleoTS package

# see also
#vignette("paleoTS_functionality")
#for details and advanced usage


```
