test_that("initial value is correct", {
  y0 = 1
  t = seq(0, 1, by = 0.05)
  r = ornstein_uhlenbeck(t, y0 = y0)
  expect_equal(r$y[1],y0)
})
