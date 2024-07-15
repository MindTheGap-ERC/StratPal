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
    #' simulates stasis as independent, normally distributed random variables with mean `mean` and standard deviatin `sd`
    #'
  l = list(t = t,
           y = stats::rnorm(n = length(t), mean = mean, sd = sd))

  return(l)
}
