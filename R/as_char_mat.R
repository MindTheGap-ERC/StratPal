as_char_mat = function(mat, pos = NULL){
  #' @export
  #'
  #' @title construct character matrix
  #'
  #' @param mat matrix containing the characters, where rows correspond to
  #' taxa and columns correspond to the characters. Must have column names with taxon names
  #' @param pos named vector, with names matching the taxon names of the matrix. Provides the position (time/height) of the taxa in the character matrix
  #'
  #' @returns a object of S3 class `char_mat`, describing a character matrix with associated positions (times/heights) where the taxa were found
  #'
  #' @description
    #' constructor for character matrices for stratigraphic transformations & taphonomic effects
    #'
  #
  char_mat = list(mat = mat, pos = pos)
  class(char_mat) = c("char_mat")
  return(char_mat)
}
