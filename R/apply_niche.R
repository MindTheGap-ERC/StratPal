apply_niche = function(x, niche_def, gc){
  #' @export
  #'
  #' @title apply niche preference
  #'
  #' @param x events, e.g. times/ages of fossil occurrences or their stratigraphic position.
  #' @param niche_def function, specifying the niche along a gradient. Should return 0 when taxon is outside of niche, and 1 when fully inside niche. Values between 0 and 1 are interpreted as probabilities.
  #' @param gc function, stands for "gradient change". Specifies how the gradient changes, e.g. with time
  #'
  #' @description
    #' Models niche preferences by removing events (fossil occurrences) when they are outside of a preferred niche using the function `thin`.
    #' Combines the functions `niche_def` and `gc` ("gradient change") to determine how the taxons' preferred environment changes with time. This is done by composing `niche_def` and `gc`. The result is then used as a thinning on the events `x`.
  #'
  #' @examples
    #' \dontrun{
    #' ## setup
    #' # using water depth as gradient
    #'  t = scenarioA$t_myr
    #'  wd = scenarioA$wd_m[,"8km"]
    #'  gc = approxfun(t, wd)
    #'  plot(t, gc(t), type = "l", xlab = "Time", ylab = "water depth [m]",
    #'   main = "gradient change with time")
    #'  # define niche
    #'  # preferred wd 10 m, tolerant to intermediate wd changes (standard deviation 10 m), non-terrestrial
    #'  niche_def = cnd(mean = 10, sd = 10, inc  = 40, cut_neg = TRUE)
    #'  plot(seq(-1, 50, by = 0.5), niche_def(seq(-1, 50, by = 0.5)), type = "l",
    #'  xlab = "water depth", ylab = "preference", main = "Niche def")
    #'  # niche pref with time
    #'  plot(t, niche_def(gc(t)), type = "l", xlab = "time", ylab = "preference", main = "pref with time")
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
    #'  vignette("event_data")
    #'  # for a longer example
    #'
    #' }
    #'
  #' @seealso [apply_taphonomy()] to model taphonomic effects based on the same principle, [thin()] for the underlying mathematical procedure.

  # function that returns niche preference as a function of y (typically time)
  change_in_niche = function(y) niche_def(gc(y))
  # thin events based on niche preference
  r = thin(x, change_in_niche)
  return(r)
  }
