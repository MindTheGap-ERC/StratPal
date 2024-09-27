test_that("throws error for negative sd", {
  expect_error(stasis(c(1,2), mean = 1, sd = - 0.1))
})

test_that("returns constant for sd of 0",{
  sd = 0
  t = seq(0, 1, by = 0.1)
  mean = 0
  st = stasis(t, mean, sd)
  expect_equal(rep(mean, length(t)), st$y)
})
