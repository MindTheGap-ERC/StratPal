# simulate phenotypic stasis (specimen level)

simulates stasis as independent, normally distributed random variables
with mean `mean` and standard deviation `sd`, draws `n_per_sample`
samples from each sampling location (population) that have specified
variance `intrapop_var`

## Usage

``` r
stasis_sl(t, mean = 0, sd = 1, intrapop_var = 1, n_per_sample = 10)
```

## Arguments

- t:

  times at which the traits are determined

- mean:

  mean trait value

- sd:

  strictly positive number, standard deviation of traits around the mean

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

- [`stasis()`](https://mindthegap-erc.github.io/StratPal/reference/stasis.md)
  for the version that simulates stasis of mean trait values

- [`strict_stasis_sl()`](https://mindthegap-erc.github.io/StratPal/reference/strict_stasis_sl.md)
  for more narrow definition of stasis

- [`reduce_to_paleoTS()`](https://mindthegap-erc.github.io/StratPal/reference/reduce_to_paleoTS.md)
  to transform into the outputs into `paleoTS` format (e.g., for
  plotting or further analysis)

- [`random_walk_sl()`](https://mindthegap-erc.github.io/StratPal/reference/random_walk_sl.md)
  and
  [`ornstein_uhlenbeck_sl()`](https://mindthegap-erc.github.io/StratPal/reference/ornstein_uhlenbeck_sl.md)
  for other modes of evolution

## Examples

``` r
library("paleoTS")
x = stasis_sl(1:5, mean = 2, sd = 2)
y = reduce_to_paleoTS(x) # turn into paleoTS format
plot(y) # plot using paleoTS package

# see also
#vignette("paleoTS_functionality")
#for details and advanced usage
```
