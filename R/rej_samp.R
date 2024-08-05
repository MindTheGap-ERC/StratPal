rej_samp = function(f, x_min, x_max, n = 1L, f_max = 1){
  #' @export
  #'
  #' @title rejection sampling
  #'
  #' @description
    #' Rejection sampling from the (pseudo) pdf `f` in the interval between `x_min` and `x_max`. Returns `n` samples. Note that values of `f` below 0 are capped to zero
    #'
  #' @param f function. (pseudo) pdf from which the sample is drawn
  #' @param x_min scalar. lower limit of the examined interval
  #' @param x_max scalar. upper limit of the examined interval
  #' @param n integer. number of samples drawn
  #' @param f_max maximum value of `f` in the interval from `x_min` to `x_max`. If f attains values larger than `f_max` a warning is throw, `f_max` is adjusted, and sampling is started again
  #'
  #' @examples
    #'
    #' f = sin
    #' x = rej_samp(f, 0, 3*pi, n = 100)
    #' hist(x) # note that no samples are drawn where sin is negative
    #'
  #' @seealso [p3_var_rate()] for the derived variable rate Poisson point process implementation.
  #'
  #' @returns numeric vector, sample of size `n` drawn from the (pseudo) pdf specified by `f`
  x = c()
  warn = FALSE
  if (f_max <= 0) {stop("`f_max` must be positive.")}
  if (x_max <= x_min) {stop("`x_max` must be larger than `x_min`")}

  if (n <= 0){ return(x)  }

  while (length(x) < n) {
    x_draw = stats::runif(1, min = x_min, max = x_max)
    if (f(x_draw) > f_max){
      warn = TRUE
      x = c()
      f_max = f_max * 1.1
    } else {
      y_draw = stats::runif(1, min = 0, max = f_max)
      if (y_draw < f(x_draw)){
        x = c(x, x_draw)
      }
    }
  }
  if (warn){warning(paste("f_max < f on between x_min and x_max. f_max was adjusted to be", f_max))}
  return(x)
}
