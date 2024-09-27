test_that("runs without problems", {
  x = stasis_sl(1:2)
  expect_no_condition(reduce_to_paleoTS(x))
})

test_that("retruns correct S3 class", {
  x = stasis_sl(1:2)
  expect_s3_class(reduce_to_paleoTS(x), "paleoTS")
})
