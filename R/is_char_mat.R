is_char_mat = function(x, ...){
  #' @export
  #'
  #' @title validity of character matrices
  #'
  #' @param x object to test
  #' @param ... other parameters. Currently unused
  #'
  #' @description
    #' tests if `x` is a valid character matrix (`char_mat` object)
    #'
  #'
  #' @returns TRUE if `x` is a valid character matrix object, throws an informative error message otherwise
  #'
  if (nrow(x$mat) != length(x$pos)){ stop("Number of taxa in matrix does not match number of positions")}
  if (! all ((rownames(x$mat) %in% names(x$pos)))){stop("taxon names in matrix and positional arguments inconsistent")}
  return(TRUE)
}
