test_that("boundary flips throw error",{
  expect_error(rej_samp(function (x) 1, 1,0))
})

test_that("retruns correct no of samples",{
  n = 10
  expect_equal(length(rej_samp(function(x) 1, 0, 1)), 1)
})

test_that("throws warning if density is too high",{
  expect_warning(rej_samp(function(x) 10^6, 0, 1, n = 1000))
})
