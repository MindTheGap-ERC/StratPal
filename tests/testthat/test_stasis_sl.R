test_that("correct S3 class is returned",{
  expect_s3_class(stasis_sl(1:2), "pre_paleoTS")
})

test_that("incorrect parameters are caught", {
  expect_error(stasis_sl(1:2, intrapop_var = 0))
  expect_error(stasis_sl(1:2, n_per_sample = 0))
})
