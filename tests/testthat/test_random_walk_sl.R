test_that("works without problems", {
  expect_no_condition(random_walk_sl(1:3))
})

test_that("incorrect parameters are caught", {
  expect_error(random_walk_sl(1:2, interpop_var = 0))
  expect_error(random_walk_sl(1:2, n_per_sample = 0))
})
