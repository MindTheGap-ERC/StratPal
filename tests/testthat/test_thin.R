test_that("thinning reduces number of events",{
  x = p3(1, 0, 1, n = 100)
  th = thin(x, function(x) 0.5)
  expect_true(length(th) < length(x))
})

test_that("thinning with 1 keeps data identical",{
  x = p3(1, 0, 1, n = 100)
  expect_equal(thin(x, function(x) 1), x)
})
