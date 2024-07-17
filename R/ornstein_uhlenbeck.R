ornstein_uhlenbeck = function(t, mu = 0, theta = 1, sigma = 1, y0 = 0){
  #' @export
  #'
  #' @title simulate ornstein-uhlenbeck (OU) process
  #'
  #' @param t times at which the process is simulated
  #' @param mu numeric, long term mean
  #' @param theta numeric, mean reversion speed
  #' @param sigma positive scalar, strength of randomness
  #' @param y0 scalar. initial value (value of process at the first entry of t)
  #'
  #' @description
    #' simulates ornstein-uhlenbeck using the Euler-Maruyame method. The process is simulated on a scale of 0.25 * min(diff(t)) and then interpolated to the values of `t`.
    #'
  #' @returns a list with two elements: `t` and `y`. `t` is a duplicate of the input `t`, `y` are the values of the OU process at these times. Outputs are of class `timelist` and can thus be plotted directly using `plot`, see `?plot.timelist`

  if (y0 == "stationary"){
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
