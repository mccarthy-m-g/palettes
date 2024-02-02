#' @export
obj_print_data.palettes_colour <- function(x, ...) {
  if (vec_is_empty(x)) return(invisible(x))

  print_sep   <- getOption("palettes.print_sep")
  print_width <- getOption("palettes.print_width")
  print_index <- getOption("palettes.print_index")

  out <- colour_format_symbol(x)
  out_nchar <- max(cli::ansi_nchar(out, type = "width")) + nchar(print_sep)
  out_width <- print_width * out_nchar

  if (print_index) {
    index <- paste0("[", seq(from = 1, to = vec_size(x), by = print_width), "]")
    index_nchar <- max(nchar(index))
    index <- format(index, width = index_nchar, justify = "left")
    out_width <- out_width + index_nchar + 1
  } else {
    index <- NULL
  }

  # Formatting each row manually ensures that the the maximum number of colours
  # on a line and their indexes will always be correct; otherwise, when letting
  # cat() determine what's on a line, there are edge cases when there are NAs in
  # the colour vector or formatting is disabled where the maximum number of
  # colours on a line isn't respected. Likewise, although cli::ansi_columns()
  # performs a similar function to the code below, it has some quirks that make
  # it unsuitable here (such as putting a separator after the last item).
  out <- split(out, ceiling(seq_along(out)/print_width))
  out <- purrr::map_chr(out, paste0, collapse = print_sep)
  out[1:vec_size(out) - 1] <- purrr::map_chr(
    out[1:vec_size(out) - 1], function(.x) paste0(.x, print_sep)
  )

  cat(out, sep = "", fill = out_width, labels = index)
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
