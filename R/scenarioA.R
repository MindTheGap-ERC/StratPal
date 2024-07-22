#' @title example data, scenario A from Hohmann et al. (2024)
#'
#' @description
  #' Scenario A as described in Hohmann et al. (2024), published in Hohmann et al. (2023). Contains data from a carbonate platform simulated using CarboCAT Lite (Burgess 2013, 2023)
#'
#'
#' @format A list with 6 elements:
#'
#' * `t_myr` : numeric vector. timesteps of the simulation in Myr
#' * `sl_m` : numeric vector. eustatic sea level in m
#' * `dist_from_shore` : character vector. Distance from shore in km of locations at which the observations were made
#' * `h_m` : matrix of size length(t_myr) x length(dist_from_shore). Accumulated sediment height in m at examined locations
#' * `wd_m`: matrix of size length(t_myr) x length(dist_from_shore). Water depth in m at examined locations
#' * `strat_col`: list with length(dist_from shore) elements. Represents a stratigraphic column. Each element is a list with two elements:
#'      * `bed_thickness_m`: numeric vector. Bed thickness in m
#'      * `facies_code` : integer vector. facies code of the bed
#'
#'
#' @references
  #' * Burgess, Peter. 2013. "CarboCAT: A cellular automata model of heterogeneous carbonate strata." Computers & Geosciences. \doi{10.1016/j.cageo.2011.08.026}.
  #' * Burgess, Peter. 2023. "CarboCATLite v1.0.1." Zenodo. \doi{10.5281/zenodo.8402578}
  #' * Hohmann, Niklas; Koelewijn, Joël R.; Burgess, Peter; Jarochowska, Emilia. 2024. "Identification of the mode of evolution in incomplete carbonate successions." BMC Ecology and Evolution, In Press. \doi{10.1101/2023.12.18.572098}.
  #' * Hohmann, Niklas, Koelewijn, Joël R.; Burgess, Peter; Jarochowska, Emilia. 2023. “Identification of the Mode of Evolution in Incomplete Carbonate Successions - Supporting Data.” Open Science Framework. \doi{10.17605/OSF.IO/ZBPWA}, published under the [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) license.
"scenarioA"
