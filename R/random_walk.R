random_walk = function(t, sigma = 1, mu = 0, y0 = 0){
  #' @export
  #'
  #' @title continuous time random walk
  #'
  #' @param t numeric vector with strictly increasing elements. Times at which the random walk is evaluated
  #' @param sigma variance parameter
  #' @param mu directionality parameter
  #' @param y0 starting value, i.e. value of the random walk at the first entry of `t`
  #'
  #' @description
    #' simulates a random walk as a Brownian drift
    #'
  #' @returns a list with elements `t` and `y`. `t` is a duplicate of the input parameter and is the times at which the random walk is evaluated. `y` are the values of the random walk at said times
  #'
  increments = diff(t)
  acc = cumsum(c(0, stats::rnorm(n = increments, mean = 0, sd = sqrt(increments))))
  y = sigma * acc + mu * (t-min(t)) + y0
  l = list(t = t,
           y = y)
  class(l) = c("timelist", "list")
  return(l)
}
