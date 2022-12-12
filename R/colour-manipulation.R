#' Lighten or darken colour vectors and colour palettes
#'
#' Lighten or darken the set of colours in `palettes_palette` or
#' `palettes_colour` objects to create new colour palettes.
#'
#' @param palette An object of class `palettes_palette` or `palettes_colour`.
#' @param shift A numeric vector between 0 and 1 specifying the amount to
#'   lighten or darken by. 0 corresponds to no shift, and 1 corresponds to a
#'   complete shift.
#' @param space The colour space to shift colours in. One of "HCL", "HSL" or
#'   "combined".
#'
#' @return An object of class `palettes_palette` or `palettes_colour`.
#' @keywords internal
#' @noRd
#'
#' @examples
#' # Shifting colours in different colour spaces gives different results. We
#' # demonstrate this here by linearly shifting the lighten amount of red by
#' # 0.1 from 0 to 1.
#' colour_vector <- rep("red", 11)
#' shift_by <- seq(0, 1, 0.1)
#' spaces_palette <- pal_palette(
#'   hcl = pal_lighten(colour_vector, shift = shift_by, space = "HCL"),
#'   hsl = pal_lighten(colour_vector, shift = shift_by, space = "HSL"),
#'   combined = pal_lighten(colour_vector, shift = shift_by, space = "combined")
#' )
#' plot(spaces_palette)
pal_lighten <- function(
  palette,
  shift = 0.5,
  space = c("HCL", "HSL", "combined")
) {

  if (is_palette(palette)) {
    palette_lighten(palette, shift, space)
  } else {
    colour_lighten(palette, shift, space)
  }

}

#' @keywords internal
#' @noRd
#' @rdname pal_lighten
pal_darken <- function(
  palette,
  shift = 0.5,
  space = c("HCL", "HSL", "combined")
) {

  if (is_palette(palette)) {
    palette_lighten(palette, -1 * shift, space)
  } else {
    colour_lighten(palette, -1 * shift, space)
  }

}

colour_lighten <- function(
  palette,
  shift = 0.5,
  space = c("HCL", "HSL", "combined")
) {

  # These checks are done by prismatic::clr_lighten(), but we repeat them here
  # so the error messages are consistent with the palettes API.
  if (!(length(shift) == 1 || (length(shift) == length(palette)))) {
    rlang::abort("`shift` must be of length 1 or the same length as `palette`.")
  }
  space <- rlang::arg_match(space)

  palette <- prismatic::clr_lighten(palette, shift, space)
  as_colour(as.character(palette))

}

palette_lighten <- function(
  palette,
  shift = 0.5,
  space = c("HCL", "HSL", "combined")
) {
  palette <- purrr::map(palette, ~ colour_lighten(.x, shift, space))
  as_palette(palette)
}
