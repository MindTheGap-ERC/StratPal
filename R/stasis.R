stasis = function(t, mean = 0, sd = 1){
  #' @export
  #'
  #' @title simulate phenotypic stasis
  #'
  #' @param t times at which the phenotype is determined
  #' @param mean mean value
  #' @param sd standard deviation
  #'
  #' @description
    #' simulates stasis as independent, normally distributed random variables with mean `mean` and standard deviation `sd`
    #'
  #' @examples
    #' \dontrun{
    #'  library("admtools") # required for plotting of results
    #'  t = seq(0, 1, by = 0.01)
    #'  l = stasis(t)
    #'  plot(l, type = "l") # plot lineage
    #'  l2 = stasis(t, mean = 0.5, sd = 0.3) # simulate second lineage
    #'  lines(l2$t, l2$y, col = "red") # plot second lineage
    #' }
    #'
  l = list(t = t,
           y = stats::rnorm(n = length(t), mean = mean, sd = sd))
  class(l) = c("timelist", "list")

  return(l)
}
