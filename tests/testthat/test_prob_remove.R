test_that("number of entries behaves as expected", {
  x = 1:10
  expect_lt(length(prob_remove(x, 0.5)), length(x))
  expect_equal(length(prob_remove(x, 1)), length(x))
  expect_equal(length(prob_remove(x, 0)), 0)
})
