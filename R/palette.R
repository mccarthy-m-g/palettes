# for compatibility with the S4 system
methods::setOldClass(c("palettes_palette", "vctrs_list_of"))

#' `color` palettes
#'
#' This creates a list of color vectors.
#'
#' @param ...
#'  * For `palette()`: A list of character vector of any of the three kinds of
#'   R colour specifications.
#'
#' @details
#'
#' Colours can be specified using either:
#' - A color name (as listed by colors())
#' - a hexadecimal string of the form "#rrggbb" or "#rrggbbaa" (see rgb)
#' - A positive integer i meaning `palette()[i]`.
#'
#' @return An S3 list of class `palettes_palette`.
#' @seealso `color()`
#' @export
#' @examples
#' palette(
#'   pal1 = c("red", "green", "blue"),
#'   pal2 = c("yellow", "orange", "purple")
#' )
palette <- function(...) {
  x <- list(...)
  x <- lapply(x, vec_cast, color())
  new_palette(x)
}

new_palette <- function(x) {
  new_list_of(x, ptype = color(), class = "palettes_palette")
}
