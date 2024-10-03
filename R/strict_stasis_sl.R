strict_stasis_sl = function(t, mean = 0, intrapop_var = 1, n_per_sample = 10){

  #' @export
  #'
  #' @title simulate strict phenotypic stasis (specimen level)
  #'
  #' @param t times at which the traits are determined
  #' @param mean mean trait value
  #' @param intrapop_var intrapopulation variance, determines how much specimens from the same population vary
  #' @param n_per_sample integer, number of specimens sampled per population/sampling locality/time
  #'
  #' @description
    #' simulates strict stasis on the population level (Hunt et al. 2015). This means each population has the same mean trait value, and all deviations are due to the fact that specimens traits differ from this value due to randomness.
    #'
  #'
  #' @returns an object of S3 class `pre_paleoTS`, inherits from `timelist` and `list`. The list has two elements: `t`, containing a vector of times of sampling, and `vals`, a list of trait values of the same length as `t`, with element containing trait values of individual specimens.  This object can be transformed using `apply_taphonomy`, `apply_niche` or `time_to_strat`, and then reduced to a `paleoTS` object using `reduce_to_paleoTS`. This can then be used to test for different modes of evolution.
  #'
  #' @seealso
    #' * [stasis_sl()] for the (non-strict) equivalent
    #' * [reduce_to_paleoTS()] to transform outputs into `paleoTS` format
    #' * [random_walk_sl()] and [ornstein_uhlenbeck_sl()] for other modes of evolution
  #'
  #' @examples
    #'
    #' library("paleoTS")
    #' x = strict_stasis_sl(1:5, mean = 2, intrapop_var = 2) # simulate strict stasis
    #' y = reduce_to_paleoTS(x)   # transform into paloeTS format
    #' plot(y) # plot using paleoTS package
    #'
    #' # see also
    #' #vignette("paleoTS_functionality")
    #' #for details and advanced usage
    #'
    #'
    #'
  #'
  #' @references
    #' * Hunt, Gene, Melanie J. Hopkins, and Scott Lidgard. 2015. “Simple versus Complex Models of Trait Evolution and Stasis as a Response to Environmental Change.” Proceedings of the National Academy of Sciences of the United States of America 112 (16): 4885–90. https://doi.org/10.1073/pnas.1403662111.

  if (intrapop_var <= 0){
    stop("parameter \'intrapop_var\' must me >0 ")
  }
  if (n_per_sample <1){
    stop("parameter \'n_per_sample\' must be >=1")
  }

x = stasis_sl(t, mean = mean, sd = 0, intrapop_var = intrapop_var, n_per_sample = n_per_sample)

return(x)
}
