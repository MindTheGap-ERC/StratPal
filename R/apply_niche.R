apply_niche = function(x, niche_def, gc){
  #' @export
  #'
  #' @title apply niche model
  #'
  #' @param x events type data, e.g. vector of times/ages of fossil occurrences or their stratigraphic position, or a `pre_paleoTS` object (e.g. produced by `stasis_sl`).
  #' @param niche_def function, specifying the niche along a gradient. Should return 0 when taxon is outside of niche, and 1 when inside niche. Values between 0 and 1 are interpreted as collection probabilities. Must be vectorized, meaning if given a vector, it must return a vector of equal length.
  #' @param gc function, stands for "gradient change". Specifies how the gradient changes, e.g. with time. Must be vectorized, meaning if given a vector, it must return a vector of equal length.
  #'
  #' @description
    #' Models niches by removing events (fossil occurrences) or specimens when they are outside of their niche. For event type data, this is done using the function `thin`, for `pre_paleoTS` this is done by applying the function `prob_remove` on the specimens.
    #' Combines the functions `niche_def` and `gc` ("gradient change") to determine how the taxons' collection probability changes with time/position. This is done by composing `niche_def` and `gc`. The result is then used to remove events/specimens in `x`.
  #'
  #' @returns for a numeric vector input, returns a numeric vector, timing/location of events (e.g. fossil ages/locations) preserved after the niche model is applied. For a `pre_paleoTS` object as input, returns a `pre_paleoTS` object with specimens removed according to the niche model.
  #'
  #' @seealso
    #' * [snd_niche()] and [bounded_niche()] for template niche models
    #' * `vignette("advanced_functionality)` for how to create user-defined niche models
    #' * [apply_taphonomy()] to model taphonomic effects based on a similar principle
    #' * [thin()] and [prob_remove()] for the underlying mathematical procedures
  #'
  #' @examples
    #' ### example for event type data
    #' ## setup
    #' # using water depth as gradient
    #'  t = scenarioA$t_myr
    #'  wd = scenarioA$wd_m[,"8km"]
    #'  gc = approxfun(t, wd)
    #'  plot(t, gc(t), type = "l", xlab = "Time", ylab = "water depth [m]",
    #'   main = "gradient change with time")
    #'  # define niche
    #'  # preferred wd 10 m, tolerant to intermediate wd changes (standard deviation 10 m), non-terrestrial
    #'  niche_def = snd_niche(opt = 10, tol = 10, cutoff_val = 0)
    #'  plot(seq(-1, 50, by = 0.5), niche_def(seq(-1, 50, by = 0.5)), type = "l",
    #'  xlab = "water depth", ylab = "collection probability", main = "Niche def")
    #'  # niche pref with time
    #'  plot(t, niche_def(gc(t)), type = "l", xlab = "time",
    #'  ylab = "collection probability", main = "collection probability with time")
    #'
    #'  ## simulate fossil occurrences
    #'  foss_occ = p3(rate = 100, from = 0, to = max(t))
    #'  # foss occ without niche pref
    #'  hist(foss_occ, xlab = "time")
    #'  foss_occ_niche = apply_niche(foss_occ, niche_def, gc)
    #'  # fossil occurrences with niche preference
    #'  hist(foss_occ_niche, xlab = "time")
    #'
    #'  # see also
    #'  #vignette("event_data")
    #'  # for a detailed example on niche modeling for event type data
    #'
    #'  ### example for pre_paleoTS objects
    #'  # we reuse the niche definition and gradient change from above!
    #'  x = stasis_sl(seq(0, max(t), length.out = 10))
    #'  plot(reduce_to_paleoTS(x), main = "Trait evolution before niche modeling")
    #'  y = apply_niche(x, niche_def, gc)
    #'  plot(reduce_to_paleoTS(y), main = "Trait evolution after niche modeling")
    #'  # note that there are fewer sampling sites
    #'  # bc the taxon does not appear everywhere
    #'  # and there are fewer specimens per sampling site
    #'

 UseMethod("apply_niche")

}

apply_niche.numeric = function(x, niche_def, gc){

  #' @export
  # function that returns collection probability as a function of y (typically time)
  change_in_niche = function(y) niche_def(gc(y))
  # thin events based on collection probability
  r = thin(x, change_in_niche)
  return(r)
}

apply_niche.pre_paleoTS = function(x, niche_def, gc){
  #' @export
  #'
  change_in_niche = function(y) niche_def(gc(y))
  thin_vals = change_in_niche(x$t)
  for (i in seq_along(thin_vals)){
    r = prob_remove(x$vals[[i]], prob = thin_vals[i])
    x$vals[[i]] = r
  }
  return(x)
}
