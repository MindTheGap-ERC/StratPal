all_preserved = function(x){
  #' @export
  #' @title Indestructible fossils
  #' @param x taphonomic conditions at which the preservation probability is evaluated
  #'
  #' @description
  #' Models perfect taphonomic conditions. Mainly used as default input to `last_occ` and `range_offset` or passed as `pres_potential` argument to `apply_taphonomy`.
  #'
  #' @seealso [last_occ()],  [range_offset()], [perfect_preservation()], and [apply_taphonomy()]
  #'
  #' @returns A vector of the same length as x with all entries replaced by 1.
  #'
  #' @examples
    #' x = p3(rate = 10, 0, 1) # model fossils
    #' y = apply_taphonomy(x, pres_potential = all_preserved, ctc = perfect_preservation)
    #' all(x == y) # true, all fossils are preserved
    #'

  return(rep(1, length(x)))
}
