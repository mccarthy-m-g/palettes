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
    "+" = color_plus(x, y, names_common(x, y)),
    "-" = color_minus(x, y, names_common(x, y)),
    stop_incompatible_op(op, x, y)
  )
}

color_plus <- function(x, y, names) {
  color_arith(x, y, names, color_plus_prismatic)
}
color_minus <- function(x, y, names) {
  color_arith(x, y, names, color_minus_farver)
}

color_arith <- function(x, y, names, fn) {
  if (!is_color(x) || !is_color(y)) {
    abort("`x` and `y` must both be 'color' objects.")
  }

  args <- vec_cast_common(x = x, y = y)
  args <- vec_recycle_common(!!!args, names = names)
  x <- args[[1]]
  y <- args[[2]]
  names <- args$names

  # TODO: Restore NAs in output
  fields <- vapply(
    seq_along(x),
    function(i) {
      fn(x[[i]], y[[i]])
    },
    FUN.VALUE = character(1)
  )

  color(fields)

  #new_color_from_fields(fields, names)
}

color_plus_prismatic <- function(x, y) {
  prismatic::clr_mix(x, y)
}

#TODO: Create color_minus_xxx function.
