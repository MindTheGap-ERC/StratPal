plot.stratlist = function(x, orientation = "du", ...){

  #' @export
  #'
  #' @title plot strat list
  #'
  #' @param x stratlist object
  #' @param orientation charachter, either "du" (down-up) or "lr" (left-right). Orientation of plotting
  #'
  if (orientation == "du"){
    plot(x$y, x$h, ...)
    return(invisible())
  }
  if (orientation == "lr"){
    plot(x$h, x$y, ...)
    return(invisible())
  }
  stop("Unknown option for \"orientation\". Use either \"ud\" or \"lr\".")
}
