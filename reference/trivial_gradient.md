# model absence of environmental gradients

Models a constant gradient with value 1. Mainly used as default input to
`last_occ` and `range_offset`.

## Usage

``` r
trivial_gradient(x)
```

## Arguments

- x:

  time/stratigraphic position at which the gradient is determined

## Value

A vector of the same length as x with all entries replaced by 1.

## See also

[`last_occ()`](https://mindthegap-erc.github.io/StratPal/reference/last_occ.md),
[`range_offset()`](https://mindthegap-erc.github.io/StratPal/reference/range_offset.md),
[`trivial_niche()`](https://mindthegap-erc.github.io/StratPal/reference/trivial_niche.md),
and
[`apply_niche()`](https://mindthegap-erc.github.io/StratPal/reference/apply_niche.md)

## Examples

``` r
x = p3(rate = 10, from = 0, to = 1) # model fossil occurrences
# apply trivial niche model
y = apply_niche(x, niche_def = trivial_niche, gc = trivial_gradient)
all(x == y) # true, no fossils were removed
#> [1] TRUE
```
