# model taphonomic effects

Models taphonomy by combining the change in taphonomic conditions with
the preservation potential as a function of taphonomic conditions to
determine how preservation potential changes. This is then used to
systematically remove (thin) the event data using `thin`/ remove
specimens from the `pre_paleoTS` object using `prob_remove`.

## Usage

``` r
apply_taphonomy(x, pres_potential, ctc)
```

## Arguments

- x:

  event type data, e.g. times/ages of fossil occurrences or their
  stratigraphic position, or a `pre_paleoTS`, `fossils`, or `char_mat`
  object.

- pres_potential:

  function. Takes taphonomic conditions as input and returns the
  preservation potential (a number between 0 and 1). Must be vectorized,
  meaning if given a vector, it must return a vector of equal length.

- ctc:

  function, change in taphonomic conditions (ctc) with time or
  stratigraphic position. . Must be vectorized, meaning if given a
  vector, it must return a vector of equal length.

## Value

if given event type data, a numeric vector, location/timing of events
(e.g. fossil occurrences) after the taphonomic filter is applied. If
given a `pre_paleoTS` object, returns another `pre_paleoTS` object with
reduced number of specimens. If given a `fossils` object as created by
the `FossilSim` package, returns another `fossils` object with some
occurrences removed according to preservation potential.

## See also

- [`apply_niche()`](https://mindthegap-erc.github.io/StratPal/reference/apply_niche.md)
  for modeling niche preferences based on the same principle.
  Internally, these functions are structured identically.

- [`thin()`](https://mindthegap-erc.github.io/StratPal/reference/thin.md)
  and
  [`prob_remove()`](https://mindthegap-erc.github.io/StratPal/reference/prob_remove.md)
  for the underlying mathematical procedures.

- [`perfect_preservation()`](https://mindthegap-erc.github.io/StratPal/reference/perfect_preservation.md)
  and
  [`all_preserved()`](https://mindthegap-erc.github.io/StratPal/reference/all_preserved.md)
  to model perfect preservation of fossils

- [`strat_filter()`](https://mindthegap-erc.github.io/StratPal/reference/strat_filter.md)
  for simple stratigraphic filtering in the time domain as taphonomic
  effect

- [`as_char_mat()`](https://mindthegap-erc.github.io/StratPal/reference/as_char_mat.md)
  to construct character matrices associated with stratigraphic
  information

## Examples

``` r
# see
#vignette("advanced_functionality")
# for details on usage
# or the documentation of apply_ecology for equivalent application to ecology
```
