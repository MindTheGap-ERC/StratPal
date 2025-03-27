test_that("different input lengths are cought correctly",{
  expect_error(discrete_niche(bins = c("a", "b"), rec_prob = c(0)))
})

test_that("correct values are returned",{
  bins = c("a", "b")
  rec_prob = c(0.1, 0.2)
  f = discrete_niche(bins = bins, rec_prob = rec_prob)
  expect_equal(f(rev(bins)), rev(rec_prob))
})


test_that("correct outvalue is returned",{
  bins = c("a", "b")
  rec_prob = c(0.1, 0.2)
  f = discrete_niche(bins = bins, rec_prob = rec_prob, outval = "Hello")
  expect_equal(f("test"), "Hello")
})
