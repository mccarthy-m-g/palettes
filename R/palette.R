# for compatibility with the S4 system
methods::setOldClass(c("palettes_palette", "vctrs_list_of"))

#' Colour palettes
#'
#' This creates a list of colour vectors.
#'
#' @param ...
#'  * For `pal_palette()`: A list of character vectors of any of the three kinds of
#'   R colour specifications.
#' @param x An object.
#'
#' @details
#'
#' Colours can be specified using either:
#' - A colour name (as listed by colours())
#' - a hexadecimal string of the form "#rrggbb" or "#rrggbbaa" (see rgb)
#' - A positive integer i meaning `palette()[i]`.
#'
#' @return An S3 list of class `palettes_palette`.
#' @seealso `pal_colour()`
#' @export
#' @examples
#' pal_palette(
#'   pal1 = c("red", "green", "blue"),
#'   pal2 = c("yellow", "orange", "purple")
#' )
pal_palette <- function(...) {
  x <- list(...)
  x <- lapply(x, vec_cast, pal_colour())
  new_palette(x)
}

new_palette <- function(x) {
  new_list_of(x, ptype = pal_colour(), class = "palettes_palette")
}

#' @export
#' @rdname pal_palette
is_palette <- function(x) {
  inherits(x, "palettes_palette")
}
