reduce_to_paleoTS = function(x, ...){
  #' @export
  #'
  #' @title reduce pre-paleoTS format to paleoTS
  #'
  #' @description
    #' paleoTS is a format for paleontological time series. It is a summary format where interpopulation variance is provided as a parameter. As a result, taphonomic and ecological effects that act on individual specimens can not be modeled for paleoTS objects. To resolve this, the pre_paleoTS format tracks each specimen individually. This function reduces the pre-paleoTS format into standard paleoTS object, which can be used by the paleoTS package.
    #'
  #' @param x a `pre_paleoTS` object
  #' @param ... other options. currently unused
  #'
  #' @seealso [stasis_sl()] to simulate stasis on specimen level (sl), returning an object of call `pre_paleoTS`
  #'
  #' @returns a `paleoTS` object
  #'
  #' @examples
    #' x = stasis_sl(t = 0:5)     # create pre_paleoTS object representing stasis on specimen level
    #' y = reduce_to_paleoTS(x)   # reduce to standard paleoTS format
    #' # now analyses using the paleoTS package can be applied to y
    #'

  UseMethod("reduce_to_paleoTS")
}

reduce_to_paleoTS.pre_paleoTS = function(x, ...){

  #' @export
  #'
  if (inherits(x, "timelist")){
    tt = x$t
  }
  if (inherits(x, "stratlist")){
    tt = x$h
  }
  l = length(x$t)
  mm = rep(NA, l)
  vv = rep(NA, l)
  nn = rep(NA, l)
  for (i in seq_along(x$t)){
    mm[i] = mean(x$vals[[i]])
    vv[i] = stats::var(x$vals[[i]])
    nn[i] = length(x$vals[[i]])
  }
  x = paleoTS::as.paleoTS(mm, vv, nn, tt)
  return(x)
}
