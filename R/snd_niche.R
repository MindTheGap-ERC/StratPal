snd_niche = function(opt, tol, prob_modifier = 1, cutoff_val = NULL){
  #'
  #' @export
  #'
  #' @title simple niche model
  #'
  #' @param opt optimum value, gradient value where collection probability is highest
  #' @param tol tolerance to changes in gradient. For large values, collection probability drops off slower away from `opt`
  #' @param prob_modifier collection probability modifier, collection probability at `opt`.
  #' @param cutoff_val NULL or a number. If a number, all collection probabilities at gradient values below `cutoff_value` are set to 0. This can for example be used to model exclusively marine species when the gradient is water depth (see examples).
  #'
  #' @returns a function for usage with `apply_niche`.
  #'
  #' @examples
    #' \dontrun{
    #' # using water depth as niche
    #' wd = seq(-3, 40, by = 0.5)
    #' f = snd_niche(opt = 10, tol = 5)
    #'
    #' plot(wd, f(wd), xlab = "Water depth", ylab = "Prob. of collection")
    #' # set cutoff value at to 0 to model non-terrestrial species.
    #' f = snd_niche(opt = 10, tol = 5, cutoff_val = 0)
    #' plot(wd, f(wd), xlab = "Water depth", ylab = "Prob. of collection")
    #'
    #' # see also
    #' vignette("event_data")
    #' #for examples how to use it for niche modeling
    #' }
    #'
  #'
  #' @seealso [apply_niche()] for usage of the returned function, [bounded_niche()] for another niche model
  #' @description
    #' Defines niche model based in the "Probability of collection" model by Holland and Patzkowsky (1999).
    #' The collection probability follows the shape of a bell curve across a gradient, where `opt` determines the peak (mean) of the bell curve, and `tol` the standard deviation. "snd" stands for "scaled normal distribution", as the collection probability has the shape of the probability density of the normal distribution.
  #' @references * Holland, Steven M. and Patzkowsky, Mark E. 1999. "Models for simulating the fossil record." Geology. https://doi.org/10.1130/0091-7613(1999)027%3C0491:MFSTFR%3E2.3.CO;2

  if (tol <= 0){
    stop("Need positive \"tol\" parameter.")
  }
  if (prob_modifier <= 0){
    stop("Need positive \"prob_modifier\" parameter.")
  }

  fa = function(x){
    f_inv  = stats::dnorm(opt, opt, tol)
    y = pmin(prob_modifier/f_inv * stats::dnorm(x, opt, tol), rep(1, length(x)))
    if (!is.null(cutoff_val)){
      y[x<= cutoff_val] = rep(0, length(y[x<=cutoff_val]))
    }
    return(y)
  }

  return(fa)
}
