range_offset = function(t_ext, rate, adm, niche = trivial_niche, gc = trivial_gradient, niche_domain = "time", pres_potential = all_preserved, ctc = perfect_preservation, taphonomy_domain = "strat"){
  #' @export
  #'
  #' @title range offset of taxon
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
  #' * "h": distance between last occurrence and true height of extinction
  #' * "t": time between last occurrence and true time of extinction
  #' @description
  #' Determines temporal and stratigraphic range offset, a measure of biostratigraphic precision, as a function of time of extinction, fossil abundance, stratigraphy, ecology, and taphonomy. Effectively a high-level wrapper around `last_occ`, `p3`/`p3_var_rate`, `apply_niche`, `apply_taphonomy` and `time_to_strat`/`strat_to_time` from the `admtools` package.
  #'
  #'
  #' @seealso [last_occ()] determine position/time of last occurrence of taxon
  #'
  #' @examples
    #' # last occurrences 2 km from shore
    #' h = scenarioA$h_m[,"2km"]
    #' adm = admtools::tp_to_adm(t = scenarioA$t_myr, h = h)
    #'offset = range_offset(t_ext = 1.8, rate = 5, adm = adm)
    #'offset # show timing and position of last occurrences
    #'

  lo = last_occ(t_ext = t_ext, rate = rate, adm = adm, niche = niche, gc = gc, niche_domain = niche_domain, pres_potential = pres_potential, ctc = ctc, taphonomy_domain = taphonomy_domain)
  t_ro = t_ext - unname(lo["t"])
  h_ext = admtools::time_to_strat(t_ext, adm, destructive = FALSE)
  h_ro = h_ext - unname(lo["h"])
  return(c("t" = t_ro, "h" = h_ro))
}
