#' @importFrom pillar pillar_shaft
#' @export
pillar_shaft.palettes_color <- function(x, ...) {
  pillar::new_pillar_shaft_simple(color_format_symbol(x))
}
