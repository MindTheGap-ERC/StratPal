# gradient or taphonomic conditions from data

Constructs a gradient or taphonomic conditions from a dataframe or list.
If `x` is a dataframe, the first two columns are used, if `x` is a list
the first two elements are used. The first entry is used as
time/stratigraphic position, and the second as gradient/recovery
probability.

## Usage

``` r
gradient_from_data(x)
```

## Arguments

- x:

  list or data frame

## Value

a function for usage as gradient or taphonomic conditions, which can be
passed to `apply_taphonomy` or `apply_niche`

## Examples

``` r
# water depth 2 km offshore as gradient
t = scenarioA$t_myr
l = list(t, scenarioA$wd_m[,"2km"])
f = gradient_from_data(l)
plot(t, f(t), type = "l")
```
