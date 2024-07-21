thin = function(x, thin){
  #'
  #' @export
  #'
  #' @title thin a series of events (e.g. fossil occurrences)
  #'
  #' @param x numeric vectors with events (e.g. locations, height, times)
  #' @param thin a function used for thinning
  #'
  #'
  #' @description
    #' Thins a vector of events using the function thin, meaning the probability that the ith event in x is preserved is given by _thin(x(i))_. Values of
    #' `thin` below 0 and above 1 are ignored.
    #' Is used to model niche preferences in `apply_niche` and taphonomic effects in `apply_taphonomy`.
    #'
  #' @examples
    #' \dontrun{
    #' x = p3(rate = 100, from = 0, to = 3 * pi) # simulate Poisson point process
    #' y = thin(x, sin)
    #' hist(y) # not how negative values of sin are treated as 0
    #' yy = thin(x, function(x) 5 * sin(x))
    #' hist(yy) # note how values of 5 * sin above 1 are not affecting the thinning
    #' }
    #'
  #' @seealso [apply_niche()] and [apply_taphonomy()] for use cases with biological meaning

  p = pmax(pmin(thin(x), rep(1, length(x))), rep(0, length(x))) # cut off at 0 and 1
  ind = stats::rbinom(n = length(x), size = 1, prob = p) # determine if preserved or not
  y = x[as.logical(ind)] # select preserved events
  return(y)

}
