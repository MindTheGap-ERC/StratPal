test_that("basic char matrix construction works", {
  ntax = 4
  nchar = 10
  tax_names = letters[1:ntax]
  mat = matrix(data = rep(1, ntax * nchar),
               nrow = ntax,
               ncol = nchar,
               dimnames = list(tax_names, NULL))
  pos = seq(0.1, 1.8, length.out = 4)
  names(pos)<-tax_names
  expect_no_error(as_char_mat(mat, pos))
})
