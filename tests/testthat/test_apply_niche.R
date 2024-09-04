test_that("returns fewer events", {
  n = 10
  x = runif(n, 0, 1)
  expect_lt(length(apply_niche(x, niche_def = function(x) 0.5, gc =  function(x) 1)), n)
})
