rej_samp = function(f, x_min, x_max, n = 1L, f_max = 1, max_try = 10^4){
  #' @export
  #'
  #' @title random numbers from rejection sampling
  #'
  #' @description
    #' Rejection sampling from the (pseudo) pdf `f` in the interval between `x_min` and `x_max`. Returns `n` samples. Note that values of `f` below 0 are capped to zero
    #'
  #' @param f function. (pseudo) pdf from which the sample is drawn
  #' @param x_min number, lower limit of the examined interval
  #' @param x_max number, upper limit of the examined interval
  #' @param n integer. number of samples drawn
  #' @param f_max number, maximum value of `f` in the interval from `x_min` to `x_max`. If f attains values larger than `f_max` a warning is throw, `f_max` is adjusted, and sampling is started again
  #' @param max_try maximum number of tries in the rejection sampling algorithm. If more tries are needed, an error is thrown. If this is the case, inspect of your function `f` is well-defined and positive, and if `f_max` provides a reasonable upper bound on it. Adjust `max_try` if you are certain that both is the case, e.g. if `f` is highly irregular.
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
  x = numeric()
  warn = FALSE
  if (f_max <= 0) {stop("`f_max` must be positive.")}
  if (x_max <= x_min) {stop("`x_max` must be larger than `x_min`")}

  if (n <= 0){ return(x)  }
  failed_attempts = 0
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
        failed_attempts = 0
      } else{
        failed_attempts = failed_attempts + 1
        if (failed_attempts > max_try){
          stop(paste0("could not find sample within " , max_try ," attempts. Check `f`, reduce `f_max` or increase `max_try`. "))
        }
      }
    }
  }
  if (warn){warning(paste("f_max < f on between x_min and x_max. f_max was adjusted to be", f_max))}
  return(x)
}
