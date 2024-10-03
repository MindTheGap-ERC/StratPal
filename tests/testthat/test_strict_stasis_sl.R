test_that("runs without problems", {
  expect_no_condition(strict_stasis_sl(1:3))
})

test_that("incorrect parameters are caught", {
  expect_error(strict_stasis_sl(1:2, intrapop_var = 0))
  expect_error(strict_stasis_sl(1:2, n_per_sample = 0))
})
