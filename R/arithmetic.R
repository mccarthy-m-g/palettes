#' @export
#' @method vec_arith palettes_color
vec_arith.palettes_color <- function(op, x, y, ...) {
  UseMethod("vec_arith.palettes_color", y)
}

#' @export
#' @method vec_arith.palettes_color palettes_color
vec_arith.palettes_color.palettes_color <- function(op, x, y, ...) {
  switch(
    op,
    "+" = color_plus(x, y),
    # TODO: Add other arithmetic operator methods
    # "-" = color_minus(x, y),
    stop_incompatible_op(op, x, y)
  )
}

color_plus <- function(x, y) {
  color_arith(x, y, color_plus_prismatic)
}
# color_minus <- function(x, y) {
#   color_arith(x, y, color_minus_farver)
# }

color_arith <- function(x, y, fn) {
  if (!is_color(x) || !is_color(y)) {
    abort("`x` and `y` must both be 'color' objects.")
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

  color(fields)
}

# TODO: Decide the function for adding colours; the current is just a proof of
# concept placeholder.
color_plus_prismatic <- function(x, y) {
  prismatic::clr_mix(x, y)
}

#TODO: Create color_minus_xxx function.
