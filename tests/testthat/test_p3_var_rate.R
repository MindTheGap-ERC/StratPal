test_that("throws error for flipped boundary",{
  expect_error(p3_var_rate(x = function(x) 1, from =  1, to = 0))
})

test_that("throws warning for too low values of f_max",{
  expect_warning(p3_var_rate(x = function(x) 1000, from = 0,to = 1, n = 1000))
})

test_that("retruns correct number of events under conditioning",{
  n = 10
  expect_equal(length(p3_var_rate(function(x) 1, from = 0, to = 1, n = n)), n)
})
