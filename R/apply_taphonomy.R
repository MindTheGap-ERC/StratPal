apply_taphonomy = function(x, pres_potential, ctc){
  #' @export
  #'
  #' @title model taphonomy
  #'
  #' @param x numeric vector. event type data, e.g. fossil occurrences
  #' @param pres_potential function. takes taphonomic conditions as input and returns the preservation potential (a number between 0 and 1)
  #' @param ctc function, change in taphonomic conditions (ctc) with time.
  #'
  #' @description
    #' models taphonomy by combining the change in taphonomic conditions with the preservation potential as a function of taphonomic conditions to determine how preservation potential changes. This is then used to systematically remove (thin) the event data using `thin`
    #'
    #'
  #' @seealso [apply_niche_pref()] for modeling niche preferences based on the same principle, [thin()] for the underlying mathematical procedure
  #'

  # function that returns preservation potential as a function of input (e.g. time or position)
  change_pres_pot = function(y) pres_potential(ctc(y))
  # thin events based on preservation potential
  r = thin(x, change_pres_pot)
  return(r)
}
