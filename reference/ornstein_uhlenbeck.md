# simulate ornstein-uhlenbeck (OU) process

Simulates an Ornstein-Uhlenbeck process using the Euler-Maruyama method.
The process is simulated on a scale of `0.25 * min(diff(t))` and then
interpolated to the values of `t`. Note that different parametrizations
of OU processes are used in the literature. Here we use the
parametrization common in mathematics. This translates to the
parametrization used in evolutionary biology (specifically, the one in
Hansen (1997)) as follows:

- `sigma` is identical

- `mu` used in the `StratPal` package corresponds to `theta` sensu
  Hansen (1997)

- `theta` as used in the `StratPal` package corresponds to `alpha` sensu
  Hansen (1997)

## Usage

``` r
ornstein_uhlenbeck(t, mu = 0, theta = 1, sigma = 1, y0 = 0)
```

## Arguments

- t:

  times at which the process is simulated. Can be heterodistant

- mu:

  number, long term mean

- theta:

  number, mean reversion speed

- sigma:

  positive number, strength of randomness

- y0:

  number, initial value (value of process at the first entry of t)

## Value

A list with two elements: `t` and `y`. `t` is a duplicate of the input
`t`, `y` are the values of the OU process at these times. Output list is
of S3 class `timelist` (inherits from `list`) and can thus be plotted
directly using `plot`, see
[`?admtools::plot.timelist`](https://mindthegap-erc.github.io/admtools/reference/plot.timelist.html)

## References

- Hansen, Thomas F. 1997. “Stabilizing Selection and the Comparative
  Analysis of Adaptation.” Evolution 51 (5): 1341–51.
  [doi:10.1111/j.1558-5646.1997.tb01457.x](https://doi.org/10.1111/j.1558-5646.1997.tb01457.x)
  .

## See also

- [`ornstein_uhlenbeck_sl()`](https://mindthegap-erc.github.io/StratPal/reference/ornstein_uhlenbeck_sl.md)
  for simulation on specimen level - for use in conjunction with
  `paleoTS` package

- [`random_walk()`](https://mindthegap-erc.github.io/StratPal/reference/random_walk.md)
  and
  [`stasis()`](https://mindthegap-erc.github.io/StratPal/reference/stasis.md)
  to simulate other modes of evolution

## Examples

``` r
library("admtools") # required for plotting of results
t = seq(0, 3, by = 0.01)
l = ornstein_uhlenbeck(t, y0 = 3) # start away from optimum (mu)
plot(l, type = "l")
l2 = ornstein_uhlenbeck(t, y0 = 0) # start in optimum
lines(l2$t, l2$y, col = "red")

```
