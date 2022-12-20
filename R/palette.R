# for compatibility with the S4 system
methods::setOldClass(c("palettes_palette", "vctrs_list_of"))

#' Colour palettes
#'
#' This creates a list of colour vectors.
#'
#' @param ...
#'  * For `pal_palette()`: A named list of character vectors of any of the three
#'    kinds of R colour specifications, or a named list of colour vectors of
#'    class `palettes_colour`.
#' @param x
#'  * For `as_palette()`: An object to be coerced.
#'  * For `is_palette()`: An object to test.
#' @details
#' Colours can be specified using either:
#' - Hexadecimal strings of the form `"#RRGGBB"` or `"#RRGGBBAA"`
#' - Colour names from `grDevices::colors()`
#' - Positive integers `i` that index into `grDevices::palette()[i]`
#' @return An S3 list of class `palettes_palette`.
#' @seealso `pal_colour()`
#' @export
#' @examples
#' pal_palette(
#'   Egypt = c("#DD5129", "#0F7BA2", "#43B284", "#FAB255"),
#'   Java  = c("#663171", "#CF3A36", "#EA7428", "#E2998A", "#0C7156")
#' )
#'
#' x <- list(
#'   Egypt = c("#DD5129", "#0F7BA2", "#43B284", "#FAB255"),
#'   Java  = c("#663171", "#CF3A36", "#EA7428", "#E2998A", "#0C7156")
#' )
#' as_palette(x)
pal_palette <- function(...) {
  x <- vec_cast_common(..., .to = pal_colour())
  new_palette(x)
}

new_palette <- function(x = list()) {
  new_list_of(x, ptype = pal_colour(), class = "palettes_palette")
}

#' @export
#' @rdname pal_palette
is_palette <- function(x) {
  inherits(x, "palettes_palette")
}

#' @export
#' @rdname pal_palette
as_palette <- function(x) {
  vec_cast(x, to = new_palette())
}

# Coerce ----------------------------------------------------------------------

#' @export
vec_ptype2.palettes_palette.palettes_palette <- function(x, y, ...) new_palette()
#' @export
vec_ptype2.palettes_palette.list <- function(x, y, ...) list()
#' @export
vec_ptype2.list.palettes_palette <- function(x, y, ...) list()

# Cast ------------------------------------------------------------------------

#' @export
vec_cast.palettes_palette.palettes_palette <- function(x, to, ...) x
#' @export
vec_cast.palettes_palette.list <- function(x, to, ...) do.call(pal_palette, x)
#' @export
vec_cast.list.palettes_palette <- function(x, to, ...) vec_data(x)
