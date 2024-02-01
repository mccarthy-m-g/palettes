#' @importFrom pillar pillar_shaft
#' @export
pillar_shaft.palettes_colour <- function(x, ...) {
  # Hex codes should always be printed in tibbles.
  op <- options(palettes.print_hex = TRUE)
  on.exit(options(op))
  pillar::new_pillar_shaft_simple(colour_format_symbol(x))
}
