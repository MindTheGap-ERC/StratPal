discrete_niche = function(bins, rec_prob, outval = 0){
  #' @export
  #'
  #' @title niche from discrete data
  #'
  #' @param bins vector, bins on which the niche is defined. Can e.g., be numeric or character
  #' @param rec_prob numeric vector, recovery probability for the bins. Must contain values between 0 and 1
  #' @param outval recovery probability for values not in `bin`
  #'
  #' @seealso
    #' * [discrete_gradient()] to construct gradients based on discrete categories.
    #' * [snd_niche()] to define niches along a continuous gradient based on a scaled normal distribution
    #' * [bounded_niche()] to define niches along a continuous gradient based on hard boundaries
    #' * [apply_niche()] for the function used to apply niches to time series or events
    #' * `vignette("advanced_functionality")` for details on how to create user-defined niche models
    #'
  #' @returns a function describing the niche for usage with `apply_niche`. The function takes (vectors of ) values from `bin` as input and returns recovery probability for this bin.
  #'
  #' @description
    #' Defines a niche model where the gradient based on discrete bins (given by `binS`)
    #'
    #'
  #' @examples
    #' # example workflow of how to construct discrete niches. For details on
    #' #how this can be used in conjunction with apply_niche, see documentation
    #' #therein of the vignette on event data
    #' # we model a simple niche, separated into "shallow water" and "deep water"
    #' bins = c("shallow water", "deep water")
    #' # taxon is more abundant in shallow water
    #' rec_prob = c(0.9, 0.1)
    #' # 90 % recovery probability in shallow water, 10 % in deep water
    #' niche = discrete_niche(bins = bins, rec_prob = rec_prob)
    #' # lets assume for the first 1 Myr, water is shallow, followed by 0.8 Myr of deep water,
    #' # and then 1 Myr of shallow water again
    #' # define discretized gradient using discrete_gradient
    #' gradient = discrete_gradient(vals = c("shallow water", "deep water", "shallow water"),
    #' bounds = c(0,1,1.8,2.8))
    #'
    #' # assuming constant fossil abundance before ecological effects, how many fossils do we recover?
    #' foss_occ = p3(rate = 100, from = 0, to = 2.8)
    #' occ_after_ecol = apply_niche(foss_occ, niche_def = niche, gc = gradient)
    #' hist(occ_after_ecol, xlab = "Myr")
    #' # Between 1 nad 1.8 Myr fossil abundance is reduced because this coincides with deep whater
    #' # in which the recovery potential of the taxon is reduced (from 90 % to 10 %)
  if (length(bins) != length(rec_prob)){
    stop("`bin` and `rec_prob` must be of the same length")
  }

  f = function(x){
    names(rec_prob) = bins
    y = unname(rec_prob[x])
    y[is.na(y)] = outval
    return(y)
  }

  return(f)

}
