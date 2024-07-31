test_that("values at highest points are correct",{
  opt = 0
  prob_mod = 1
  f = snd_niche(opt,tol = 1, prob_modifier = prob_mod)
  expect_equal(f(opt), prob_mod)
  opt = 0
  prob_mod = 0.5
  f = snd_niche(opt,tol = 1, prob_modifier = prob_mod)
  expect_equal(f(opt), prob_mod)
  opt = 0
  prob_mod = 2
  f = snd_niche(opt,tol = 1, prob_modifier = prob_mod)
  expect_equal(f(opt), 1)
})

test_that("cut off works", {
  opt = 1
  tol = 1
  cut_off = 0
  f = snd_niche(opt, tol, cutoff_val = cut_off )
  expect_equal(f(cut_off), 0)
})

test_that("errors for negative tolerances and prob modifiers are thrown", {
  expect_error(snd_niche(1,0))
  expect_error(snd_niche(1,1,0))
})
