bounded_niche = function(g_min, g_max){
  #' @export
  #'
  #' @title define niche from boundaries
  #'
  #' @param g_min lowest value of the gradient the taxon can tolerate
  #' @param g_max highest value of the gradient the taxon can tolerate
  #'
  #' @seealso
    #' * [snd_niche()] for an alternative niche model
    #' * [discrete_niche()] for defining niches based on discrete categories
    #' * [apply_niche()] for the function that uses the function returned
    #' * `vignette("advanced_functionality")` for details how to create user-defined niche models
  #'
  #' @returns a function describing the niche for usage with `apply_niche`. The function returns 1 if the taxon is within its niche (the gradient is between `g_min` and `g_max`), and 0 otherwise
  #'
  #' @description
    #' Defines a simple niche model where the niche defined is given by a lower limit (`g_min`) and an upper limit (`g_max`) of a gradient the taxon can tolerate
    #'
  #' @examples
    #'
    #' x = seq(0, 10, by = 0.2)
    #' f = bounded_niche(2,5)
    #' plot(x, f(x), type = "l",
    #' xlab = "Gradient", ylab = "Observation probability",
    #' main = "Observation probability of taxon")
    #'
    #' # see also
    #' #vignette("event_data")
    #' # for details how to use this functionality
    #'
    #'
  if (g_max <= g_min){
    stop("inconsistent boundaries, inputs must be ordered.")
  }
  f = function(x){
    y = rep(0, length(x))
    y[x <= g_max & x >= g_min ] = 1
    return(y)
  }
  return(f)
}
