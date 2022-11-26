#' Arithmetic operators
#'
#' These unary operators perform "arithmetic" on [pal_colour] vectors
#' (or objects which can be coerced to them).
#'
#' @usage
#' x + y
#'
#' @param x,y [pal_colour] vectors or objects which can be coerced to
#' them.
#'
#' @return Unary `+` returns a [pal_colour] vector.
#' @name arithmetic
#' @examples
#' x <- pal_colour("red")
#' y <- pal_colour("blue")
#' x + y
NULL

#' @export
#' @method vec_arith palettes_colour
vec_arith.palettes_colour <- function(op, x, y, ...) {
  UseMethod("vec_arith.palettes_colour", y)
}

#' @export
#' @method vec_arith.palettes_colour palettes_colour
vec_arith.palettes_colour.palettes_colour <- function(op, x, y, ...) {
  switch(
    op,
    "+" = colour_plus(x, y),
    # TODO: Add other arithmetic operator methods
    # "-" = colour_minus(x, y),
    stop_incompatible_op(op, x, y)
  )
}

colour_plus <- function(x, y) {
  colour_arith(x, y, colour_plus_prismatic)
}
# colour_minus <- function(x, y) {
#   colour_arith(x, y, colour_minus_farver)
# }

colour_arith <- function(x, y, fn) {
  if (!is_colour(x) || !is_colour(y)) {
    abort("`x` and `y` must both be 'colour' objects.")
  }

  args <- vec_cast_common(x = x, y = y)
  args <- vec_recycle_common(!!!args)
  x <- args[[1]]
  y <- args[[2]]

  # TODO: Restore NAs in output. Adding to an NA should return NA.
  # TODO: Replace with purrr
  fields <- vapply(
    seq_along(x),
    function(i) {
      fn(x[[i]], y[[i]])
    },
    FUN.VALUE = character(1)
  )

  pal_colour(fields)
}

# TODO: Decide the function for adding colours; the current is just a proof of
# concept placeholder.
colour_plus_prismatic <- function(x, y) {
  prismatic::clr_mix(x, y)
}

#TODO: Create colour_minus_xxx function.
