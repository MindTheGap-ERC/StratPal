reduce_to_paleoTS = function(x, min_n = 1, na.rm = TRUE, ...){
  #' @export
  #'
  #' @title reduce pre-paleoTS format to paleoTS
  #'
  #' @description
    #' paleoTS is a format for paleontological time series. It is a summary format where interpopulation variance is provided as a parameter. As a result, taphonomic and ecological effects that act on individual specimens can not be modeled for paleoTS objects. To resolve this, the pre_paleoTS format tracks each specimen individually. This function reduces the pre-paleoTS format into standard paleoTS object, which can be used by the paleoTS package.
    #'
  #' @param x a `pre_paleoTS` object
  #' @param min_n minimum number of specimens. If the number of specimens at a sampling location falls below this number, the sampling location will be removed
  #' @param na.rm Logical. If sampling locations are NA (e.g., because of erosion), should the sample be removed?
  #' @param ... other options. currently unused
  #'
  #' @seealso
    #' * [stasis_sl()], [strict_stasis_sl], [random_walk_sl], and [ornstein_uhlenbeck_sl()] to simulate trait evolution on specimen level (sl), returning an object of type `pre_paleoTS`
  #'
  #' @returns a `paleoTS` object
  #'
  #' @examples
    #' x = stasis_sl(t = 0:5)     # create pre_paleoTS object representing stasis on specimen level
    #' y = reduce_to_paleoTS(x)   # reduce to standard paleoTS format
    #' plot(y)
    #' # now analyses using the paleoTS package can be applied to y
    #'

  UseMethod("reduce_to_paleoTS")
}

reduce_to_paleoTS.pre_paleoTS = function(x,  min_n = 1, na.rm = TRUE, ...){

  #' @export
  #'
  if (inherits(x, "timelist")){
    tt = x$t
  }
  if (inherits(x, "stratlist")){
    tt = x$h
  }
  l = length(tt)
  mm = rep(NA, l)
  vv = rep(NA, l)
  nn = rep(NA, l)
  for (i in seq_along(tt)){
    mm[i] = mean(x$vals[[i]])
    vv[i] = stats::var(x$vals[[i]])
    nn[i] = length(x$vals[[i]])
  }
  keep = nn >= min_n
  tt = tt[keep]
  mm = mm[keep]
  vv = vv[keep]
  nn = nn[keep]


  if (na.rm){
    pres = !is.na(tt)
    mm = mm[pres]
    vv = vv[pres]
    nn = nn[pres]
    tt = tt[pres]
  }

  x = paleoTS::as.paleoTS(mm, vv, nn, tt)
  return(x)
}
