# define niche from boundaries

Defines a simple niche model where the niche defined is given by a lower
limit (`g_min`) and an upper limit (`g_max`) of a gradient the taxon can
tolerate

## Usage

``` r
bounded_niche(g_min, g_max)
```

## Arguments

- g_min:

  lowest value of the gradient the taxon can tolerate

- g_max:

  highest value of the gradient the taxon can tolerate

## Value

a function describing the niche for usage with `apply_niche`. The
function returns 1 if the taxon is within its niche (the gradient is
between `g_min` and `g_max`), and 0 otherwise

## See also

- [`snd_niche()`](https://mindthegap-erc.github.io/StratPal/reference/snd_niche.md)
  for an alternative niche model

- [`discrete_niche()`](https://mindthegap-erc.github.io/StratPal/reference/discrete_niche.md)
  for defining niches based on discrete categories

- [`trivial_niche()`](https://mindthegap-erc.github.io/StratPal/reference/trivial_niche.md)
  to model organisms without niche specifications

- [`apply_niche()`](https://mindthegap-erc.github.io/StratPal/reference/apply_niche.md)
  for the function that uses the function returned

- [`vignette("advanced_functionality")`](https://mindthegap-erc.github.io/StratPal/articles/advanced_functionality.md)
  for details how to create user-defined niche models

## Examples

``` r
x = seq(0, 10, by = 0.2)
f = bounded_niche(2,5)
plot(x, f(x), type = "l",
xlab = "Gradient", ylab = "Observation probability",
main = "Observation probability of taxon")


# see also
#vignette("event_data")
# for details how to use this functionality

```
