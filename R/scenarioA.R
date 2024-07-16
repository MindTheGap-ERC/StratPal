#' @title scenario A from Hohmann et al 2024
#'
#' @format A list with 6 elements:
#'
#' * `t_myr` : numeric vector. timesteps of the simulation in Myr
#' * `sl_m` : numeric vector. eustatic sea level in m
#' * `dist_from_shore` : character vector. Distance from shore in km of locations at which the observations were made
#' * `h_m` : matrix of size length(t_myr) x length(dist_from_shore). Accumulated sediment height in m at examined locations
#' * `wd_m`: matrix of size length(t_myr) x length(dist_from_shore). Water depth in m at examined locations
#' * `strat_col`: list with length(dist_from shore) elements. Represents a stratigraphic column. Each element is a list with two elements
#'  * `bed_thickness_m`: numeric vector. Bed thickness in m
#'  * `facies_code` : integer vector. facies code of the bed
"scenarioA"
