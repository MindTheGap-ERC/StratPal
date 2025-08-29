# StratPal (development version)

# StratPal 0.6.0

* Add wrappers `last_occ` and `range_offset` to determine position/timing of last occurrences & biostratigraphic precision as a function of taphonomy, ecology, abundance, and stratigraphy.

# StratPal 0.5.0

* Expand integration with the `FossilSim` package

# StratPal 0.4.0

* Convenience functions `discrete_niche` and `discrete_gradient` for defining niches from discrete categories

* Integration with the `FossilSim` package, specifically transformation of `fossils` objects

# StratPal 0.3.1

* Update citation info and vignettes after publication of manuscript

# StratPal 0.3.0

* bug fix for `apply_niche` and `apply_taphonomy` for `pre_paleoTS` format

* plotting for `pre_paleoTS` fixed

# StratPal 0.2.0

* introduce S3 class `pre_paleoTS` with simulation procedures for trait evolution on specimen level

* add `reduce_to_paleoTS` to reduce `pre_paleoTS` to `paleoTS` format for linking with`paleoTS` package

* add niche modeling and taphonomic effects for `pre_paleoTS` via dispatch of `apply_niche` and `apply_taphonomy`

* add more tests

* add input checks

# StratPal 0.1.1

* add citation and DOI

# StratPal 0.1.0

* add simulation of point processes (constant and variable rate Poisson point processes)

* rejections sampling as basis for point processes

* thinning functionality for point processes

* simulations of basic modes of evolution (stasis, random walk, OU)

* basic niche modeling

* add example data
