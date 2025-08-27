test_that("for event type data, returns fewer events", {
  # reduce number of events
  n = 10
  x = runif(n, 0, 1)
  expect_lt(length(apply_niche(x, niche_def = function(x) 0.5, gc =  function(x) 1)), n)
  # returns identical events for trivial niche
  niche_def = function(x) rep(1, length(x))
  gc = function(x) rep(1, length(x))
  expect_equal(apply_niche(x, niche_def, gc), x)
  # returns vector of length 0 when niche is 0 everywhere
  niche_def = function(x) rep(0, length(x))
  gc = function(x) rep(1, length(x))
  expect_equal(length(apply_niche(x, niche_def, gc)), 0)
})

test_that("for pre_paleoTS, returns identical result for trivial niche", {
  x = stasis_sl(1:3)
  niche_def = function(x) rep(1, length(x))
  gc = function(x) rep(1, length(x))
  expect_equal(apply_niche(x, niche_def, gc), x)
})

test_that("for fossils objects, returns indentical result for trivial niche",{
  niche_def = function(x) rep(1, length(x))
  gc = function(x) rep(1, length(x))
  t = ape::rlineage(birth = 1, death = 0, Tmax = 1)
  rate = 2
  f = FossilSim::sim.fossils.poisson(rate = rate, tree = t)
  expect_equal(apply_niche(f, niche_def, gc), f)
})

test_that("warning is thrown for age uncertainty",{
  niche_def = function(x) rep(1, length(x))
  gc = function(x) rep(1, length(x))
  t = ape::rlineage(birth = 1, death = 0, Tmax = 1)
  rate = 2
  f = FossilSim::sim.fossils.poisson(rate = rate, tree = t)
  f$hmin = f$hmin + 0.1
  expect_warning(apply_niche(f, niche_def, gc))
})
