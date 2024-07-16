as_timelist = function(x){
  #' @export
  #'
  #' @title convert list to time list for plotting
  #'
  #' @param x a list
  #'
  #' @returns an object of class time list
  #'
  class(x) = "timelist"

  return(x)
}
