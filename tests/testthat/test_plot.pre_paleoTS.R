test_that("throws error",{
  x = stasis_sl(1:3)
  expect_error(plot(x))
})
