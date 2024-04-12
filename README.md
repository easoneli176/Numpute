
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Numpute

<!-- badges: start -->
<!-- badges: end -->

The goal of Numpute is to simplify imputation for numeric vectors with
missing values.

## Installation

You can install the development version of Numpute from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("easoneli176/Numpute")
```

## Example

The Mode function finds the mode of a vector. Note if there are
multiple, it returns the first one:

``` r
library(Numpute)

numvec<-as.numeric(c(1,2,3,3,4,4,"NA"))
#> Warning: NAs introduced by coercion
Mode(numvec)
#> [1] 3
```
