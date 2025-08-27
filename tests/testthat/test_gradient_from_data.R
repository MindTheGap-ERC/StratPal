test_that("fails for invalid data types",{
  expect_error(gradient_from_data("a"))
})

test_that("returns function for correct input types",{
  f = gradient_from_data(list(c(1,2), c(1,2)))
  expect_true(is.function(f))
  f = gradient_from_data(data.frame(c(1,2), c(1,2)))
  expect_true(is.function(f))
})
