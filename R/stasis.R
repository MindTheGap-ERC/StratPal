stasis = function(t, mean = 0, sd = 1){
  #' @export
  #'
  #' @title simulate phenotypic stasis
  #'
  #' @param t times at which the traits are determined
  #' @param mean number, mean trait value
  #' @param sd strictly positive number, standard deviation of traits
  #'
  #' @seealso [random_walk()] and [ornstein_uhlenbeck()] to simulate other modes of evolution, [stasis_sl()] to simulate stasis on specimen level
  #'
  #' @description
    #' Simulates stasis of mean trait values as independent, normally distributed random variables with mean `mean` and standard deviation `sd`
    #'
  #' @returns A list with two elements: `t` and `y`. `t` is a duplicate of the input `t`, `y` are the corresponding trait values. Output list is of S3 class `timelist` (inherits from `list`) and can thus be plotted directly using `plot`, see `?admtools::plot.timelist`
  #' @examples
    #'
    #'  library("admtools") # required for plotting of results
    #'  t = seq(0, 1, by = 0.01)
    #'  l = stasis(t)
    #'  plot(l, type = "l") # plot lineage
    #'  l2 = stasis(t, mean = 0.5, sd = 0.3) # simulate second lineage
    #'  lines(l2$t, l2$y, col = "red") # plot second lineage
    #'
    #'
  if (sd < 0){
    stop("paramter \"sd\" must be positive or 0")
  }
  l = list(t = t,
           y = stats::rnorm(n = length(t), mean = mean, sd = sd))
  class(l) = c("timelist", "list")

  return(l)
}
