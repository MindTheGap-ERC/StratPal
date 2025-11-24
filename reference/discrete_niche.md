# niche from discrete data

Defines a niche model where the gradient based on discrete bins (given
by `binS`)

## Usage

``` r
discrete_niche(bins, rec_prob, outval = 0)
```

## Arguments

- bins:

  vector, bins on which the niche is defined. Can e.g., be numeric or
  character

- rec_prob:

  numeric vector, recovery probability for the bins. Must contain values
  between 0 and 1

- outval:

  recovery probability for values not in `bin`

## Value

a function describing the niche for usage with `apply_niche`. The
function takes (vectors of ) values from `bin` as input and returns
recovery probability for this bin.

## See also

- [`discrete_gradient()`](https://mindthegap-erc.github.io/StratPal/reference/discrete_gradient.md)
  to construct gradients based on discrete categories.

- [`snd_niche()`](https://mindthegap-erc.github.io/StratPal/reference/snd_niche.md)
  to define niches along a continuous gradient based on a scaled normal
  distribution

- [`bounded_niche()`](https://mindthegap-erc.github.io/StratPal/reference/bounded_niche.md)
  to define niches along a continuous gradient based on hard boundaries

- [`apply_niche()`](https://mindthegap-erc.github.io/StratPal/reference/apply_niche.md)
  for the function used to apply niches to time series or events

- [`vignette("advanced_functionality")`](https://mindthegap-erc.github.io/StratPal/articles/advanced_functionality.md)
  for details on how to create user-defined niche models

## Examples

``` r
# example workflow of how to construct discrete niches. For details on
#how this can be used in conjunction with apply_niche, see documentation
#therein of the vignette on event data
# we model a simple niche, separated into "shallow water" and "deep water"
bins = c("shallow water", "deep water")
# taxon is more abundant in shallow water
rec_prob = c(0.9, 0.1)
# 90 % recovery probability in shallow water, 10 % in deep water
niche = discrete_niche(bins = bins, rec_prob = rec_prob)
# lets assume for the first 1 Myr, water is shallow, followed by 0.8 Myr of deep water,
# and then 1 Myr of shallow water again
# define discretized gradient using discrete_gradient
gradient = discrete_gradient(vals = c("shallow water", "deep water", "shallow water"),
bounds = c(0,1,1.8,2.8))

# assuming constant fossil abundance before ecological effects, how many fossils do we recover?
foss_occ = p3(rate = 100, from = 0, to = 2.8)
occ_after_ecol = apply_niche(foss_occ, niche_def = niche, gc = gradient)
hist(occ_after_ecol, xlab = "Myr")

# Between 1 nad 1.8 Myr fossil abundance is reduced because this coincides with deep whater
# in which the recovery potential of the taxon is reduced (from 90 % to 10 %)
```
