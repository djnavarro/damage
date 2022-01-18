
<!-- README.md is generated from README.Rmd. Please edit that file -->

# damage

<!-- badges: start -->

[![R-CMD-check](https://github.com/djnavarro/damage/workflows/R-CMD-check/badge.svg)](https://github.com/djnavarro/damage/actions)
<!-- badges: end -->

The goal of damage is to make generative art. You can install the
development version from [GitHub](https://github.com/) with:

``` r
remotes::install_github("djnavarro/damage")
```

The particular conceit of this system is that every release of the
system generates pieces in a slightly different style (i.e., the output
is different depending on which version of the package you have
installed). This is version 0.3. To generate pieces:

``` r
library(damage)
damage(seed = 1)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r
damage(seed = 2)
```

<img src="man/figures/README-unnamed-chunk-2-2.png" width="100%" />

``` r
damage(seed = 3)
```

<img src="man/figures/README-unnamed-chunk-2-3.png" width="100%" />
