colour_symbol <- function(x) {
  style_box <- cli::make_ansi_style(x)
  style_box(cli::symbol$bullet)
}

colour_format_symbol <- function(x, ...) {
  vapply(
    x,
    function(x) {
      colour_index <- !is.na(x)
      if (colour_index) {
        paste(colour_symbol(x), format(x))
      } else {
        "     <NA>"
      }
    },
    FUN.VALUE = character(1),
    USE.NAMES = FALSE
  )
}
