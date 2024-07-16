#' cnd = function(mean, sd, inc = 1){
#'   #' @export
#'   #'
#'   #' @title capped normal distribution pdf
#'   #'
#'   #' @param mean mean of normal distribution
#'   #' @param sd standard deviation
#'   #' @param inc scalar, factor by which the pdf in multiplied
#'   #'
#'   #' @returns a function
#'   #'
#'   #' @description
#'     #' returns a function that defines a niche based on a capped normal distribution, i.e. a pdf of a normal distribution where all values above 1 are capped. Mathematically, this is f(x) = min( inc * pdf(x), 1)
#'
#'   f = function(x) pmin(inc * dnorm(x, mean, sd), rep(1, length(x)))
#'   return(f)
#' }
