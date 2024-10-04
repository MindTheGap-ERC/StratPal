stasis_sl = function(t, mean = 0, sd = 1, intrapop_var = 1, n_per_sample = 10){
  #' @export
  #'
  #' @title simulate phenotypic stasis (specimen level)
  #'
  #' @param t times at which the traits are determined
  #' @param mean mean trait value
  #' @param sd strictly positive number, standard deviation of traits around the mean
  #' @param intrapop_var intrapopulation variance, determines how much specimens from the same population vary
  #' @param n_per_sample integer, number of specimens sampled per population/sampling locality
  #'
  #' @description
    #' simulates stasis as independent, normally distributed random variables with mean `mean` and standard deviation `sd`, draws `n_per_sample` samples from each sampling location (population) that have specified variance `intrapop_var`
    #'
  #' @seealso
    #' * [stasis()] for the version that simulates stasis of mean trait values
    #' * [strict_stasis_sl()] for more narrow definition of stasis
    #' * [reduce_to_paleoTS()] to transform into the outputs into `paleoTS` format (e.g., for plotting or further analysis)
    #' * [random_walk_sl()] and [ornstein_uhlenbeck_sl()] for other modes of evolution
  #'
  #' @returns an object of S3 class `pre_paleoTS`, inherits from `timelist` and `list`. The list has two elements: `t`, containing a vector of times of sampling, and `vals`, a list of trait values of the same length as `t`, with element containing trait values of individual specimens.  This object can be transformed using `apply_taphonomy`, `apply_niche` or `time_to_strat`, and then reduced to a `paleoTS` object using `reduce_to_paleoTS`. This can then be used to test for different modes of evolution.
  #'
  #' @examples
    #'
    #' library("paleoTS")
    #' x = stasis_sl(1:5, mean = 2, sd = 2)
    #' y = reduce_to_paleoTS(x) # turn into paleoTS format
    #' plot(y) # plot using paleoTS package
    #' # see also
    #' #vignette("paleoTS_functionality")
    #' #for details and advanced usage
    #'

  if (intrapop_var <= 0){
    stop("parameter \'intrapop_var\' must me >0 ")
  }
  if (n_per_sample <1){
    stop("parameter \'n_per_sample\' must be >=1")
  }
  x = stasis(t, mean, sd)
  r = list(t = x$t)
  vals = list()
  for (i in seq_along(x$t)){
    vals[[i]] = stats::rnorm(n = n_per_sample, mean = x$y[i], sd = sqrt(intrapop_var))
  }
  r[["vals"]] = vals
  class(r) = c("pre_paleoTS","timelist",  "list")
  return(r)
}
