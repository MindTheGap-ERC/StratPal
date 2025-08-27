trivial_gradient = function(x){
  #' @export
  #' @title model absence of environmental gradients
  #' @param x time/stratigraphic position at which the gradient is determined
  #' @description
    #' Models a constant gradient with value 1. Mainly used as default input to `last_occ` and `range_offset`.
  #'
  #' @seealso [last_occ()],  [range_offset()], [trivial_niche()], and [apply_niche()]
  #'
  #' @returns A vector of the same length as x with all entries replaced by 1.
  #'
  #' @examples
    #' x = p3(rate = 10, from = 0, to = 1) # model fossil occurrences
    #' # apply trivial niche model
    #' y = apply_niche(x, niche_def = trivial_niche, gc = trivial_gradient)
    #' all(x == y) # true, no fossils were removed
    #'
  return(rep(1, length(x)))
}
