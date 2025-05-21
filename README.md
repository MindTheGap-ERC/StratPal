# StratPal

<!-- badges: start -->

[![R-CMD-check](https://github.com/MindTheGap-ERC/StratPal/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MindTheGap-ERC/StratPal/actions/workflows/R-CMD-check.yaml) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15480833.svg)](https://doi.org/10.5281/zenodo.15480833)
[![CRAN status](https://www.r-pkg.org/badges/version/StratPal)](https://CRAN.R-project.org/package=StratPal)
[![fair-software.eu](https://img.shields.io/badge/fair--software.eu-%E2%97%8F%20%20%E2%97%8F%20%20%E2%97%8F%20%20%E2%97%8F%20%20%E2%97%8B-yellow)](https://fair-software.eu)

<!-- badges: end -->

R package for stratigraphic paleobiology modeling pipelines.

## Overview

The fossil record is a joint expression of ecological, taphonomic, evolutionary, and stratigraphic processes ([Holland and Patzkowsky, 2012](#References)). This package allowing to simulate biological processes in the time domain (e.g., trait evolution, fossil abundance), and examine how their expression in the rock record (stratigraphic domain) is influenced based on age-depth models, ecological niche models, and taphonomic effects. Functions simulating common processes used in modeling trait evolution or event type data such as first/last occurrences are provided and can be used standalone or as part of a pipeline. The package comes with example data sets and tutorials in several vignettes (e.g., for transforming phylogenetic trees), which can be used as a template to set up one's own simulation.

## Authors

**Niklas Hohmann**\
Utrecht University\
email: n.h.hohmann [at] uu.nl\
Web page: [uu.nl/staff/NHohmann](https://www.uu.nl/staff/NHHohmann)\
Orcid: [0000-0003-1559-1838](https://orcid.org/0000-0003-1559-1838)

## Requirements

R version \>= 4.2

## Installation

To install the package from CRAN, run

``` r
install.packages("StratPal")
```

in your R console.

### Github

To install the package from GitHub, first install the *remotes* package by running

``` r
install.packages("remotes")
```

in the R console. Then, run

``` r
remotes::install_github(repo = "MindTheGap-ERC/StratPal",
                        build_vignettes = TRUE,
                        ref = "HEAD",
                        dependencies = TRUE)
```

to install the latest stable version of the package.

## Usage

Run

``` r
library(StratPal)
```

to load the package. Use

``` r
browseVignettes(package = "StratPal")
```

to view the available vignettes (long form documentation) with use cases or visit the package webpage ([mindthegap-erc.github.io/StratPal](https://mindthegap-erc.github.io/StratPal/)) to get started.

## Contribution

For contribution guidelines see the CONTRIBUTING.md file

## License

Apache 2.0, see LICENSE file for license text.

## Copyright

Copyright 2024 Netherlands eScience Center and Utrecht University

## Citation

To cite the package, please use both references:

-   Hohmann, N. (2025). StratPal: R package for stratigraphic paleobiology modeling pipelines (v0.5.0). Zenodo. https://doi.org/10.5281/zenodo.15480833

-   Hohmann, N. and Jarochowska, E. (2024). StratPal: An R package for creating stratigraphic paleobiology modelling pipelines. Methods In Ecology and Evolution. <https://doi.org/10.1111/2041-210X.14507>

Alternatively, you can also use the CITATION.cff file at the root of the repository, or `citation("StratPal")`.

## References {#References}

-   Holland, Steven M. and Patzkowsky, Mark E. "Stratigraphic Paleobiology : Understanding the Distribution of Fossil Taxa in Time and Space."" The University of Chicago Press; 2012.

This package uses data from

-   Hohmann, Niklas; Koelewijn, Joël R.; Burgess, Peter; Jarochowska, Emilia. 2024. "Identification of the mode of evolution in incomplete carbonate successions." BMC Ecology and Evolution, **24**, 113. [DOI: 10.1186/s12862-024-02287-2](https://doi.org/10.1186/s12862-024-02287-2).

-   Hohmann, Niklas, Koelewijn, Joël R.; Burgess, Peter; Jarochowska, Emilia. 2023. "Identification of the Mode of Evolution in Incomplete Carbonate Successions - Supporting Data." Open Science Framework. <https://doi.org/10.17605/OSF.IO/ZBPWA>, published under the [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) license.

## Funding information

Funded by the European Union (ERC, MindTheGap, StG project no 101041077). Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Research Council. Neither the European Union nor the granting authority can be held responsible for them. ![European Union and European Research Council logos](https://erc.europa.eu/sites/default/files/2023-06/LOGO_ERC-FLAG_FP.png)
