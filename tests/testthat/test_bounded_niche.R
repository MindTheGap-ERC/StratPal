test_that("disordered boundaries throw error", {
  expect_error(bounded_niche(1,0))
})

test_that("correct values are returned",{
  x1 = 0
  x2 = 1
  f = bounded_niche(x1, x2)
  expect_equal(f(x1 - 1), 0)
  expect_equal(f(x2 + 1), 0)
  expect_equal(f(mean(c(x1, x2))), 1)
})
