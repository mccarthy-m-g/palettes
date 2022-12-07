
<!-- README.md is generated from README.Rmd. Please edit that file -->

# palettes <a href='https://mccarthy-m-g.github.io/palettes/'><img src='man/figures/logo.png' align="right" height="139"/></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mccarthy-m-g/palettes/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mccarthy-m-g/palettes/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

palettes is an R package for working with colour palettes. The goal of
palettes is to provide methods for working with colour palettes,
particularly for developers who want to make their own colour palette
package. It is in very early development.

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("mccarthy-m-g/palettes")
```

## Usage

``` r
library(tibble)
library(palettes)
```

Colours can be specified by name (as listed by `grDevices::colours()`):

``` r
pal_colour("red")
```

<img src="man/figures/README-/pal-colour-character.svg" width="100%" />

Or by hex code:

``` r
pal_colour("#FF0000")
```

<img src="man/figures/README-/pal-colour-hex.svg" width="100%" />

Multiple colours can be specified at once as a character vector:

``` r
pal_colour(c("#FF0000", "blue", "green"))
```

<img src="man/figures/README-/pal-colour-vector.svg" width="100%" />

Named colour palettes can be specified in the same way:

``` r
pal_palette(
  palette_1 = c("#FF0000", "blue", "green"),
  palette_2 = c(c("yellow", "orange", "purple"))
)
```

<img src="man/figures/README-/pal-palette.svg" width="100%" />

Colours also work in tibbles:

``` r
tibble(
  colours = pal_colour(c("#FF0000", "blue", "green"))
)
```

<img src="man/figures/README-/tibble.svg" width="100%" />

## Documentation

See at
[`https://mccarthy-m-g.github.io/palettes/`](https://mccarthy-m-g.github.io/palettes/reference/index.html)
and also in the installed package: `help(package = "palettes")`.

## License

MIT © Michael McCarthy
