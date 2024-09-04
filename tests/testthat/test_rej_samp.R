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

test_that("throws error for negative `f_max`", {
  expect_error(rej_samp(identity, 0, 1, f_max = 0))
})

test_that("returns correct results for negative n", {
  expect_equal(rej_samp(identity, 0, 1, n = 0), numeric())
})


test_that("throws error if no sample can be determined within sufficient tries", {
  expect_error(rej_samp(function (x) rep(0, length(x)), 0, 1, max_try = 100))
})
