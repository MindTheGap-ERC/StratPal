cnd = function(mean, sd, inc = 1, cut_neg = TRUE){
  #'
  #' @export
  #'
  #' @title capped normal distribution pdf
  #'
  #' @param mean mean of normal distribution
  #' @param sd standard deviation
  #' @param inc scalar, factor by which the pdf is multiplied
  #' @param cut_neg logical. should negative values be set to 0?
  #'
  #' @returns a function
  #'
  #' @examples
    #' \dontrun{
    #' # using water depth as niche
    #' wd = seq(-3, 40, by = 0.5)
    #' f = cnd(mean = 10, sd = 5, inc = 15, cut_neg = FALSE)
    #' # 1 indicates high preference, 0 indicates low preference
    #' plot(wd, f(wd), xlab = "Water depth", ylab = "Env. preference")
    #' # set value at neg wd to 0 - non-terrestrial species.
    #' f = cnd(mean = 10, sd = 5, inc = 15, cut_neg = TRUE)
    #' plot(wd, f(wd), xlab = "Water depth", ylab = "Env. preference")
    #'
    #' # see also
    #' vignette("event_data")
    #' #for examples how to use it for niche modeling
    #' }
    #'
  #'
  #' @description
    #' Returns a function that defines a niche based on a capped normal distribution, i.e. a pdf of a normal distribution where all values above 1 are capped. Mathematically, this is f(x) = min( inc * pdf(x), 1).
    #' Corresponds to the probability of collection model by Holland and Patzkowsky (2002).
  #' @references * Holland, Steven M. and Patzkowsky, Mark E. 2002. "Stratigraphic variation in the timing of first and last occurrences." PALAIOS. https://doi.org/10.1669/0883-1351(2002)017<0134:SVITTO>2.0.CO;2

  fa = function(x){
    y = pmin(inc * stats::dnorm(x, mean, sd), rep(1, length(x)))
    if (cut_neg){
      y[x<= 0] = rep(0, length(y[x<=0]))
    }
    return(y)
  }

  return(fa)
}
