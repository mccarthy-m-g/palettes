# FIXME: The string colour needs to be improved.
color_style <- function(x) {
  string <- crayon::make_style("white")
  background <- crayon::make_style(x, bg = TRUE)
  style_function <- crayon::combine_styles(string, background)

  style_function(x)
}

# FIXME: No formatting happens here so colours written as strings will
# return as strings.
pretty_color <- function(x) {
  # TODO: Replace with purrr
  vapply(
    x,
    function(x) {
      color_index <- !is.na(x)
      if (color_index) color_style(x) else "<NA>     "
    },
    FUN.VALUE = character(1),
    USE.NAMES = FALSE
  )
}
