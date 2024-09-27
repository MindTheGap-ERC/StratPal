p3_var_rate = function(x, y = NULL, from = 0, to = 1, f_max = 1, n = NULL){

  #' @export
  #'
  #' @title simulate variable rate Poisson point process
  #'
  #' @param x numeric vector or function. If x is a function, it is used to specify the variable rate. If x is a vector, x and y together specify the variable rate using linear interpolation
  #' @param y numeric vector. If specified, determines the variable rate. This is done by using linear interpolation between the values of y. Here x specifies the ordinate and y the abscissa
  #' @param from lower boundary of the observed interval
  #' @param to upper boundary of the observed
  #' @param f_max maximum value of `x` in the interval from `x_min` to `x_max`. If x attains values larger than `f_max` a warning is throw, `f_max` is adjusted, and sampling is started again
  #' @param n NULL or an integer. Number of events drawn. If NULL, the number of events is determined by the rate (specified by x and y). If an integer is passed, n events are returned.
  #'
  #' @description
    #' simulates events based on a variable rate Poisson point process. Rates can be either specified by a function passed to `x`, or by providing two vectors `x` and `y`. In this case the rate is specified by approxfun(x, y, rule = 2), i.e. by linear interpolation between the values of x (abscissa) and y (ordinate)
    #' In the context of paleontology, these events can be interpreted as fossil occurrences or first/last occurrences of species. In this case, the rate is the average number of fossil occurrences (resp first/last occurrences) per unit
  #' @examples
    #'
    #' # assuming events are fossil occurrences
    #' # then rate is the avg rate of fossil occ. per unit
    #' #linear decrease in rate from 50 at x = 0 to 0 at x = 1
    #' x = c(0, 1)
    #' y = c(50, 0)
    #' s = p3_var_rate(x, y, f_max = 50)
    #' hist(s, xlab = "Time (myr)", main = "Fossil Occurrences")
    #' # conditioned to return 100 samples
    #' s = p3_var_rate(x, y, f_max = 50, n = 100)
    #' # hand over function
    #' s = p3_var_rate(x = sin, from = 0 , to = 3 * pi, n = 50)
    #' hist(s) # note that negative values of f (sin) are ignored in sampling
    #'
    #' # see also
    #' #vignette("event_data")
    #' # for details on usage and applications to paleontology
    #'
    #'
  #' @seealso [p3()] for the constant rate implementation, [rej_samp()] for the underlying random number generation.
  #'
  #' @returns numeric vector, timing/location of events. Depending on the modeling framework, these events can represent location/age of fossils, or first/last occurrences of a group of taxa.

  if (from >= to){
    stop("\"from\" must be smaller than \"to\".")
  }
  if (!is.function(x)){
    f = stats::approxfun(x, y, method = "linear", rule = 2)
  } else {
    f = x
  }

  if (is.null(n)){
    vol = stats::integrate(f, lower = from, upper = to)$value
    n = stats::rpois(1, lambda = vol)
  }
  if (n <= 0){ return(numeric())}

  # rejection sampling
  x = rej_samp(f = f,x_min = from, x_max = to, n = n, f_max = f_max)
  return(x)

}
