test_that("returns fewer events", {
  n = 10
  x = runif(n, 0, 1)
  expect_lt(length(apply_taphonomy(x, pres_potential = function(x) 0.5, ctc =  function(x) 1)), n)
})
