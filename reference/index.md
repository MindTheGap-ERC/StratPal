# Package index

## Available functions

### Trait evolution

Simulate trait evolution along a lineage

- [`ornstein_uhlenbeck()`](https://mindthegap-erc.github.io/StratPal/reference/ornstein_uhlenbeck.md)
  : simulate ornstein-uhlenbeck (OU) process
- [`ornstein_uhlenbeck_sl()`](https://mindthegap-erc.github.io/StratPal/reference/ornstein_uhlenbeck_sl.md)
  : simulate ornstein-uhlenbeck (OU) process (specimen level)
- [`random_walk()`](https://mindthegap-erc.github.io/StratPal/reference/random_walk.md)
  : simulate (un)biased random walk
- [`random_walk_sl()`](https://mindthegap-erc.github.io/StratPal/reference/random_walk_sl.md)
  : simulate (un)biased random walk (specimen level)
- [`stasis()`](https://mindthegap-erc.github.io/StratPal/reference/stasis.md)
  : simulate phenotypic stasis
- [`stasis_sl()`](https://mindthegap-erc.github.io/StratPal/reference/stasis_sl.md)
  : simulate phenotypic stasis (specimen level)
- [`strict_stasis_sl()`](https://mindthegap-erc.github.io/StratPal/reference/strict_stasis_sl.md)
  : simulate strict phenotypic stasis (specimen level)

### Event type data

Simulate event type data (e.g., fossil location/ages, first/last
occurrences)

- [`last_occ()`](https://mindthegap-erc.github.io/StratPal/reference/last_occ.md)
  : last occurrence of taxon
- [`p3()`](https://mindthegap-erc.github.io/StratPal/reference/p3.md) :
  simulate Poisson point process
- [`p3_var_rate()`](https://mindthegap-erc.github.io/StratPal/reference/p3_var_rate.md)
  : simulate variable rate Poisson point process
- [`range_offset()`](https://mindthegap-erc.github.io/StratPal/reference/range_offset.md)
  : range offset of taxon
- [`rej_samp()`](https://mindthegap-erc.github.io/StratPal/reference/rej_samp.md)
  : random numbers from rejection sampling

### Ecology and taphonomy

Model ecological niches and taphonomic effects

- [`all_preserved()`](https://mindthegap-erc.github.io/StratPal/reference/all_preserved.md)
  : Indestructible fossils
- [`apply_niche()`](https://mindthegap-erc.github.io/StratPal/reference/apply_niche.md)
  : apply niche model
- [`apply_taphonomy()`](https://mindthegap-erc.github.io/StratPal/reference/apply_taphonomy.md)
  : model taphonomic effects
- [`bounded_niche()`](https://mindthegap-erc.github.io/StratPal/reference/bounded_niche.md)
  : define niche from boundaries
- [`discrete_gradient()`](https://mindthegap-erc.github.io/StratPal/reference/discrete_gradient.md)
  : construct discretized gradient
- [`discrete_niche()`](https://mindthegap-erc.github.io/StratPal/reference/discrete_niche.md)
  : niche from discrete data
- [`gradient_from_data()`](https://mindthegap-erc.github.io/StratPal/reference/gradient_from_data.md)
  : gradient or taphonomic conditions from data
- [`perfect_preservation()`](https://mindthegap-erc.github.io/StratPal/reference/perfect_preservation.md)
  : perfect taphonomic conditions
- [`prob_remove()`](https://mindthegap-erc.github.io/StratPal/reference/prob_remove.md)
  : probabilistic removal of elements
- [`snd_niche()`](https://mindthegap-erc.github.io/StratPal/reference/snd_niche.md)
  : simple niche model
- [`strat_filter()`](https://mindthegap-erc.github.io/StratPal/reference/strat_filter.md)
  : generate basic stratigraphic filter
- [`thin()`](https://mindthegap-erc.github.io/StratPal/reference/thin.md)
  : thin a series of events (e.g. fossil occurrences)
- [`trivial_niche()`](https://mindthegap-erc.github.io/StratPal/reference/trivial_niche.md)
  : trivial niche model
- [`trivial_gradient()`](https://mindthegap-erc.github.io/StratPal/reference/trivial_gradient.md)
  : model absence of environmental gradients

### Example data

Example data from stratigraphic forward models

- [`scenarioA`](https://mindthegap-erc.github.io/StratPal/reference/scenarioA.md)
  : example data, emulates scenario A from Hohmann et al. (2024)

### paleoTS functionality

Tools for linkage with the paleoTS package

- [`reduce_to_paleoTS()`](https://mindthegap-erc.github.io/StratPal/reference/reduce_to_paleoTS.md)
  : reduce pre-paleoTS format to paleoTS
- [`plot(`*`<pre_paleoTS>`*`)`](https://mindthegap-erc.github.io/StratPal/reference/plot.pre_paleoTS.md)
  : plot pre-paleoTS objects

### Miscellaneous

Miscellaneous functions

- [`as_char_mat()`](https://mindthegap-erc.github.io/StratPal/reference/as_char_mat.md)
  : construct character matrix
- [`is_char_mat()`](https://mindthegap-erc.github.io/StratPal/reference/is_char_mat.md)
  : validity of character matrices
