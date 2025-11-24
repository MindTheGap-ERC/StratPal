# trivial niche model

Models a trivial niche, meaning the niche of a taxon that has no
environmental preferences. Mainly used as default input to `last_occ`
and `range_offset`. When passed to `apply_niche`, this will effectively
result in no niche model being applied.

## Usage

``` r
trivial_niche(x)
```

## Arguments

- x:

  gradient value at which the niche is evaluated

## Value

A vector of the same length as x with all entries replaced by 1.

## See also

[`last_occ()`](https://mindthegap-erc.github.io/StratPal/reference/last_occ.md),
[`range_offset()`](https://mindthegap-erc.github.io/StratPal/reference/range_offset.md),
[`trivial_gradient()`](https://mindthegap-erc.github.io/StratPal/reference/trivial_gradient.md)
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
