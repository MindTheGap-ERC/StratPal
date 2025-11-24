# random numbers from rejection sampling

Rejection sampling from the (pseudo) pdf `f` in the interval between
`x_min` and `x_max`. Returns `n` samples. Note that values of `f` below
0 are capped to zero

## Usage

``` r
rej_samp(f, x_min, x_max, n = 1L, f_max = 1, max_try = 10^4)
```

## Arguments

- f:

  function. (pseudo) pdf from which the sample is drawn

- x_min:

  number, lower limit of the examined interval

- x_max:

  number, upper limit of the examined interval

- n:

  integer. number of samples drawn

- f_max:

  number, maximum value of `f` in the interval from `x_min` to `x_max`.
  If f attains values larger than `f_max` a warning is throw, `f_max` is
  adjusted, and sampling is started again

- max_try:

  maximum number of tries in the rejection sampling algorithm. If more
  tries are needed, an error is thrown. If this is the case, inspect of
  your function `f` is well-defined and positive, and if `f_max`
  provides a reasonable upper bound on it. Adjust `max_try` if you are
  certain that both is the case, e.g. if `f` is highly irregular.

## Value

numeric vector, sample of size `n` drawn from the (pseudo) pdf specified
by `f`

## See also

[`p3_var_rate()`](https://mindthegap-erc.github.io/StratPal/reference/p3_var_rate.md)
for the derived variable rate Poisson point process implementation.

## Examples

``` r
f = sin
x = rej_samp(f, 0, 3*pi, n = 100)
hist(x) # note that no samples are drawn where sin is negative

```
