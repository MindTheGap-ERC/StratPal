test_that("different input lengths throw error",{
  vals = 1
  bounds = 1
  expect_error(discrete_gradient(vals = vals, bounds = bounds))
})

test_that("values outside of domain of definition are correct",{
  vals = c("a", "b")
  bounds = 1:3
  outval = "Hello"
  f = discrete_gradient(vals = vals, bounds = bounds, outval = outval)
  expect_equal(f(c(min(bounds)- 1, max(bounds) +1)), rep(outval, 2))
})

test_that("correct return values",{
  vals = c("a", "b")
  bounds = 1:3
  f = discrete_gradient(vals = vals, bounds = bounds)
  expect_equal(f(bounds), c(vals, ""))
})
