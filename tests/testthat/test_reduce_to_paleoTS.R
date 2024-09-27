test_that("runs without problems", {
  x = stasis_sl(1:2)
  expect_no_condition(reduce_to_paleoTS(x))
})

test_that("retruns correct S3 class", {
  x = stasis_sl(1:2)
  expect_s3_class(reduce_to_paleoTS(x), "paleoTS")
})

test_that("removes entries with NA", {
  x = stasis_sl(1:3)
  x$t[2] = NA
  y = reduce_to_paleoTS(x)
  expect_equal(length(y$mm), 2)
})

test_that("works with stratigraphic data",{
  x = stasis_sl(1:5)
  x$h = x$t
  x$t = NULL
  class(x) = c("pre_paleoTS", "stratlist", "list")
  expect_no_condition(reduce_to_paleoTS(x))
})
