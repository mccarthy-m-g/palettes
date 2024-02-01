#' @export
obj_print_data.palettes_colour <- function(x, ...) {
  if (vec_is_empty(x)) return(invisible(x))

  print_sep   <- getOption("palettes.print_sep")
  print_width <- getOption("palettes.print_width")
  print_index <- getOption("palettes.print_index")

  out <- colour_format_symbol(x)
  out_nchar <- max(cli::utf8_nchar(out, type = "bytes")) + nchar(print_sep)
  out_width <- print_width * out_nchar

  if (print_index) {
    index <- paste0("[", seq(from = 1, to = vec_size(x), by = print_width), "]")
    index_nchar <- max(nchar(index))
    index <- format(index, width = index_nchar, justify = "left")
    out_width <- out_width + index_nchar + 1
  }

  cat(
    out,
    sep = print_sep,
    fill = out_width,
    labels = switch(print_index + 1, NULL, index)
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
