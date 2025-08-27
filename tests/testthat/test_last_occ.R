test_that("wrong domains are caught",{
  adm = admtools::tp_to_adm(t = c(0,1), h = c(0,1))
  expect_error(last_occ(1,1,adm, niche_domain = "hi"))
  expect_error(last_occ(1,1,adm, taphonomy_domain = "hi"))
})

test_that("return data is correct if no occ are present",{
  adm = admtools::tp_to_adm(t = c(0,1), h = c(0,0))
  expect_equal(last_occ(t_ext = 0, rate = 0.1, adm), c("t" = NA, "h" = NA))
  expect_equal(last_occ(t_ext = 1, rate = 100, adm), c("t" = NA, "h" = NA))
})

test_that("p3 and p3_var_rate are working",{
  adm = admtools::tp_to_adm(t = c(0,1), h = c(0,1))
  expect_no_error(last_occ(t_ext = 1, rate = 10, adm))
  expect_no_error(last_occ(t_ext = 1, rate = identity, adm))
})

test_that("all combinations of domains work",{
  adm = admtools::tp_to_adm(t = c(0,1), h = c(0,1))
  expect_no_error(last_occ(t_ext = 1, rate = 10, adm, niche_domain = "time", taphonomy_domain = "time"))
  expect_no_error(last_occ(t_ext = 1, rate = 10, adm, niche_domain = "time", taphonomy_domain = "strat"))
  expect_no_error(last_occ(t_ext = 1, rate = 10, adm, niche_domain = "strat", taphonomy_domain = "time"))
  expect_no_error(last_occ(t_ext = 1, rate = 10, adm, niche_domain = "strat", taphonomy_domain = "strat"))
})
