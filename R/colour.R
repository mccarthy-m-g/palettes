# for compatibility with the S4 system
methods::setOldClass(c("palettes_colour", "vctrs_vctr"))

#' `colour` vector
#'
#' This creates a character vector that represents colours so when it is
#' printed, colours will be formatted as hexadecimal strings.
#'
#' @param x
#'  * For `pal_colour()`: A character vector of any of the three kinds of R colour
#'   specifications.
#'  * For `as_colour()`: An object to be coerced.
#'  * For `is_colour()`: An object to test.
#' @details
#'
#' Colours can be specified using either:
#' - A colour name (as listed by colours())
#' - a hexadecimal string of the form "#rrggbb" or "#rrggbbaa" (see rgb)
#' - A positive integer i meaning `palette()[i]`.
#'
#' @return An S3 vector of class `palettes_colour`.
#' @export
#' @examples
#' pal_colour(c("red", "#00FF00", "blue"))
#' is_colour(c("red", "#00FF00", "blue"))
#' as_colour("white")
pal_colour <- function(x = character()) {
  x <- vec_cast(x, character())
  new_colour(x)
}

new_colour <- function(x = character()) {
  vec_assert(x, character())
  new_vctr(x, class = "palettes_colour")
}

#' @export
#' @rdname pal_colour
is_colour <- function(x) {
  inherits(x, "palettes_colour")
}

#' @export
#' @rdname pal_colour
as_colour <- function(x) {
  vec_cast(x, new_colour())
}
