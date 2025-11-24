# Example Stratigraphic Architecture

## Introduction

``` r
library(StratPal)
```

This vignette provides an overview over the example stratigraphic
architecture provided with the `StratPal` package.

## Stratigraphic Context

The example data is taken from a synthetic carbonate platform simulated
using CarboKitten.jl (Hidding et al. 2025). It emulates scenario A from
Hohmann et al (2024), which was originally simulated in CarboCAT
(Burgess 2013), and is characterized by a sinusoidal sea level curve and
2 long (\> 0.5 Myr) hiatuses over the 2 Myr duration of the run.

## Dataset structure

The structure of the dataset is explained on the help pages, which is
available using

``` r
?scenarioA
```

## Simulation settings

The full code to generate simulation data and visualizations is
available [here](https://github.com/MindTheGap-ERC/StratPal_data_prep).
The simulation was run over 2 Myr at steps of 1 kyr, with data extracted
at 2, 4, 6, 8, 10, and 12 km from shore in the middle of the simulated
platform. Three carbonate factories were used: euphotic, oligophotic,
and aphotic:

![Production profile of the three carbonate
factories](platform_production_curve.png)

Production profile of the three carbonate factories

The eustatic sea level curve is a combination of third and fifth order
changes with an amplitude of 20 and 2 m and a period of 1 and 0.112 Myr:

![](stratigraphic_architecture_files/figure-html/unnamed-chunk-4-1.png)

For users interested in more details, we recommend inspecting the
simulation source code (written in Julia).

## Platform visualization

![Transect through the carbonate platform. Black lines separate systems
tracts.](platform_profile.png)

Transect through the carbonate platform. Black lines separate systems
tracts.

![Wheeler diagram of the platform, showing both dominant facies and
seidimentation rate.](platform_wheeler_diagram.png)

Wheeler diagram of the platform, showing both dominant facies and
seidimentation rate.

## References

- Hidding, Johan, Jarochowska, Emilia, Hohmann, Niklas, Liu, Xianyi
  Burgess, Peter and Spreeuw, Hanno: “CarboKitten.jl – an open source
  toolkit for carbonate stratigraphic modeling.” Preprint.
  <https://doi.org/10.5194/egusphere-2025-4561>
- Burgess, Peter. 2013. “CarboCAT: A cellular automata model of
  heterogeneous carbonate strata.” Computers & Geosciences.
  <https://doi.org/10.1016/j.cageo.2011.08.026>.
- Hohmann, Niklas; Koelewijn, Joël R.; Burgess, Peter; Jarochowska,
  Emilia. 2024. “Identification of the mode of evolution in incomplete
  carbonate successions.” BMC Ecology and Evolution 24, 113.
  <https://doi.org/10.1186/s12862-024-02287-2>.
