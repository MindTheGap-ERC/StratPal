# perfect taphonomic conditions

Models perfect taphonomic conditions. Mainly used as default input to
`last_occ` and `range_offset` or passed as `ctc` argument to
`apply_taphonomy`.

## Usage

``` r
perfect_preservation(x)
```

## Arguments

- x:

  time/stratigraphic position at which the taphonomic conditions are
  determined

## Value

A vector of the same length as x with all entries replaced by 1.

## See also

[`last_occ()`](https://mindthegap-erc.github.io/StratPal/reference/last_occ.md),
[`range_offset()`](https://mindthegap-erc.github.io/StratPal/reference/range_offset.md),
[`all_preserved()`](https://mindthegap-erc.github.io/StratPal/reference/all_preserved.md),
and
[`apply_taphonomy()`](https://mindthegap-erc.github.io/StratPal/reference/apply_taphonomy.md)

## Examples

``` r
x = p3(rate = 10, 0, 1) # model fossils
y = apply_taphonomy(x, pres_potential = all_preserved, ctc = perfect_preservation)
all(x == y) # true, all fossils are preserved
#> [1] TRUE
```
