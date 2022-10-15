# color -----------------------------------------------------------------------

#' @export
format.palettes_color <- function(x, ...) {
  out <- rgb2col(col2rgb(vec_data(x), alpha = FALSE), alpha = FALSE)
  # It's important to keep NA in the vector!
  out[is.na(x)] <- NA
  out
}

# TODO: Create print method whose output matches the output of format, except
# with the pretty colours applied.
#
# <palettes_color[4]>
# [1] #FF0000FF #A2A0B8FF <NA>      #9E9E9EFF
#
# #' @export
# print.palettes_color <- function(x, ...) {
#   cat(
#     glue("<{vctrs::vec_ptype_full(x)}[{length(x)}]>"),
#     "\n",
#     pretty_color(format(x))
#   )
# }

#' @export
vec_ptype_full.palettes_color <- function(x, ...) "palettes_color"
#' @export
vec_ptype_abbr.palettes_color <- function(x, ...) "color"

# palette ---------------------------------------------------------------------

#' @export
vec_ptype_full.palettes_palette <- function(x, ...) "palettes_palette"
#' @export
vec_ptype_abbr.palettes_palette <- function(x, ...) "palette"
