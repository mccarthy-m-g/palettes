# color -----------------------------------------------------------------------

#' @export
format.palettes_color <- function(x, ...) {
  out <- rgb2col(col2rgb(vec_data(x), alpha = FALSE), alpha = FALSE)
  # It's important to keep NA in the vector!
  out[is.na(x)] <- NA
  out
}

#' @export
vec_ptype_full.palettes_color <- function(x, ...) "palettes_color"
#' @export
vec_ptype_abbr.palettes_color <- function(x, ...) "color"

# palette ---------------------------------------------------------------------

#' @export
vec_ptype_full.palettes_palette <- function(x, ...) "palettes_palette"
#' @export
vec_ptype_abbr.palettes_palette <- function(x, ...) "palette"
