# reduce pre-paleoTS format to paleoTS

paleoTS is a format for paleontological time series. It is a summary
format where interpopulation variance is provided as a parameter. As a
result, taphonomic and ecological effects that act on individual
specimens can not be modeled for paleoTS objects. To resolve this, the
pre_paleoTS format tracks each specimen individually. This function
reduces the pre-paleoTS format into standard paleoTS object, which can
be used by the paleoTS package.

## Usage

``` r
reduce_to_paleoTS(x, min_n = 1, na.rm = TRUE, ...)
```

## Arguments

- x:

  a `pre_paleoTS` object

- min_n:

  minimum number of specimens. If the number of specimens at a sampling
  location falls below this number, the sampling location will be
  removed

- na.rm:

  Logical. If sampling locations are NA (e.g., because of erosion),
  should the sample be removed?

- ...:

  other options. currently unused

## Value

a `paleoTS` object

## See also

- [`stasis_sl()`](https://mindthegap-erc.github.io/StratPal/reference/stasis_sl.md),
  [strict_stasis_sl](https://mindthegap-erc.github.io/StratPal/reference/strict_stasis_sl.md),
  [random_walk_sl](https://mindthegap-erc.github.io/StratPal/reference/random_walk_sl.md),
  and
  [`ornstein_uhlenbeck_sl()`](https://mindthegap-erc.github.io/StratPal/reference/ornstein_uhlenbeck_sl.md)
  to simulate trait evolution on specimen level (sl), returning an
  object of type `pre_paleoTS`

## Examples

``` r
x = stasis_sl(t = 0:5)     # create pre_paleoTS object representing stasis on specimen level
y = reduce_to_paleoTS(x)   # reduce to standard paleoTS format
plot(y)

# now analyses using the paleoTS package can be applied to y
```
