#' Math functions
#'
#' These functions perform "math" on [pal_colour] vectors
#' (or objects which can be coerced to them).
#'
#' @usage
#' sum(x)
#' cumsum(x)
#'
#' @param x A [pal_colour] vector or an object which can be coerced to one.
#'
#' @return A [pal_colour] vector.
#' @name math
#' @aliases sum cumsum
#' @examples
#' x <- pal_colour(c("red", "blue"))
#' sum(x)
#'
#' x <- pal_colour(c("red", "blue", "yellow"))
#' cumsum(x)
NULL

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
