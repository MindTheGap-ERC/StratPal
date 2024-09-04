test_that("deterministic case is correct",{
  t = seq(0, 1, by = 0.05)
  r = random_walk(t, sigma = 0)
  expect_equal(r$y, rep(0, length(t)))
  mu = 2
  r = random_walk(t, sigma = 0, mu = mu)
  expect_equal(r$y, mu * t)
})

test_that("initial value is correct",{
  y0 = 2
  t = seq(0, 1, by = 0.05)
  r = random_walk(t, y0 = y0)
  expect_equal(r$y[1], y0)
  r = random_walk(t - 2, y0 = y0)
  expect_equal(r$y[1], y0)
})

test_that("throws error for negative sigma", {
  expect_error(random_walk(c(1,2), sigma = -1))
})

test_that("throws error for too short vectors of t", {
  expect_error(random_walk(1))
})
