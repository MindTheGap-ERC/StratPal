ornstein_uhlenbeck_sl = function(t, mu = 0, theta = 1, sigma = 1, y0 = 0, interpop_var = 1, n_per_sample = 10){

  #' @export
  #'
  #' @title simulate ornstein-uhlenbeck (OU) process (pre-paleoTS format)
  #'
  #' @param t times at which the process is simulated. Can be heterodistant
  #' @param mu scalar, long term mean
  #' @param theta scalar, mean reversion speed
  #' @param sigma positive scalar, strength of randomness
  #' @param y0 scalar, initial value (value of process at the first entry of t)
  #' @param interpop_var interpopulation variance, determines how many specimens from the same population vary
  #' @param n_per_sample integer, number of specimens sampled per population/sampling locality
  #'
  #' @description
  #' Simulates an Ornstein-Uhlenbeck process on specimen level (_sl). The mean trait value is simulated using the Euler-Maruyama method. The process is simulated on a scale of `0.25 * min(diff(t))` and then interpolated to the values of `t`. At each sampling location there are `n_per_sample` specimens that are normally distributed around the mean trait value with a variance of `interpop_var`.
  #'
  #' @returns an object of S3 class `pre_paleoTS`, inherits from `timelist` and `list`. The list has two elements: `t`, containing a vector of times of sampling, and `vals`, a list of trait values of the same length as `t`, with element containing trait values of individual specimens.  This object can be transformed using `apply_taphonomy`, `apply_niche` or `time_to_strat`, and then reduced to a `paleoTS` object using `reduce_to_paleoTS`. This can then be used to test for different modes of evolution.
  #'
  #' @seealso [ornstein_uhlenbeck()] to model only mean trait values
  #'

  if (interpop_var <= 0){
    stop("parameter \'interpop_var\' must me >0 ")
  }
  if (n_per_sample <1){
    stop("parameter \'n_per_sample\' must be >=1")
  }

  x = ornstein_uhlenbeck(t, sigma, mu, y0)
  r = list(t = x$t)
  vals = list()
  for (i in seq_along(x$t)){
    vals[[i]] = stats::rnorm(n = n_per_sample, mean = x$y[i], sd = sqrt(interpop_var))
  }
  r[["vals"]] = vals
  class(r) = c("pre_paleoTS","timelist",  "list")
  return(r)
}
