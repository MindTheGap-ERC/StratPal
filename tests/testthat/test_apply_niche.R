test_that("returns fewer events for event type data", {
  n = 10
  x = runif(n, 0, 1)
  expect_lt(length(apply_niche(x, niche_def = function(x) 0.5, gc =  function(x) 1)), n)
})

x = stasis_sl(1:3)
niche_def = function(x) rep(1, length(x))
gc = function(x) rep(1, length(x))
apply_niche(x, niche_def, gc)
