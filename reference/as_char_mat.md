# construct character matrix

constructor for character matrices for stratigraphic transformations &
taphonomic effects

## Usage

``` r
as_char_mat(mat, pos = NULL)
```

## Arguments

- mat:

  matrix containing the characters, where rows correspond to taxa and
  columns correspond to the characters. Must have column names with
  taxon names

- pos:

  named vector, with names matching the taxon names of the matrix.
  Provides the position (time/height) of the taxa in the character
  matrix

## Value

a object of S3 class `char_mat`, describing a character matrix with
associated positions (times/heights) where the taxa were found
