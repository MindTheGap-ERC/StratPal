last_occ = function(t_ext, rate, adm, niche = trivial_niche, gc = trivial_gradient, niche_domain = "time", pres_potential = all_preserved, ctc = perfect_preservation, taphonomy_domain = "strat"){
  #' @export
  #'
  #' @title last occurrence of taxon
  #'
  #' @param t_ext true time of extinction
  #' @param rate either positive number or a function. If a number, rate of fossil occurrences passed to `p3`, if a function passed as rate function to `p3_var_rate`
  #' @param adm age-depth model
  #' @param niche niche model, by default the trivial niche
  #' @param gc gradient change for the niche mode, by default the trivial gradient. See `?apply_niche`
  #' @param niche_domain "time" or "strat" - in which domain should the niche model be applied?
  #' @param pres_potential preservation potential of fossils, by default all preserved (no taphonomic effects)
  #' @param ctc change in taphonomic conditions, by default no change in conditions. See `?apply_taphonomy`
  #' @param taphonomy_domain "time" or "strat" - in which domain should the taphonomic effects be applied?
  #'
  #' @returns a named vector with two entries:
    #' * "h": stratigraphic position of the last occurrence
    #' * "t": time of the last occurrence
  #' @description
    #' Determines the time and position of a taxons last occurrence as a function of time of extinction, fossil abundance, stratigraphy, ecology, and taphonomy. Effectively a high-level wrapper around `p3`/`p3_var_rate`, `apply_niche`, `apply_taphonomy` and `time_to_strat`/`strat_to_time` from the `admtools` package.
    #'
    #'
  #'
  #' @seealso [range_offset()] to quantify biostratigraphic precision
  #'
  #' @examples
    #' # last occurrences 2 km from shore
    #' h = scenarioA$h_m[,"2km"]
    #' adm = admtools::tp_to_adm(t = scenarioA$t_myr, h = h)
    #'l_occ = last_occ(t_ext = 1.8, rate = 5, adm = adm)
    #'l_occ # show timing and position of last occurrences
    #'
    #'
  # sanity check
  if (! niche_domain %in% c("time", "strat")){stop("unknown niche domain, use either \"time\" or \"strat\".")}
  if (! taphonomy_domain %in% c("time", "strat")){stop("unknown taphonomy domain, use either \"time\" or \"strat\".")}

  # generate occurrences in time domain
  if (is.function(rate)){
    occ = p3_var_rate(x = rate,
                      from = admtools::min_time(adm),
                      to = admtools::max_time(adm),
                      f_max = 100)
    occ = occ[occ < t_ext]
  } else {
    occ = p3(rate = rate,
             from = admtools::min_time(adm),
             to = admtools::max_time(adm))
    occ = occ[occ < t_ext]
  }

  if (length(occ) <1){return(c("t" = NA, "h" = NA))} #failsafe if no occ
  # transform into strat domain, apply niche & taphonomy models
  if (niche_domain == "time" & taphonomy_domain == "strat"){
    occ_strat = occ |>
      apply_niche(niche_def = niche, gc = gc) |>
      admtools::time_to_strat(adm, destructive = TRUE) |>
      apply_taphonomy(pres_potential = pres_potential, ctc = ctc)
  }
  if (niche_domain == "strat" & taphonomy_domain == "strat"){
    occ_strat = occ |>
      admtools::time_to_strat(adm, destructive = TRUE) |>
      apply_niche(niche_def = niche, gc = gc) |>
      apply_taphonomy(pres_potential = pres_potential, ctc = ctc)
  }
  if (niche_domain == "time" & taphonomy_domain == "time"){
    occ_strat = occ |>
      apply_niche(niche_def = niche, gc = gc) |>
      apply_taphonomy(pres_potential = pres_potential, ctc = ctc) |>
      admtools::time_to_strat(adm, destructive = TRUE)
  }
  if (niche_domain == "strat" & taphonomy_domain == "time"){
    occ_strat = occ |>
      apply_taphonomy(pres_potential = pres_potential, ctc = ctc) |>
      admtools::time_to_strat(adm, destructive = TRUE) |>
      apply_niche(niche_def = niche, gc = gc)
  }
  # select preserved occurrences
  occ_strat = occ_strat[!is.na(occ_strat)]
  if (length(occ_strat) < 1){return(c("t" = NA, "h" = NA))}
  highest_occ = max(occ_strat)
  last_occ = highest_occ |>
    admtools::strat_to_time(adm)
  return(c("t" = last_occ, "h" = highest_occ))
}
