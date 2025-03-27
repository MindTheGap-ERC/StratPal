discrete_gradient = function(vals, bounds, outval = ""){
  #' @export
  #'
  #' @title construct discretized gradient
  #'
  #' @param vals vector, values of the gradient
  #' @param bounds vector of strictly increasing values, e.g. times or stratigraphic heights.
  #' @param outval value, gradient value assigned outside of values covered by `bounds`
  #'
  #' @description
    #' Constructs a discretized gradient along time/height. The gradient value between
    #' `bounds[i]` and `bounds[i+1]` (not including) is `vals[i]`, values above/below the largest/smallest value of `bounds` are assigned `outval`.
    #' Helper function for usage with `discrete_niche`
    #'
  #' @seealso
    #' * [discrete_niche()] to construct niches based on discretized gradients
    #' * [apply_niche()] to combine [discrete_niche()] and [discrete_gradient()] to model the effects of niches
    #' * `vignette("advanced_functionality")` for details how to create user-defined niche models
    #'
  #' @returns a functions assigning continuous values (e.g., times or heights) discrete niches
  #'
  #' @examples
    #' # see examples in `discrete_niche` for a use case
    #' # and examples in `apply_niche` for the general application to different data types
    #' # or the vignette on event data for more context
    #'

  if (length(vals)!= (length(bounds)-1)){
    stop("`vals` must be one element shorter than `bounds`")
  }

  f = function(x){
    g = function(y){
      if(y < min(bounds) | y >= max(bounds)){
        return(outval)
      }
      else{
       return(vals[which( bounds[1:length(bounds)-1] <= y & bounds[2:length(bounds)] > y)])
      }
    }
    z = sapply(x, g)
    return(z)
  }
  return(f)
}
