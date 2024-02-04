#' Symbols to use in colour previews
#'
#' List the symbols available to use in colour previews.
#'
#' @details
#' By default, Unicode characters are used for symbols in colour previews in
#' UTF-8 supported outputs. They automatically fall back to ASCII characters
#' when the output does not support them.
#'
#' To change the symbol used for colour previews, set the `palettes.print_symbol`
#' option to a symbol name listed in `list_colour_symbols()`.
#' @return This function is called for its side effects and has no return value.
#' @seealso [`help("palettes-options")`][palettes-options], [cli::is_utf8_output()]
#' @export
#'
#' @examples
#' list_colour_symbols()
list_colour_symbols <- function() {
  width <- 50
  cat(
    cli::rule(
      left = "options(palettes.print_symbol = ...)",
      width = width + 10
    ),
    cli::ansi_columns(
      paste0(pal_symbol, "\t", names(pal_symbol)),
      width = width,
      fill = "cols",
      max_cols = 2,
      align = "left"
    ),
    sep = "\n"
  )
}

#' @export
#' @rdname list_colour_symbols
#' @usage NULL
list_color_symbols <- list_colour_symbols

symbol_utf8 <- list(
  "circle_small" = "\u2022",
  "circle" = "\u25CF",
  "circle_medium" = "\u26AB",
  "circle_large" = "\u2B24",

  "ellipse_horizontal" = "\u2B2C",
  "ellipse_vertical" = "\u2B2E",

  "triangle_up" = "\u25B2",
  "triangle_down" = "\u25BC",
  "triangle_left" = "\u25C0",
  "triangle_right" = "\u25B6",

  "square_small" = "\u25AA",
  "square" = "\u25A0",
  "square_medium" = "\u25FC",
  "square_large" = "\u2B1B",

  "block" = "\u2587",
  "block_full" = "\u2588",

  "diamond_small" = "\u2B29",
  "diamond" = "\u25C6",
  "diamond_medium" = "\u2B25",

  "pentagon" = "\u2B1F",
  "hexagon" = "\u2B22",

  "star" = "\u2605",
  "heart" = "\u2665",
  "smiley" = "\u263A",
  "moustache" = "\u0DF4"
)

symbol_ascii <- list(
  "circle_small" = "*",
  "circle" = "*",
  "circle_medium" = "*",
  "circle_large" = "*",

  "ellipse_horizontal" = "*",
  "ellipse_vertical" = "*",

  "triangle_up" = "^",
  "triangle_down" = "v",
  "triangle_left" = "<",
  "triangle_right" = ">",

  "square_small" = "[x]",
  "square" = "[x]",
  "square_medium" = "[x]",
  "square_large" = "[x]",

  "block" = "#",
  "block_full" = "#",

  "diamond_small" = "[+]",
  "diamond" = "[+]",
  "diamond_medium" = "[+]",

  "pentagon" = "*",
  "hexagon" = "*",

  "star" = "*",
  "heart" = "<3",
  "smiley" = ":)",
  "moustache" = "/\\/"
)
