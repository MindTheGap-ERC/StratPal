test_that("initial value is correct", {
  y0 = 1
  t = seq(0, 1, by = 0.05)
  r = ornstein_uhlenbeck(t, y0 = y0)
  expect_equal(r$y[1],y0)
})

test_that("wrong parameter values are caught correctly", {
  expect_error(ornstein_uhlenbeck(1))
  expect_error(ornstein_uhlenbeck(c(1,2), sigma = -1))
  expect_error(ornstein_uhlenbeck(c(1,2), theta = -1))
  expect_error(ornstein_uhlenbeck(c(1,2), theta = 0, y0 = "stationary"))
})
