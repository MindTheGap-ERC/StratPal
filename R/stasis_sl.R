stasis_sl = function(t, mean = 0, sd = 1, interpop_var = 1, n_per_sample = 10){
  #' @export
  #'
  #' @title simulate phenotypic stasis (pre-paleoTS format)
  #'
  #' @param t times at which the traits are determined
  #' @param mean mean trait value
  #' @param sd stictly positive number, standard deviation of traits around the mean
  #' @param interpop_var interpopulation variance, determines how much specimens from the same population vary
  #' @param n_per_sample integer, number of specimens sampled per population/sampling locality
  #'
  #' @description
    #' simulated stasis as independent, normally distributed random variables with mean `mean` and standard deviation `sd`, draws `n_per_sample` samples from each sampling location (population) that have specified variance `interpop_var`
    #'
  #' @seealso [stasis()] for the version that simulates stasis of mean trait values.
  #'
  #' @returns an object of S3 class "pre-paleoTS". This object can be transformed using `apply_taphonomy`, `apply_niche` or `time_to_strat`, and then reduced to a `paleoTS` object using `reduce_to_paleoTS`. This can then be used to test for different modes of evolution.
  #'

  if (interpop_var <= 0){
    stop("parameter \'interpop_var\' must me >0 ")
  }
  if (n_per_sample <1){
    stop("parameter \'n_per_sample\' must be >=1")
  }
  x = stasis(t, mean, sd)
  r = list(t = x$t)
  vals = list()
  for (i in seq_along(x$t)){
    vals[[i]] = stats::rnorm(n = n_per_sample, mean = x$y[i], sd = sqrt(interpop_var))
  }
  r[["vals"]] = vals
  class(r) = c("pre_paleoTS","timelist",  "list")
  return(r)
}
