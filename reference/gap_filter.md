# remove data associated with gaps

Removes temporal data that coincides with a gap in the stratigraphic
record Specifically, this is a transformation from the time domain unto
itself

## Usage

``` r
gap_filter(x, adm, ...)
```

## Arguments

- x:

  data, e.g., a vector of times or a fossils object

- adm:

  an age-depth model

- ...:

  parameters passed to `is_destructive`

## Value

for a numeric vector, a vector with entries that coincide with gaps
removed. For a fossils object, a smaller fossils object with fossils
that coincide with gaps removed

## See also

- [`strat_filter()`](https://mindthegap-erc.github.io/StratPal/reference/strat_filter.md)

- [`apply_taphonomy()`](https://mindthegap-erc.github.io/StratPal/reference/apply_taphonomy.md)

## Examples

``` r
#create age-depth model
adm = admtools::tp_to_adm(t = scenarioA$t_myr, h = scenarioA$h_m[,"2km"])
#simulate fossil occurrences
occ = p3(rate = 100, from = 0, to = 2)
breaks = seq(0, 2, length.out = 30)
hist(occ, main = "baseline", breaks = breaks)

hist(gap_filter(occ, adm), main = "Fossil in gaps removed", breaks = breaks)

```
