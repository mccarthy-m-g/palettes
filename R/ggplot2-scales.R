#' Colour scales from colour vectors and colour palettes
#'
#' @inheritParams pal_ramp
#' @param ... Other arguments passed on to `ggplot2::discrete_scale()`,
#'   `ggplot2::continuous_scale()`, or `ggplot2::binned_scale()` to control name,
#'   limits, breaks, labels and so forth.
#' @return A scale function that controls the mapping between data and colour or
#'   fill aesthetics in a [ggplot2][ggplot2::ggplot2-package] plot.
#' @export
#' @examples
#' library(ggplot2)
#'
#' # Use palette_d with discrete data
#' discrete_pal <- pal_colour(c("#663171", "#EA7428", "#0C7156"))
#' ggplot(mtcars, aes(wt, mpg, colour = as.factor(cyl))) +
#'   geom_point(size = 3) +
#'   scale_colour_palette_d(discrete_pal)
#'
#' # Use palette_c with continuous data
#' continuous_pal <- pal_colour(c("#3C0D03", "#E67424", "#F5C34D"))
#' ggplot(mtcars, aes(wt, mpg, colour = mpg)) +
#'   geom_point(size = 3) +
#'   scale_colour_palette_c(continuous_pal)
#'
#' # Use palette_b to bin continuous data before mapping
#' ggplot(mtcars, aes(wt, mpg, colour = mpg)) +
#'   geom_point(size = 3) +
#'   scale_colour_palette_b(continuous_pal)
scale_colour_palette_d <- function(palette, direction = 1, ...) {
  scale_palette_d(aesthetics = "colour", palette, direction, ...)
}

#' @export
#' @rdname scale_colour_palette_d
scale_fill_palette_d <- function(palette, direction = 1, ...) {
  scale_palette_d(aesthetics = "fill", palette, direction, ...)
}

#' @export
#' @rdname scale_colour_palette_d
scale_colour_palette_c <- function(palette, direction = 1, ...) {
  scale_palette_c(aesthetics = "colour", palette, direction, ...)
}

#' @export
#' @rdname scale_colour_palette_d
scale_fill_palette_c <- function(palette, direction = 1, ...) {
  scale_palette_c(aesthetics = "fill", palette, direction, ...)
}

#' @export
#' @rdname scale_colour_palette_d
scale_colour_palette_b <- function(palette, direction = 1, ...) {
  scale_palette_b(aesthetics = "colour", palette, direction, ...)
}

#' @export
#' @rdname scale_colour_palette_d
scale_fill_palette_b <- function(palette, direction = 1, ...) {
  scale_palette_b(aesthetics = "fill", palette, direction, ...)
}

scale_palette_d <- function(aesthetics, palette, direction = 1, ...) {

  ggplot2::discrete_scale(
    aesthetics = aesthetics,
    scale_name = names(palette),
    palette = scales::manual_pal(
      get_palette_colours(palette, n = NULL, direction)
    ),
    ...
  )

}

scale_palette_c <- function(aesthetics, palette, direction = 1, ...) {

  ggplot2::continuous_scale(
    aesthetics = aesthetics,
    scale_name = names(palette),
    palette = scales::gradient_n_pal(
      get_palette_colours(palette, n = 256, direction)
    ),
    guide = "colourbar",
    ...
  )

}

scale_palette_b <- function(aesthetics, palette, direction = 1, ...) {

  ggplot2::binned_scale(
    aesthetics = aesthetics,
    scale_name = names(palette),
    palette = scales::gradient_n_pal(
      get_palette_colours(palette, n = 256, direction)
    ),
    guide = "coloursteps",
    ...
  )

}

# TODO: decide whether to turn this into a generator (n) function instead, as in, e.g.,:
# https://www.wjakethompson.com/blog/taylor/2021-11-11-taylor-ggplot2/
get_palette_colours <- function(x, n = NULL, direction = 1) {

  if (is_palette(x) & vec_size(x) > 1) {
    rlang::warn("Multiple palettes supplied, only the first palette will be used.")
    x <- vec_slice(x, 1)
  }
  x <- as_colour(x)
  pal_ramp(x, n, direction = direction)

}

# British to American spellings ----------------------------------------------

#' @export
#' @rdname scale_colour_palette_d
#' @usage NULL
scale_color_palette_d <- scale_colour_palette_d

#' @export
#' @rdname scale_colour_palette_d
#' @usage NULL
scale_color_palette_c <- scale_colour_palette_c

#' @export
#' @rdname scale_colour_palette_d
#' @usage NULL
scale_color_palette_b <- scale_colour_palette_b
