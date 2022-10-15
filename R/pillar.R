#' @importFrom pillar pillar_shaft
#' @export
pillar_shaft.palettes_colour <- function(x, ...) {
  pillar::new_pillar_shaft_simple(colour_format_symbol(x))
}
