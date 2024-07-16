as_stratlist = function(x){
  #' @export
  #'
  #' @title transform list into strat lisgt
  #'
  #' @param x a list
  #'
  #' @returns a list of class "stratlist"
  #'
  class(x) = "stratlist"
  return(x)
}
