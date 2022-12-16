#' Colour vector and colour palette interpolation
#'
#' Interpolate the set of colours in `palettes_palette` or `palettes_colour`
#' objects to create new colour palettes.
#'
#' @param palette An object of class `palettes_palette` or `palettes_colour`.
#' @param n An integer specifying the number of colours to return.
#' @param direction Sets the order of colours in the scale. If 1, the default,
#'   colours are ordered from first to last. If -1, the order of colours is
#'   reversed.
#' @param space The colour space to interpolate in. One of: `"cmy"`, `"hsl"`,
#'   `"hsb"`, `"hsv"`, `"lab"` (CIE L*ab), `"hunterlab"` (Hunter Lab),
#'   `"oklab"`, `"lch"` (CIE Lch(ab) / polarLAB), `"luv"`, `"rgb"` (sRGB),
#'   `"xyz"`, `"yxy"` (CIE xyY), `"hcl"` (CIE Lch(uv) / polarLuv), or `"oklch"`
#'   (Polar form of oklab).
#' @param interpolate The interpolation method. Either "linear" (default) or
#'   "spline".
#' @return
#' An object of the same type as `palette`. The output has the following properties:
#'
#' * For objects of class `palettes_colour`: A colour vector with `n` colours.
#' * For objects of class `palettes_palette`: Colour palettes with `n` colours
#'   in each palette.
#' @export
#' @examples
#' # The class returned after interpolation matches the input class.
#' x <- pal_colour(c("darkslateblue", "cornflowerblue", "slategray1"))
#' y <- pal_palette(blues = x)
#' class(pal_ramp(x))
#' class(pal_ramp(y))
#'
#' # Choose between linear and spline interpolation.
#' pal_ramp(x, n = 7, interpolate = "linear")
#' pal_ramp(x, n = 7, interpolate = "spline")
#'
#' # Palettes will have the same length after interpolation, regardless of the
#' # number of colours in the original palette.
#' z <- pal_palette(
#'   Egypt = c("#DD5129", "#0F7BA2", "#43B284", "#FAB255"),
#'   Java  = c("#663171", "#CF3A36", "#EA7428", "#E2998A", "#0C7156")
#' )
#' pal_ramp(z, n = 5)
pal_ramp <- function(
  palette,
  n = NULL,
  direction = 1,
  space = "lab",
  interpolate = c("linear", "spline")
) {
  UseMethod("pal_ramp")
}

#' @export
#' @rdname pal_ramp
pal_ramp.palettes_colour <- function(
  palette,
  n = NULL,
  direction = 1,
  space = "lab",
  interpolate = c("linear", "spline")
) {
  colour_ramp(palette, n, direction, space, interpolate)
}

#' @export
#' @rdname pal_ramp
pal_ramp.palettes_palette <- function(
  palette,
  n = NULL,
  direction = 1,
  space = "lab",
  interpolate = c("linear", "spline")
) {
  palette <- purrr::map(
    palette, function(x) colour_ramp(x, n, direction, space, interpolate)
  )
  new_palette(palette)
}

colour_ramp <- function(
  x,
  n = NULL,
  direction = 1,
  space = "lab",
  interpolate = c("linear", "spline")
) {

  # This is used in favour of `ifelse()` because that function only returns the
  # first colour in the palette since its logical is of length 1.
  x <- if (direction >= 0) x else rev(x)

  # No need to go through any computations if n is NULL, since the resultant
  # vector will be the same length as x.
  if (is.null(n)) {
    return(x)
  }
  # If only a single colour is supplied, this allows it to be repeated n times.
  if (vec_size(x) == 1) {
    x <- rep(x, times = 2)
  }

  space <- rlang::arg_match(space, values = colourspaces)
  # Note: This action is destructive in that if the original colour included
  # colour names, they will be converted to hexadecimal strings in the
  # interpolated vector.
  space_in <- farver::decode_colour(
    colour = x, to = space, na_value = "transparent"
  )

  # Colours need to be mapped to the interval [0,1]
  x_in <- seq(0, 1, length.out = length(x))

  # Choose interpolation method
  interpolate <- rlang::arg_match(interpolate)
  interpolate <- switch(
    interpolate,
    linear = stats::approxfun,
    spline = stats::splinefun
  )

  # Interpolation functions
  x_interp <- interpolate(x_in, space_in[, 1])
  y_interp <- interpolate(x_in, space_in[, 2])
  z_interp <- interpolate(x_in, space_in[, 3])

  # Function to map the interval [0,1] to a set of colours
  ramp <- function(x) {
    space_out <- cbind(x_interp(x), y_interp(x), z_interp(x))
    out <- farver::encode_colour(space_out, from = space)
    out
  }

  as_colour(ramp(seq(0, 1, length.out = n)))

}
