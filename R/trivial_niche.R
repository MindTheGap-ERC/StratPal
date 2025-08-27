trivial_niche = function(x){
  #' @title trivial niche model
  #' @export
  #'
  #' @param x gradient value at which the niche is evaluated
  #' @description
    #' Models a trivial niche, meaning the niche of a taxon that has no environmental preferences. Mainly used as default input to `last_occ` and `range_offset`. When passed to `apply_niche`, this will effectively result in no niche model being applied.
    #'
  #' @seealso [last_occ()],  [range_offset()], [trivial_gradient()] and [apply_niche()]
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
