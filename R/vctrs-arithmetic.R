#' Mix colour vectors with arithmetic operators
#'
#' These binary operators mix colour vectors with arithmetic operators.
#'
#' @param e1,e2 Colour vectors of class `palettes_colour`.
#' @return
#' The binary operators return colour vectors of class `palettes_colour` containing
#' the result of the element by element operations. If involving a zero-length
#' vector the result has length zero. Otherwise, the elements of shorter vectors
#' are recycled as necessary. The `+` operator is for additive colour mixing.
#' @name colour-mixing-arithmetic
#' @aliases color-mixing-arithmetic
#' @examples
#' x <- pal_colour("red")
#' y <- pal_colour("blue")
#' x + y
NULL

#' @export
#' @rdname colour-mixing-arithmetic
"+.palettes_colour" <- function(e1, e2) {
  vec_arith("+", e1, e2)
}

#' @export
#' @method vec_arith palettes_colour
vec_arith.palettes_colour <- function(op, x, y, ...) {
  UseMethod("vec_arith.palettes_colour", y)
}

#' @export
#' @method vec_arith.palettes_colour default
vec_arith.palettes_colour.default <- function(op, x, y, ...) {
  stop_incompatible_op(op, x, y)
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
  colour_arith(x, y, colour_plus_farver)
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

colour_plus_farver <- function(x, y) {
  pal_mix(c(x, y))
}
