apply_niche = function(x, niche_def, gc){
  #' @export
  #'
  #' @title apply niche model to events
  #'
  #' @param x events, e.g. times/ages of fossil occurrences or their stratigraphic position.
  #' @param niche_def function, specifying the niche along a gradient. Should return 0 when taxon is outside of niche, and 1 when inside niche. Values between 0 and 1 are interpreted as collection probabilities.
  #' @param gc function, stands for "gradient change". Specifies how the gradient changes, e.g. with time
  #'
  #' @description
    #' Models niches by removing events (fossil occurrences) when they are outside of their niche using the function `thin`.
    #' Combines the functions `niche_def` and `gc` ("gradient change") to determine how the taxons' collection probability changes with time/position. This is done by composing `niche_def` and `gc`. The result is then used as a thinning on the events `x`.
  #'
  #' @returns numeric vector, timing/location of events (e.g. fossil ages/locations) preserved after the niche model is applied
  #'
  #' @examples
    #'
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
    #'  # for a detailed example on niche modeling
    #'
    #'
    #'
  #' @seealso [apply_taphonomy()] to model taphonomic effects based on the same principle, [thin()] for the underlying mathematical procedure. Basic niche models available are [bounded_niche()] and [snd_niche()]

  # function that returns collection probability as a function of y (typically time)
  change_in_niche = function(y) niche_def(gc(y))
  # thin events based on collection probability
  r = thin(x, change_in_niche)
  return(r)
  }
