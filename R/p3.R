p3 = function(rate, from, to, n = NULL){
  #'
  #' @export
  #'
  #' @title  simulate fossil occurrences
  #'
  #' @param rate rate of fossil occurrences (avg. no of fossils per unit)
  #' @param from lowest possible fossil occurrence
  #' @param to highest possible fossil occurrence
  #' @param n integer of NULL (default). Number of fossil occurrences to return. If null, the number is random and determined by the rate parameter
  #'
  #' @description
    #' Simulates fossil occurrences in the interval from, to based on a Poisson point process with rate `rate`. If the parameter `n` is used, the number of fossils is conditioned to be `n`
    #'
    #'

  if (rate <= 0){ stop("Need strictly positive rate")}
  if (from >= to) {stop("parameter \"from\" needs to be smaller than \"to\".")}

  if(is.null(n)){
    n = stats::rpois(n = 1, lambda = rate * (to-from))
  }

  x = stats::runif(n = n, min = from, max = to)

  return(x)


}
