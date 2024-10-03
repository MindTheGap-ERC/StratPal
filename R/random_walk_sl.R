random_walk_sl = function(t, sigma = 1, mu = 0, y0 = 0, intrapop_var = 1, n_per_sample = 10){
  #' @export
  #'
  #' @title simulate random walk (pre-paleoTS format)
  #'
  #' @param t numeric vector with strictly increasing elements, can be heterodistant. Times at which the random walk is evaluated
  #' @param sigma positive number, variance parameter
  #' @param mu number, directionality parameter
  #' @param y0 number, starting value (value of the random walk at the first entry of `t`)
  #' @param intrapop_var intrapopulation variance, determines how many specimens from the same population vary
  #' @param n_per_sample integer, number of specimens sampled per population/sampling locality
  #'
  #' @description
    #'  Simulates a (continuous time) random walk as a Brownian drift on specimen level. For `mu = 0` the random walk is unbiased, otherwise it is biased.
    #'
  #'
  #'
  #' @returns an object of S3 class `pre_paleoTS`, inherits from `timelist` and `list`. The list has two elements: `t`, containing a vector of times of sampling, and `vals`, a list of trait values of the same length as `t`, with element containing trait values of individual specimens.  This object can be transformed using `apply_taphonomy`, `apply_niche` or `time_to_strat`, and then reduced to a `paleoTS` object using `reduce_to_paleoTS`. This can then be used to test for different modes of evolution.
  #'
  #' @seealso [random_walk()] for the equivalent function to simulate mean trait values
  #'
  #' @examples
    #' \dontrun{
    #' library("paleoTS")
    #' x = random_walk_sl(1:5)
    #' y = reduce_to_paleoTS(x) # turn into paleoTS format
    #' plot(y) # plot using the paleoTS package
    #' # see also
    #' vignette("paleoTS_functionality")
    #' #for details and advanced usage
    #' }
    #'
  #'
  if (intrapop_var <= 0){
    stop("parameter \'intrapop_var\' must me >0 ")
  }
  if (n_per_sample <1){
    stop("parameter \'n_per_sample\' must be >=1")
  }
  x = random_walk(t, sigma, mu, y0)
  r = list(t = x$t)
  vals = list()
  for (i in seq_along(x$t)){
    vals[[i]] = stats::rnorm(n = n_per_sample, mean = x$y[i], sd = sqrt(intrapop_var))
  }
  r[["vals"]] = vals
  class(r) = c("pre_paleoTS","timelist",  "list")
  return(r)
}
