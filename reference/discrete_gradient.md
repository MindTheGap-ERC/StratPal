# construct discretized gradient

Constructs a discretized gradient along time/height. The gradient value
between `bounds[i]` and `bounds[i+1]` (not including) is `vals[i]`,
values above/below the largest/smallest value of `bounds` are assigned
`outval`. Helper function for usage with `discrete_niche`

## Usage

``` r
discrete_gradient(vals, bounds, outval = "")
```

## Arguments

- vals:

  vector, values of the gradient

- bounds:

  vector of strictly increasing values, e.g. times or stratigraphic
  heights.

- outval:

  value, gradient value assigned outside of values covered by `bounds`

## Value

a functions assigning continuous values (e.g., times or heights)
discrete niches

## See also

- [`discrete_niche()`](https://mindthegap-erc.github.io/StratPal/reference/discrete_niche.md)
  to construct niches based on discretized gradients

- [`apply_niche()`](https://mindthegap-erc.github.io/StratPal/reference/apply_niche.md)
  to combine
  [`discrete_niche()`](https://mindthegap-erc.github.io/StratPal/reference/discrete_niche.md)
  and `discrete_gradient()` to model the effects of niches

- [`vignette("advanced_functionality")`](https://mindthegap-erc.github.io/StratPal/articles/advanced_functionality.md)
  for details how to create user-defined niche models

## Examples

``` r
# see examples in `discrete_niche` for a use case
# and examples in `apply_niche` for the general application to different data types
# or the vignette on event data for more context
```
