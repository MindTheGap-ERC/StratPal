## Package setup functions

## unused function to make sure `admtools` namespace is loaded
# see https://r-pkgs.org/dependencies-in-practice.html#how-to-not-use-a-package-in-imports
ignore_unused_imports <- function() {
  admtools::tp_to_adm #arbitrary reference to admtools
}
