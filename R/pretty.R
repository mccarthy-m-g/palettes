color_symbol <- function(x) {
  style_box <- cli::make_ansi_style(x)
  style_box(cli::symbol$bullet)
}

color_format_symbol <- function(x, ...) {
  vapply(
    x,
    function(x) {
      color_index <- !is.na(x)
      if (color_index) {
        paste(color_symbol(x), format(x))
      } else {
        "     <NA>"
      }
    },
    FUN.VALUE = character(1),
    USE.NAMES = FALSE
  )
}
