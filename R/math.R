#' Mix colour vectors with math functions
#'
#' These functions perform "math" on [pal_colour] vectors
#' (or objects which can be coerced to them).
#'
#' @param x An object of class `palettes_colour`.
#' @param ... Colour vectors of class `palettes_colour`.
#' @param na.rm	Whether to include missing values. Either `TRUE` or `FALSE`.
#'
#' @return A [pal_colour] vector.
#' @name colour-mixing-math
#' @aliases color-mixing-math
#' @examples
#' x <- pal_colour(c("red", "blue"))
#' sum(x)
#'
#' x <- pal_colour(c("red", "blue", "yellow"))
#' cumsum(x)
NULL

#' @export
#' @rdname colour-mixing-math
sum.palettes_colour <- function(..., na.rm = FALSE) {
  vec_math("sum", ..., na.rm)
}

#' @export
#' @rdname colour-mixing-math
cumsum.palettes_colour <- function(x) {
  vec_math("cumsum", x)
}

#' @export
#' @method vec_math palettes_colour
vec_math.palettes_colour <- function(.fn, .x, ...) {
  switch(
    .fn,
    "cumsum" = colour_cumsum(.x),
    "sum"    = colour_sum(.x),
    NextMethod() # No `stop_unsupported` yet. See https://github.com/r-lib/vctrs/issues/1415
  )
}

colour_cumsum <- function(.x) {
  pal_colour(purrr::accumulate(.x, `+`))
}

colour_sum <- function(.x) {
  utils::tail(colour_cumsum(.x), n = 1)
}
