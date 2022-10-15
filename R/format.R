# colour -----------------------------------------------------------------------

#' @export
format.palettes_colour <- function(x, ...) {
  out <- rgb2col(col2rgb(vec_data(x), alpha = FALSE), alpha = FALSE)
  # It's important to keep NA in the vector!
  out[is.na(x)] <- NA
  out
}

#' @export
vec_ptype_full.palettes_colour <- function(x, ...) "palettes_colour"
#' @export
vec_ptype_abbr.palettes_colour <- function(x, ...) "colour"

# palette ---------------------------------------------------------------------

#' @export
vec_ptype_full.palettes_palette <- function(x, ...) "palettes_palette"
#' @export
vec_ptype_abbr.palettes_palette <- function(x, ...) "palette"
