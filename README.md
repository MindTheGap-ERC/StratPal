# StratPal

R package for Stratigraphic Paleobiology. IN DEVELOPMENT

## Authors

__Niklas Hohmann__  
Utrecht University  
email: n.hohmann [at] uu.nl  
Web page: [uu.nl/staff/NHohmann](https://www.uu.nl/staff/NHHohmann)  
Orcid: [0000-0003-1559-1838](https://orcid.org/0000-0003-1559-1838)

## Requirements

R verion >= 4.2

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

## Usage

Run

```R
browseVignettes(package = "StratPal")
```

to view the available vignettes with use cases.

## License

Apache 2.0, see LICENSE file for license text.

## Copyright

Copyright 2024 Netherlands eScience Center and Utrecht University

## References

This package used data from

* Identification of the mode of evolution in incomplete carbonate successions
Niklas Hohmann, Joël R Koelewijn, Peter Burgess, Emilia Jarochowska
bioRxiv 2023.12.18.572098; doi: https://doi.org/10.1101/2023.12.18.572098

## Funding information

Funded by the European Union (ERC, MindTheGap, StG project no 101041077). Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Research Council. Neither the European Union nor the granting authority can be held responsible for them.
![European Union and European Research Council logos](https://erc.europa.eu/sites/default/files/2023-06/LOGO_ERC-FLAG_FP.png)
