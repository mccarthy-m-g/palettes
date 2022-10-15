# for compatibility with the S4 system
methods::setOldClass(c("palettes_color", "vctrs_vctr"))

#' `color` vector
#'
#' This creates a character vector that represents colours so when it is
#' printed, colours will be formatted as hexadecimal strings.
#'
#' @param x
#'  * For `color()`: A character vector of any of the three kinds of R colour
#'   specifications.
#'  * For `as_color()`: An object to be coerced.
#'  * For `is_color()`: An object to test.
#' @details
#'
#' Colours can be specified using either:
#' - A color name (as listed by colors())
#' - a hexadecimal string of the form "#rrggbb" or "#rrggbbaa" (see rgb)
#' - A positive integer i meaning `palette()[i]`.
#'
#' @return An S3 vector of class `palettes_color`.
#' @export
#' @examples
#' color(c("red", "#00FF00", "blue"))
#' is_color(c("red", "#00FF00", "blue"))
#' as_color("white")
color <- function(x = character()) {
  x <- vec_cast(x, character())
  new_color(x)
}

new_color <- function(x = character()) {
  vec_assert(x, character())
  new_vctr(x, class = "palettes_color")
}

#' @export
#' @rdname color
is_color <- function(x) {
  inherits(x, "palettes_color")
}

#' @export
#' @rdname color
as_color <- function(x) {
  vec_cast(x, new_color())
}
