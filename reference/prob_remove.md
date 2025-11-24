# probabilistic removal of elements

probabilistic removal of elements from x. For each element, the
probability to be preserved is independent and specified by prob

## Usage

``` r
prob_remove(x, prob)
```

## Arguments

- x:

  vector

- prob:

  number between 0 and 1, probability to preserve elements

## Value

a vector of the same type as x

## See also

- [`apply_niche()`](https://mindthegap-erc.github.io/StratPal/reference/apply_niche.md)
  and
  [`apply_taphonomy()`](https://mindthegap-erc.github.io/StratPal/reference/apply_taphonomy.md)
  for functions that use this function for transformation of
  `pre_paleoTS` objects

## Examples

``` r
x = prob_remove(1:10, 0.5)
x
#> [1] 1 4 5 6
x = prob_remove(1:10, 0.5)
x
#> [1] 5 7 8 9
```
