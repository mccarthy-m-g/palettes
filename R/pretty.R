colour_symbol <- function(x) {
  style_box <- cli::make_ansi_style(x)
  style_box(pal_symbol[getOption("palettes.print_symbol")])
}

colour_format_symbol <- function(x, ...) {
  print_symbol <- !isFALSE(getOption("palettes.print_symbol"))
  print_hex    <- isTRUE(getOption("palettes.print_hex"))

  out <- purrr::map_chr(
    x,
    function(.x) {
      colour_index <- !is.na(.x)
      if (print_hex && print_symbol) {
        ifelse(colour_index, paste(colour_symbol(.x), format(.x)), "<NA>")
      } else if (!print_hex && print_symbol) {
        ifelse(colour_index, colour_symbol(.x), "<NA>")
      } else if (print_hex && !print_symbol) {
        ifelse(colour_index, format(.x), "<NA>")
      } else {
        ifelse(colour_index, paste0("\"", .x, "\""), "NA")
      }
    }
  )

  out_width <- max(cli::ansi_nchar(out, type = "width"))
  cli::ansi_align(out, width = out_width, align = "right", type = "width")
}
