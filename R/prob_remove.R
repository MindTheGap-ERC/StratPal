prob_remove = function(x, prob){
  #' @export
  #'
  #' @title probabilistic removal of elements
  #'
  #' @param x vector
  #' @param prob number between 0 and 1, probability to preserve elements
  #'
  #' @description
    #' probabilistic removal of elements from x. For each element, the probability to be preserved is independent and specified by prob
    #'
  #' @returns a vector of the same type as x
  #'
  #' @examples
    #' x = prob_remove(1:10, 0.5)
    #' x
  #' @seealso [apply_niche()] and [apply_taphonomy()] use this function for transformation of `pre_paleoTS` objects

  r = stats::rbinom(length(x), size = 1, prob = prob)
  x = x[as.logical(r)]
  return(x)
}
