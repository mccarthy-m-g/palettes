#' Colour vector and colour palette interpolation
#'
#' Interpolate the set of colours in `palettes_palette` or `palettes_colour`
#' objects to create new colour palettes.
#'
#' @param palette An object of class `palettes_palette` or `palettes_colour`.
#' @param n An integer specifying the number of colours to return.
#' @param direction Sets the order of colours in the scale. If 1, the default,
#'   colours are ordered from first to last If -1, the order of colours is
#'   reversed.
#' @param interpolate The interpolation method. Either "linear" (default) or
#'   "spline".
#'
#' @return An object of class `palettes_palette` or `palettes_colour`.
#' @export
#'
#' @examples
#' # The class returned after interpolation matches the input class.
#' x <- pal_colour(c("red", "green", "blue"))
#' y <- pal_palette(my_pal = x)
#' pal_brewer(x)
#' pal_brewer(y)
#'
#' # Choose between linear and spline interpolation.
#' pal_brewer(x, n = 7, interpolate = "linear")
#' pal_brewer(x, n = 7, interpolate = "spline")
#'
#' # Palettes will have the same length after interpolation, regardless of the
#' # number of colours in the original palette.
#' z <- pal_palette(
#'   pal1 = c("red", "green", "blue"),
#'   pal2 = c("orange", "purple")
#' )
#' pal_brewer(z, n = 5)
pal_brewer <- function(
  palette,
  n = NULL,
  direction = 1,
  interpolate = c("linear", "spline")
) {

  if (is_palette(palette)) {
    brew_palette(palette, n, direction, interpolate)
  } else if (is_colour(palette)) {
    brew_colour(palette, n, direction, interpolate)
  } else {
    warning("`palette` not of class `palettes_palette` or `palettes_colour`.")
  }

}

brew_colour <- function(
  palette,
  n = NULL,
  direction = 1,
  interpolate = c("linear", "spline")
) {

  n <- ifelse(is.null(n), vec_size(palette), n)
  # This is used in favour of `ifelse()` because that function only returns the
  # first colour in the palette since its logical is of length 1.
  palette <- if (direction >= 0) palette else rev(palette)

  brewed_palette <- grDevices::colorRampPalette(
    palette,
    space = "Lab",
    interpolate = rlang::arg_match(interpolate)
  )(n)

  as_colour(brewed_palette)

}

brew_palette <- function(
  palette,
  n = NULL,
  direction = 1,
  interpolate = c("linear", "spline")
) {

  brewed_palette <- purrr::map(
    palette, function(x) brew_colour(x, n, direction, interpolate)
  )

  new_palette(brewed_palette)

}
