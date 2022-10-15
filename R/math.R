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
