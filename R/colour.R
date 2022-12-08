# for compatibility with the S4 system
methods::setOldClass(c("palettes_colour", "vctrs_vctr"))

#' Colour vectors
#'
#' This creates a character vector that represents colours so when it is
#' printed, colours will be formatted as hexadecimal strings.
#'
#' @param x
#'  * For `pal_colour()`: A character vector of any of the three kinds of R colour
#'   specifications.
#'  * For `as_colour()`: An object to be coerced.
#'  * For `is_colour()`: An object to test.
#'
#' @details
#' Colours can be specified using either:
#' - Hexadecimal strings of the form `"#RRGGBB"` or `"#RRGGBBAA"`
#' - Colour names from `grDevices::colors()`
#' - Positive integers `i` that index into `grDevices::palette()[i]`
#'
#' @return An S3 vector of class `palettes_colour`.
#' @seealso `pal_palette()`
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
  UseMethod("as_colour")
}

#' @export
#' @rdname pal_colour
as_colour.default <- function(x) {
  vec_cast(x, new_colour())
}

#' @export
#' @rdname pal_colour
as_colour.palettes_palette <- function(x) {
  value <- unname(unlist(x))
  new_colour(value)
}

# British to American spellings ----------------------------------------------

#' @export
#' @rdname pal_colour
#' @usage NULL
pal_color <- pal_colour

#' @export
#' @rdname pal_colour
#' @usage NULL
is_color <- is_colour

#' @export
#' @rdname pal_colour
#' @usage NULL
as_color <- as_colour
