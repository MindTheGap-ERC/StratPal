p3 = function(rate, from, to, n = NULL){
  #'
  #' @export
  #'
  #' @title  simulate Poisson point process
  #'
  #' @param rate strictly positive scalar, rate of events (avg events per unit)
  #' @param from lowest boundary of observed interval
  #' @param to upper boundary of observed interval
  #' @param n integer of NULL (default). Number of events to return. If NULL, the number is random and determined by the rate parameter
  #'
  #' @description
    #' Simulates events in the interval `from` to `to` based on a Poisson point process with rate `rate`. If the parameter `n` is used, the number of fossils is conditioned to be `n`
    #' In the context of paleontology, these events can be interpreted as fossil occurrences or first/last occurrences of species. In this case, the rate is the average number of fossil occurrences (resp first/last occurrences) per unit
  #'
  #' @returns a numeric vector with timing/location of events.
  #'
  #' @examples
    #'
    #' # for fossil occ.
    #' x = p3(rate = 5, from = 0, to = 1) # 5 fossil occurrences per myr on avg.
    #' hist(x, xlab = "Time (Myr)", ylab = "Fossil Occurrences" )
    #'
    #' x = p3(rate = 3, from = 0, to = 4)
    #' hist(x, main = paste0(length(x), " samples")) # no of events is random
    #'
    #' x = p3(rate = 3, from = 0, to = 4, n = 10)
    #' hist(x, main = paste0(length(x), " samples")) # no of events is fixed to n
    #'
    #' # see also
    #' #vignette("event_data")
    #' # for details on usage and applications to paleontology
    #'
    #'
  #' @seealso [p3_var_rate()] for the variable rate implementation

  if (rate <= 0){ stop("Need strictly positive rate")}
  if (from >= to) {stop("parameter \"from\" needs to be smaller than \"to\".")}

  if(is.null(n)){
    n = stats::rpois(n = 1, lambda = rate * (to-from))
  }

  x = stats::runif(n = n, min = from, max = to)

  return(x)


}
