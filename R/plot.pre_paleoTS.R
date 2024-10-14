plot.pre_paleoTS = function(x, ...){
  #' @export
  #'
  #' @title plot pre-paleoTS objects
  #'
  #' @param x object
  #' @param ... other arguments
  #'
  #' @seealso [reduce_to_paleoTS()]
  #'
  #' @description
    #' This functions throws an error on purpose, as `pre_paleoTS` objects can not be plotted directly. To plot them, first use `reduce_to_paleoTS` and use `plot` on the results
    #'
  #' @examples
    #' \dontrun{
    #' x = stasis_sl(1:4)
    #' # throws error
    #' plot(x)
    #' library("paleoTS")
    #' # correct way to plot pre-paleoTS objects
    #' y = reduce_to_paleoTs(x)
    #' plot(y)
    #' # this plots via the procedures of the paleoTS package (which must be installed and loaded)
    #' }
  #'


  stop("Can't plot `pre_paleoTS` objects. Convert to paleoTS format using `reduce_to_paleoTS` and plot result via the paleoTS package.")
}
