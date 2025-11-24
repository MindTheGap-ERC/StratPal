# thin a series of events (e.g. fossil occurrences)

Thins a vector of events using the function thin, meaning the
probability that the ith event in x is preserved is given by
*thin(x(i))*. Values of `thin` below 0 and above 1 are ignored. Is used
to model niche preferences in `apply_niche` and taphonomic effects in
`apply_taphonomy`.

## Usage

``` r
thin(x, thin)
```

## Arguments

- x:

  numeric vectors with events (e.g. locations, height, times)

- thin:

  a function used for thinning

## Value

numeric vector, events after thinning. Depending on the modeling
framework, these events can represent fossil ages/locations or
first/last occurrences, and the thinning taphonomic or ecological
effects.

## See also

- [`apply_niche()`](https://mindthegap-erc.github.io/StratPal/reference/apply_niche.md)
  and
  [`apply_taphonomy()`](https://mindthegap-erc.github.io/StratPal/reference/apply_taphonomy.md)
  for use cases with biological meaning. Use `thin` to model effects of
  taphonomy and ecology for event data.

## Examples

``` r
x = p3(rate = 100, from = 0, to = 3 * pi) # simulate Poisson point process
y = thin(x, sin)
hist(y) # not how negative values of sin are treated as 0

yy = thin(x, function(x) 5 * sin(x))
hist(yy) # note how values of 5 * sin above 1 are not affecting the thinning


```
