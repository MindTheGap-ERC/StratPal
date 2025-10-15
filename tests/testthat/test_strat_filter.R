test_that("no error is thrown",{
  adm = admtools::tp_to_adm(t = seq(0,3), h = c(0, 1,1,2))
  expect_no_error(strat_filter(adm = adm))
  f = strat_filter(adm = adm)
  expect_no_error(f(0.5))
})
