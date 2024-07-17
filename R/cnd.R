cnd = function(mean, sd, inc = 1, cut_neg = TRUE){
  #'
  #' @export
  #'
  #' @title capped normal distribution pdf
  #'
  #' @param mean mean of normal distribution
  #' @param sd standard deviation
  #' @param inc scalar, factor by which the pdf in multiplied
  #' @param cut_neg logical. should negative values be set to 0?
  #'
  #' @returns a function
  #'
  #' @examples
    #' \dontrun{
    #' # using water depht as niche
    #' wd = seq(-3, 40, by = 0.5)
    #' f = cnd(mean = 10, sd = 5, inc = 15, cut_neg = FALSE)
    #' # 1 indicates high preference, 0 indicates low preference
    #' plot(wd, f(wd), xlab = "Water depth", ylab = "Env. preference")
    #' # set value at neg wd to 0 - non-terrestrial species.
    #' f = cnd(mean = 10, sd = 5, inc = 15, cut_neg = TRUE)
    #' plot(wd, f(wd), xlab = "Water depth", ylab = "Env. preference")
    #' }
    #'
  #'
  #' @description
    #' returns a function that defines a niche based on a capped normal distribution, i.e. a pdf of a normal distribution where all values above 1 are capped. Mathematically, this is f(x) = min( inc * pdf(x), 1)

  fa = function(x){
    y = pmin(inc * stats::dnorm(x, mean, sd), rep(1, length(x)))
    if (cut_neg){
      y[x<= 0] = rep(0, length(y[x<=0]))
    }
    return(y)
  }

  return(fa)
}
