ornstein_uhlenbeck = function(t, mu = 0, theta = 1, sigma = 1, y0 = 0){
  #' @export
  #'
  #' @title simulate ornstein-uhlenbeck (OU) process
  #'
  #' @param t times at which the process is simulated. Can be heterodistant
  #' @param mu number, long term mean
  #' @param theta number, mean reversion speed
  #' @param sigma positive number, strength of randomness
  #' @param y0 number, initial value (value of process at the first entry of t)
  #'
  #' @description
    #' Simulates an Ornstein-Uhlenbeck process using the Euler-Maruyama method. The process is simulated on a scale of `0.25 * min(diff(t))` and then interpolated to the values of `t`. Note that different parametrizations of OU processes are used in the literature. Here we use the parametrization common in mathematics. This translates to the parametrization used in evolutionary biology (specifically, the one in Hansen (1997)) as follows:
    #'  * `sigma` is identical
    #'  * `mu` used in the `StratPal` package corresponds to `theta` sensu Hansen (1997)
    #'  * `theta` as used in the `StratPal` package corresponds to `alpha` sensu Hansen (1997)
    #'
  #' @returns A list with two elements: `t` and `y`. `t` is a duplicate of the input `t`, `y` are the values of the OU process at these times. Output list is of S3 class `timelist` (inherits from `list`) and can thus be plotted directly using `plot`, see `?admtools::plot.timelist`
  #'
  #' @seealso
    #' * [ornstein_uhlenbeck_sl()] for simulation on specimen level - for use in conjunction with `paleoTS` package
    #' * [random_walk()] and [stasis()] to simulate other modes of evolution
  #'
  #' @examples
    #'
    #' library("admtools") # required for plotting of results
    #' t = seq(0, 3, by = 0.01)
    #' l = ornstein_uhlenbeck(t, y0 = 3) # start away from optimum (mu)
    #' plot(l, type = "l")
    #' l2 = ornstein_uhlenbeck(t, y0 = 0) # start in optimum
    #' lines(l2$t, l2$y, col = "red")
    #'
  #' @references
    #' * Hansen, Thomas F. 1997. “Stabilizing Selection and the Comparative Analysis of Adaptation.” Evolution 51 (5): 1341–51. \doi{10.1111/j.1558-5646.1997.tb01457.x}.


  if (length(t) < 2){
    stop("need at least 2 entries in \"t\"")
  }
  if (sigma < 0){
    stop("paramter \"sigma\" must be positive or 0")
  }
  if (theta < 0){
    stop("paramter \"sigma\" must be positive or 0")
  }

  if (y0 == "stationary"){
    if (theta ==0){
      stop("parameter \"theta\" must be positive in stationary case")
    }
    y0 = stats::rnorm(1, mean = mu, sd = sigma / sqrt(2 * theta))
  }

  inc = 0.25 * min(diff(t))
  t2 = seq(min(t), max(t), by = inc)
  t2 = c(t2, max(t2) + inc)

  noiseIncrements = stats::rnorm(n = length(t2) - 1,mean = 0,sd = sqrt(inc))
  y2 = rep(NA, length(t2))
  y2[1] = y0

  for (j in 2:length(t2)) {
    y2[j] <- y2[j - 1] + inc * (theta * (mu - y2[j - 1])) + sigma * noiseIncrements[j - 1]
  }

  y = stats::approx(x = t2, y = y2, xout = t)$y

  l = list("t" = t,
           "y" = y)
  class(l) = c("timelist", "list")

  return(l)
}
