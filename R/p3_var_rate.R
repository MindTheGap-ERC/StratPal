p3_var_rate = function(x, y = NULL, from = 0, to = 1, fmax = 1, n = NULL){

  #' @export
  #'
  #' @title simulate variable rate Poisson point process
  #'
  #' @param x numeric vector or function. If x is a function, it is used to specify the variable rate. If x is a vector, x and y together specify the variable rate using linear interpolation
  #' @param y numeric vector. If specified, determines the variable rate. This is done by using linear interpolation between the values of y. Here x specifies the ordinate and y the abscissa
  #' @param from lower limit on the event
  #' @param to upper limit on the event
  #' @param fmax maximum rate in the ovserved interval. Required for rejection sampling, If this value is too low, results will be biased
  #' @param n NULL or an integer. Number of events drawn. If NULL, the number of events is determined by the rate (specified by x and y). If an integer is passed, n events are returned.
  #'

  if (from <= to){
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

  s = c()
  while (length(s) < n){
    # rejection sampling goes here
  }
  return(s)
}
