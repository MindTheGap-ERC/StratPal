#' @title example data, emulates scenario A from Hohmann et al. (2024)
#'
#' @description
  #' Reproduces Scenario A as described in Hohmann et al. (2024), published in Hohmann et al. (2023) using CarboKitten (Hidding et al. 2025), built on CarboCAT Lite (Burgess 2013, 2023)
  #' Contains stratigraphic architectures from a synthetic carbonate platform. See `vignette("stratigraphic_architecture")` for a full description of the platform.
#'
#'
#' @format A list with 5 elements:
#'
#' * `t_myr` : numeric vector. timesteps of the simulation in Myr
#' * `sl_m` : numeric vector. eustatic sea level in m
#' * `dist_from_shore` : character vector. Distance from shore in km of locations at which the observations were made. Available distances are "2km", "4km", "6km", "8km", "10km", "12km".
#' * `h_m` : matrix of size length(t_myr) x length(dist_from_shore). Accumulated sediment height in m at examined locations
#' * `wd_m`: matrix of size length(t_myr) x length(dist_from_shore). Water depth in m at examined locations
#'
#'
#' @references
  #' * Hidding, Johan, Jarochowska, Emilia, Hohmann, Niklas, Liu, Xianyi Burgess, Peter and Spreeuw, Hanno: "CarboKitten.jl – an open source toolkit for carbonate stratigraphic modeling." Preprint. \doi{10.5194/egusphere-2025-4561}
  #' * Burgess, Peter. 2013. "CarboCAT: A cellular automata model of heterogeneous carbonate strata." Computers & Geosciences. \doi{10.1016/j.cageo.2011.08.026}.
  #' * Burgess, Peter. 2023. "CarboCATLite v1.0.1." Zenodo. \doi{10.5281/zenodo.8402578}
  #' * Hohmann, Niklas; Koelewijn, Joël R.; Burgess, Peter; Jarochowska, Emilia. 2024. "Identification of the mode of evolution in incomplete carbonate successions." BMC Ecology and Evolution 24, 113. \doi{10.1186/s12862-024-02287-2}.
  #' * Hohmann, Niklas, Koelewijn, Joël R.; Burgess, Peter; Jarochowska, Emilia. 2023. “Identification of the Mode of Evolution in Incomplete Carbonate Successions - Supporting Data.” Open Science Framework. \doi{10.17605/OSF.IO/ZBPWA}, published under the [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) license.
"scenarioA"
