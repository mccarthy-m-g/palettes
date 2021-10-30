#' @export
#' @method vec_math palettes_color
vec_math.palettes_color <- function(.fn, .x, ...) {
  switch(
    .fn,
    "cumsum" = color_cumsum(.x),
    "sum"    = color_sum(.x),
    NextMethod() # No `stop_unsupported` yet. See https://github.com/r-lib/vctrs/issues/1415
  )
}

color_cumsum <- function(.x) {
  color(purrr::accumulate(.x, `+`))
}

color_sum <- function(.x) {
  tail(color_cumsum(.x), n = 1)
}
