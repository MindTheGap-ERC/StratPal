apply_niche_pref = function(x, niche, temp_change){
  #' @export
  #'
  #' @title apply niche preference to events
  #'
  #' @param x events
  #' @param niche function, defining a niche along a gradient
  #' @param temp_change function, change in the niche with time
  #'
  niche_with_time = function(t) niche(temp_change(t))
  r = thin(x, niche_with_time)
  return(r)
  }
