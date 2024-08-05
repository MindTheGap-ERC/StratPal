test_that("throws error for negative rates", {
  expect_error(p3(0, 0, 1))
})

test_that("throws error for flipped boundaries", {
  expect_error(p3(1, 1, 0))
})

test_that("contitioning on number of samples works",{
  n = 10
  expect_equal(length(p3(1, 0, 1, n = n)), n )
})
