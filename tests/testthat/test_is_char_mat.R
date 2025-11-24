test_that("basic errors are thrown",{
  # different lengths of pos and mat
  ntax = 4
  nchar = 10
  tax_names = letters[1:ntax]
  mat = matrix(data = rep(1, ntax * nchar),
               nrow = ntax,
               ncol = nchar,
               dimnames = list(tax_names, NULL))
  pos = seq(0.1, 1.8, length.out = 3)
  names(pos)<-letters[1:3]
  char_mat = as_char_mat(mat, pos)
  expect_error(is_char_mat(char_mat))
  # inconsistent names
  ntax = 4
  nchar = 10
  tax_names = letters[1:ntax]
  mat = matrix(data = rep(1, ntax * nchar),
               nrow = ntax,
               ncol = nchar,
               dimnames = list(tax_names, NULL))
  pos = seq(0.1, 1.8, length.out = 4)
  names(pos)<-LETTERS[1:ntax]
  char_mat = as_char_mat(mat, pos)
  expect_error(is_char_mat(char_mat))
})

test_that("returns true for valid char_mat object", {
  ntax = 4
  nchar = 10
  tax_names = letters[1:ntax]
  mat = matrix(data = rep(1, ntax * nchar),
               nrow = ntax,
               ncol = nchar,
               dimnames = list(tax_names, NULL))
  pos = seq(0.1, 1.8, length.out = 4)
  names(pos)<-tax_names
  char_mat = as_char_mat(mat, pos)
  expect_true(is_char_mat(char_mat))
})
