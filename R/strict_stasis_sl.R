strict_stasis_sl = function(t, mean = 0, interpop_var = 1, n_per_sample = 10){

  #' @export
  #'
  #' @title simulate strict phenotypic stasis (pre-paleoTS format)
  #'
  #' @param t times at which the traits are determined
  #' @param mean mean trait value
  #' @param interpop_var interpopulation variance, determines how much specimens from the same population vary
  #' @param n_per_sample integer, number of specimens sampled per population/sampling locality
  #'
  #' @description
    #' simulates strict stasis on the population level. This means each population has the same mean trait value, and all deviations are due to the fact that specimens traits differ from this value due to randomness.
    #'
  #'
  #' @returns an object of S3 class `pre_paleoTS`, inherits from `timelist` and `list`. The list has two elements: `t`, containing a vector of times of sampling, and `vals`, a list of trait values of the same length as `t`, with element containing trait values of individual specimens.  This object can be transformed using `apply_taphonomy`, `apply_niche` or `time_to_strat`, and then reduced to a `paleoTS` object using `reduce_to_paleoTS`. This can then be used to test for different modes of evolution.
  #'
  #' @seealso [stasis_sl()] for the (non-strict) equivalent

x = stasis_sl(t, mean = mean, sd = 0, interpop_var = interpop_var, n_per_sample = n_per_sample)

return(x)
}
