# range offset of taxon

Determines temporal and stratigraphic range offset, a measure of
biostratigraphic precision, as a function of time of extinction, fossil
abundance, stratigraphy, ecology, and taphonomy. Effectively a
high-level wrapper around `last_occ`, `p3`/`p3_var_rate`, `apply_niche`,
`apply_taphonomy` and `time_to_strat`/`strat_to_time` from the
`admtools` package.

## Usage

``` r
range_offset(
  t_ext,
  rate,
  adm,
  niche = trivial_niche,
  gc = trivial_gradient,
  niche_domain = "time",
  pres_potential = all_preserved,
  ctc = perfect_preservation,
  taphonomy_domain = "strat"
)
```

## Arguments

- t_ext:

  true time of extinction

- rate:

  either positive number or a function. If a number, rate of fossil
  occurrences passed to `p3`, if a function passed as rate function to
  `p3_var_rate`

- adm:

  age-depth model

- niche:

  niche model, by default the trivial niche

- gc:

  gradient change for the niche mode, by default the trivial gradient.
  See
  [`?apply_niche`](https://mindthegap-erc.github.io/StratPal/reference/apply_niche.md)

- niche_domain:

  "time" or "strat" - in which domain should the niche model be applied?

- pres_potential:

  preservation potential of fossils, by default all preserved (no
  taphonomic effects)

- ctc:

  change in taphonomic conditions, by default no change in conditions.
  See
  [`?apply_taphonomy`](https://mindthegap-erc.github.io/StratPal/reference/apply_taphonomy.md)

- taphonomy_domain:

  "time" or "strat" - in which domain should the taphonomic effects be
  applied?

## Value

a named vector with two entries:

- "h": distance between last occurrence and true height of extinction

- "t": time between last occurrence and true time of extinction

## See also

[`last_occ()`](https://mindthegap-erc.github.io/StratPal/reference/last_occ.md)
determine position/time of last occurrence of taxon

## Examples

``` r
# last occurrences 2 km from shore
h = scenarioA$h_m[,"2km"]
adm = admtools::tp_to_adm(t = scenarioA$t_myr, h = h)
offset = range_offset(t_ext = 1.8, rate = 5, adm = adm)
offset # show timing and position of last occurrences
#>          t          h 
#>  0.6411079 14.2482949 
```
