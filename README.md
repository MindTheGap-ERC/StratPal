# StratPal

<!-- badges: start -->
[![R-CMD-check](https://github.com/MindTheGap-ERC/StratPal/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MindTheGap-ERC/StratPal/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

R package for stratigraphic paleobiology modeling pipelines.

## Authors

__Niklas Hohmann__  
Utrecht University  
email: n.hohmann [at] uu.nl  
Web page: [uu.nl/staff/NHohmann](https://www.uu.nl/staff/NHHohmann)  
Orcid: [0000-0003-1559-1838](https://orcid.org/0000-0003-1559-1838)

## Requirements

R version >= 4.2

## Installation

To install the package, first install the _remotes_ package by running

```R
install.packages("remotes")
```

in the R console. Then, run

```R
remotes::install_github(repo = "MindTheGap-ERC/StratPal",
                        build_vignettes = TRUE,
                        ref = "HEAD",
                        dependencies = TRUE)
```

to install the lastest stable version of the package.

## Usage

Run

```R
library(StratPal)
```

to load the package. Use

```R
browseVignettes(package = "StratPal")
```

to view the available vignettes (long form documentation) with use cases or visit the package webpage ([mindthegap-erc.github.io/StratPal](https://mindthegap-erc.github.io/StratPal/)) to get started.

## License

Apache 2.0, see LICENSE file for license text.

## Copyright

Copyright 2024 Netherlands eScience Center and Utrecht University

## References

This package uses data from

* Identification of the mode of evolution in incomplete carbonate successions
Niklas Hohmann, Joël R Koelewijn, Peter Burgess, Emilia Jarochowska
bioRxiv 2023.12.18.572098; doi: [10.1101/2023.12.18.572098](https://doi.org/10.1101/2023.12.18.572098), published under a [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) license.

## Funding information

Funded by the European Union (ERC, MindTheGap, StG project no 101041077). Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Research Council. Neither the European Union nor the granting authority can be held responsible for them.
![European Union and European Research Council logos](https://erc.europa.eu/sites/default/files/2023-06/LOGO_ERC-FLAG_FP.png)
