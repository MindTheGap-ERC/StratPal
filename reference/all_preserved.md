# Indestructible fossils

Models perfect taphonomic conditions. Mainly used as default input to
`last_occ` and `range_offset` or passed as `pres_potential` argument to
`apply_taphonomy`.

## Usage

``` r
all_preserved(x)
```

## Arguments

- x:

  taphonomic conditions at which the preservation probability is
  evaluated

## Value

A vector of the same length as x with all entries replaced by 1.

## See also

[`last_occ()`](https://mindthegap-erc.github.io/StratPal/reference/last_occ.md),
[`range_offset()`](https://mindthegap-erc.github.io/StratPal/reference/range_offset.md),
[`perfect_preservation()`](https://mindthegap-erc.github.io/StratPal/reference/perfect_preservation.md),
and
[`apply_taphonomy()`](https://mindthegap-erc.github.io/StratPal/reference/apply_taphonomy.md)

## Examples

``` r
x = p3(rate = 10, 0, 1) # model fossils
y = apply_taphonomy(x, pres_potential = all_preserved, ctc = perfect_preservation)
all(x == y) # true, all fossils are preserved
#> [1] TRUE
```
