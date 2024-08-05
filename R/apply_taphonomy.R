apply_taphonomy = function(x, pres_potential, ctc){
  #' @export
  #'
  #' @title model taphonomic effects
  #'
  #' @param x events, e.g. times/ages of fossil occurrences or their stratigraphic position.
  #' @param pres_potential function. Takes taphonomic conditions as input and returns the preservation potential (a number between 0 and 1)
  #' @param ctc function, change in taphonomic conditions (ctc) with time or stratigraphic position.
  #'
  #' @description
    #' Models taphonomy by combining the change in taphonomic conditions with the preservation potential as a function of taphonomic conditions to determine how preservation potential changes. This is then used to systematically remove (thin) the event data using `thin`.
    #'
    #'
  #' @seealso [apply_niche()] for modeling niche preferences based on the same principle, [thin()] for the underlying mathematical procedure.
  #'
  #' @returns numeric vector, events preserved after taphonomic effects are applied
  #'
  #' @examples
    #'
    #' # see
    #' #vignette("advanced_functionality")
    #' # for details on usage
    #'
    #'

  # function that returns preservation potential as a function of input (e.g. time or position)
  change_pres_pot = function(y) pres_potential(ctc(y))
  # thin events
  r = thin(x, change_pres_pot)
  return(r)
}
