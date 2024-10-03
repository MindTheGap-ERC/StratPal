apply_taphonomy = function(x, pres_potential, ctc){
  #' @export
  #'
  #' @title model taphonomic effects
  #'
  #' @param x event type data, e.g. times/ages of fossil occurrences or their stratigraphic position, or a `pre_paleoTS` object.
  #' @param pres_potential function. Takes taphonomic conditions as input and returns the preservation potential (a number between 0 and 1). Must be vectorized, meaning if given a vector, it must return a vector of equal length.
  #' @param ctc function, change in taphonomic conditions (ctc) with time or stratigraphic position. . Must be vectorized, meaning if given a vector, it must return a vector of equal length.
  #'
  #' @description
    #' Models taphonomy by combining the change in taphonomic conditions with the preservation potential as a function of taphonomic conditions to determine how preservation potential changes. This is then used to systematically remove (thin) the event data using `thin`/ remove specimens from the `pre_paleoTS` object using `prob_remove`.
    #'
    #'
  #' @seealso
    #' * [apply_niche()] for modeling niche preferences based on the same principle. Internally, these functions are structured identically.
    #' * [thin()] and [prob_remove()] for the underlying mathematical procedures.
  #'
  #' @returns if given event type data, a numeric vector, location/timing of events (e.g. fossil occurrences) after the taphonomic filter is applied. If given a `pre_paleoTS` object, returns another `pre_paleoTS` object with reduced number of specimens.
  #'
  #' @examples
    #'
    #' # see
    #' #vignette("advanced_functionality")
    #' # for details on usage
    #'
    #'
 UseMethod("apply_taphonomy")

}

apply_taphonomy.numeric = function(x, pres_potential, ctc){
  #' @export
  # function that returns preservation potential as a function of input (e.g. time or position)
  change_pres_pot = function(y) pres_potential(ctc(y))
  # thin events
  r = thin(x, change_pres_pot)
  return(r)
}

apply_taphonomy.pre_paleoTS = function(x, pres_potential, ctc){
  #' @export
  #'
  # function that returns preservation potential as a function of input (e.g. time or position)
  change_pres_pot = function(y) pres_potential(ctc(y))
  if (inherits(x, "timelist")){
    thin_vals = change_pres_pot(x$t)
  }
  if (inherits(x, "stratlist")){
    thin_vals = change_pres_pot(x$h)
  }
  for (i in seq_along(thin_vals)){
    r = prob_remove(x$vals[[i]], prob = thin_vals[i])
    x$vals[[i]] = x$vals[[i]][as.logical(r)]
  }
  return(x)
}
