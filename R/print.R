#' @export
obj_print_data.palettes_colour <- function(x, ...) {
  if (vec_is_empty(x)) {
    return(invisible(x))
  }

  out <- colour_format_symbol(x)

  cat(out, sep = "\n")

  invisible(x)
}

colour_print <- function(x) {
  obj_print(x)
  invisible(x)
}

#' @export
print.palettes_colour <- function(x, ...) {
  colour_print(x)
}
