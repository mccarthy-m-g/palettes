# TODO: Decide on swatch appearance
#' @export
plot.palettes_color <- function(x, ...) {
  colorspace::swatchplot(x, ..., off = 0)
}

#' @export
plot.palettes_palette <- function(x, ...) {
  colorspace::swatchplot(x, ..., off = 0)
}
