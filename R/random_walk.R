random_walk = function(t, sigma = 1, mu = 0, y0 = 0){
  #' @export
  #'
  #' @title continuous time random walk
  #'
  #' @param t numeric vector with strictly increasing elements, can be heterodistant. Times at which the random walk is evaluated
  #' @param sigma positive scalar, variance parameter
  #' @param mu scalar, directionality parameter
  #' @param y0 scalar, starting value (value of the random walk at the first entry of `t`)
  #'
  #' @description
    #' Simulates a (continuous time) random walk as a Brownian drift
    #'
  #' @returns A list with elements `t` and `y`. `t` is a duplicate of the input parameter and is the times at which the random walk is evaluated. `y` are the values of the random walk at said times. Output list is of S3 class `timelist` (inherits from `list`) and can thus be plotted directly using `plot`, see `?admtools::plot.timelist`
  #'
  #' @examples
    #'
    #' library("admtools") # required for plotting of results
    #' t = seq(0, 1, by = 0.01)
    #' l = random_walk(t, sigma = 3) # high variability, no direction
    #' plot(l, type = "l")
    #' l2 = random_walk(t, mu = 1) # low variabliity, increasing trend
    #' lines(l2$t, l2$y, col = "red")
    #'
    #'
  if (sigma < 0){
    stop("paramter \"sigma\" must be positive or 0")
  }
  if (length(t) < 2){
    stop("need at least 2 entries in \"t\"")
  }
  increments = diff(t)
  acc = cumsum(c(0, stats::rnorm(n = increments, mean = 0, sd = sqrt(increments))))
  y = sigma * acc + mu * (t-min(t)) + y0
  l = list(t = t,
           y = y)
  class(l) = c("timelist", "list")
  return(l)
}
