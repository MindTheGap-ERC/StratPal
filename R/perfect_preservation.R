perfect_preservation = function(x){
  #' @export
  #' @title perfect taphonomic conditions
  #' @param x time/stratigraphic position at which the taphonomic conditions are determined
  #' @description
  #' Models perfect taphonomic conditions. Mainly used as default input to `last_occ` and `range_offset` or passed as `ctc` argument to `apply_taphonomy`.
  #'
  #' @seealso [last_occ()],  [range_offset()], [all_preserved()], and [apply_taphonomy()]
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
