test_that("runs without error",{
  adm = admtools::tp_to_adm(t = c(0,1), h = c(0,1))
  expect_no_error(range_offset(1,1,adm))
})
