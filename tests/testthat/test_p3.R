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

test_that("returns correct answer for 0 samples", {
  expect_equal(p3(1, 0, 1, n = 0), numeric())
})

test_that("returns correct type", {
  expect_type(p3(1,0,1), "double")
  expect_type(p3(1,0,1, n = 0), "double")
})
