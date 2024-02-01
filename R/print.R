#' @export
obj_print_data.palettes_colour <- function(x, ...) {
  if (vec_is_empty(x)) return(invisible(x))

  out <- colour_format_symbol(x)
  out_nchar <- max(cli::utf8_nchar(out, type = "bytes")) +
    nchar(getOption("palettes.print_sep"))

  cat(
    out,
    sep = getOption("palettes.print_sep"),
    fill = getOption("palettes.print_width") * out_nchar
  )

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
