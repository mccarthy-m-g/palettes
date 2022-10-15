#' @export
obj_print_data.palettes_color <- function(x, ...) {
  if (vec_is_empty(x)) {
    return(invisible(x))
  }

  out <- color_format_symbol(x)

  cat(out, sep = "\n")

  invisible(x)
}

color_print <- function(x) {
  obj_print(x)
  invisible(x)
}

#' @export
print.palettes_color <- function(x, ...) {
  color_print(x)
}
