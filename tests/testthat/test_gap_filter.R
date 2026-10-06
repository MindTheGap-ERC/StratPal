test_that("returns correct number of events", {
  n = 10
  x = runif(n, 0, 1)
  adm = admtools::tp_to_adm(t = c(0,1), h = c(0,1))
  expect_identical(gap_filter(x, adm), x)
})
