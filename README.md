
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

The Modes function finds and returns all modes of a vector:

``` r
Modes(numvec)
#> [1] 3 4
```

The ImpReg function creates a linear regression model to impute values
in a vector based on specified predictors:

``` r
mock_data <- data.frame(pred1 = rep(1:4,10),pred2=rep(1:5,8),missvar=as.numeric(c("NA",rep(1:2,19),"NA")))
#> Warning in data.frame(pred1 = rep(1:4, 10), pred2 = rep(1:5, 8), missvar =
#> as.numeric(c("NA", : NAs introduced by coercion
mod1<-ImpReg(mock_data,"missvar",c("pred1","pred2"))

summary(mod1)
#> 
#> Call:
#> lm(formula = numvar3 ~ ., data = filldat)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -0.6173 -0.4876  0.0000  0.4876  0.6173 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)  1.92593    0.26851   7.173 2.29e-08 ***
#> pred1       -0.18519    0.07083  -2.615   0.0131 *  
#> pred2        0.01235    0.05630   0.219   0.8277    
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 0.4751 on 35 degrees of freedom
#> Multiple R-squared:  0.1683, Adjusted R-squared:  0.1208 
#> F-statistic: 3.541 on 2 and 35 DF,  p-value: 0.03976
```

Finally, the numpute function allows you to impute values using several
methods:

chosenval: choose a value to impute and manually specify it

mean: impute the mean of the vector

median: impute the median of the vector

mode: impute the mode of the vector

reg: use linear regression with specified predictors to impute missing
values

``` r

numpute(mock_data,"missvar","chosenval",chosenval=3)
#>       missvar_imputed missvar_missingind
#>  [1,]               3                  1
#>  [2,]               1                  0
#>  [3,]               2                  0
#>  [4,]               1                  0
#>  [5,]               2                  0
#>  [6,]               1                  0
#>  [7,]               2                  0
#>  [8,]               1                  0
#>  [9,]               2                  0
#> [10,]               1                  0
#> [11,]               2                  0
#> [12,]               1                  0
#> [13,]               2                  0
#> [14,]               1                  0
#> [15,]               2                  0
#> [16,]               1                  0
#> [17,]               2                  0
#> [18,]               1                  0
#> [19,]               2                  0
#> [20,]               1                  0
#> [21,]               2                  0
#> [22,]               1                  0
#> [23,]               2                  0
#> [24,]               1                  0
#> [25,]               2                  0
#> [26,]               1                  0
#> [27,]               2                  0
#> [28,]               1                  0
#> [29,]               2                  0
#> [30,]               1                  0
#> [31,]               2                  0
#> [32,]               1                  0
#> [33,]               2                  0
#> [34,]               1                  0
#> [35,]               2                  0
#> [36,]               1                  0
#> [37,]               2                  0
#> [38,]               1                  0
#> [39,]               2                  0
#> [40,]               3                  1
numpute(mock_data,"missvar","mean")
#>       missvar_imputed missvar_missingind
#>  [1,]             1.5                  1
#>  [2,]             1.0                  0
#>  [3,]             2.0                  0
#>  [4,]             1.0                  0
#>  [5,]             2.0                  0
#>  [6,]             1.0                  0
#>  [7,]             2.0                  0
#>  [8,]             1.0                  0
#>  [9,]             2.0                  0
#> [10,]             1.0                  0
#> [11,]             2.0                  0
#> [12,]             1.0                  0
#> [13,]             2.0                  0
#> [14,]             1.0                  0
#> [15,]             2.0                  0
#> [16,]             1.0                  0
#> [17,]             2.0                  0
#> [18,]             1.0                  0
#> [19,]             2.0                  0
#> [20,]             1.0                  0
#> [21,]             2.0                  0
#> [22,]             1.0                  0
#> [23,]             2.0                  0
#> [24,]             1.0                  0
#> [25,]             2.0                  0
#> [26,]             1.0                  0
#> [27,]             2.0                  0
#> [28,]             1.0                  0
#> [29,]             2.0                  0
#> [30,]             1.0                  0
#> [31,]             2.0                  0
#> [32,]             1.0                  0
#> [33,]             2.0                  0
#> [34,]             1.0                  0
#> [35,]             2.0                  0
#> [36,]             1.0                  0
#> [37,]             2.0                  0
#> [38,]             1.0                  0
#> [39,]             2.0                  0
#> [40,]             1.5                  1
numpute(mock_data,"missvar","median")
#>       missvar_imputed missvar_missingind
#>  [1,]             1.5                  1
#>  [2,]             1.0                  0
#>  [3,]             2.0                  0
#>  [4,]             1.0                  0
#>  [5,]             2.0                  0
#>  [6,]             1.0                  0
#>  [7,]             2.0                  0
#>  [8,]             1.0                  0
#>  [9,]             2.0                  0
#> [10,]             1.0                  0
#> [11,]             2.0                  0
#> [12,]             1.0                  0
#> [13,]             2.0                  0
#> [14,]             1.0                  0
#> [15,]             2.0                  0
#> [16,]             1.0                  0
#> [17,]             2.0                  0
#> [18,]             1.0                  0
#> [19,]             2.0                  0
#> [20,]             1.0                  0
#> [21,]             2.0                  0
#> [22,]             1.0                  0
#> [23,]             2.0                  0
#> [24,]             1.0                  0
#> [25,]             2.0                  0
#> [26,]             1.0                  0
#> [27,]             2.0                  0
#> [28,]             1.0                  0
#> [29,]             2.0                  0
#> [30,]             1.0                  0
#> [31,]             2.0                  0
#> [32,]             1.0                  0
#> [33,]             2.0                  0
#> [34,]             1.0                  0
#> [35,]             2.0                  0
#> [36,]             1.0                  0
#> [37,]             2.0                  0
#> [38,]             1.0                  0
#> [39,]             2.0                  0
#> [40,]             1.5                  1
numpute(mock_data,"missvar","mode")
#> [1] "Warning: multiple modes, output uses first detected mode"
#>       missvar_imputed missvar_missingind
#>  [1,]               1                  1
#>  [2,]               1                  0
#>  [3,]               2                  0
#>  [4,]               1                  0
#>  [5,]               2                  0
#>  [6,]               1                  0
#>  [7,]               2                  0
#>  [8,]               1                  0
#>  [9,]               2                  0
#> [10,]               1                  0
#> [11,]               2                  0
#> [12,]               1                  0
#> [13,]               2                  0
#> [14,]               1                  0
#> [15,]               2                  0
#> [16,]               1                  0
#> [17,]               2                  0
#> [18,]               1                  0
#> [19,]               2                  0
#> [20,]               1                  0
#> [21,]               2                  0
#> [22,]               1                  0
#> [23,]               2                  0
#> [24,]               1                  0
#> [25,]               2                  0
#> [26,]               1                  0
#> [27,]               2                  0
#> [28,]               1                  0
#> [29,]               2                  0
#> [30,]               1                  0
#> [31,]               2                  0
#> [32,]               1                  0
#> [33,]               2                  0
#> [34,]               1                  0
#> [35,]               2                  0
#> [36,]               1                  0
#> [37,]               2                  0
#> [38,]               1                  0
#> [39,]               2                  0
#> [40,]               1                  1
numpute(mock_data,"missvar","reg",c("pred1","pred2"))
#>       missvar_imputed missvar_missingind
#>  [1,]        1.753086                  1
#>  [2,]        1.000000                  0
#>  [3,]        2.000000                  0
#>  [4,]        1.000000                  0
#>  [5,]        2.000000                  0
#>  [6,]        1.000000                  0
#>  [7,]        2.000000                  0
#>  [8,]        1.000000                  0
#>  [9,]        2.000000                  0
#> [10,]        1.000000                  0
#> [11,]        2.000000                  0
#> [12,]        1.000000                  0
#> [13,]        2.000000                  0
#> [14,]        1.000000                  0
#> [15,]        2.000000                  0
#> [16,]        1.000000                  0
#> [17,]        2.000000                  0
#> [18,]        1.000000                  0
#> [19,]        2.000000                  0
#> [20,]        1.000000                  0
#> [21,]        2.000000                  0
#> [22,]        1.000000                  0
#> [23,]        2.000000                  0
#> [24,]        1.000000                  0
#> [25,]        2.000000                  0
#> [26,]        1.000000                  0
#> [27,]        2.000000                  0
#> [28,]        1.000000                  0
#> [29,]        2.000000                  0
#> [30,]        1.000000                  0
#> [31,]        2.000000                  0
#> [32,]        1.000000                  0
#> [33,]        2.000000                  0
#> [34,]        1.000000                  0
#> [35,]        2.000000                  0
#> [36,]        1.000000                  0
#> [37,]        2.000000                  0
#> [38,]        1.000000                  0
#> [39,]        2.000000                  0
#> [40,]        1.246914                  1
```
