#' #' Colour blending
#' #'
#' #' Blends two colors using RGB channel-wise blend functions. Valid blend modes
#' #' are multiply, darken, lighten, screen, overlay, burn, and dodge.
#' #'
#' #' @param a,b Objects of class `palettes_colour`.
#' #' @param mode The colour blending mode.
#' #'
#' #' @return An object of class `palettes_colour`.
#' #' @export
pal_blend <- function(a, b, mode = blend_modes()) {
  # https://github.com/gka/chroma.js/blob/75ea5d8a5480c90ef1c7830003ac63c2d3a15c03/src/generator/blend.js

  mode <- rlang::arg_match(mode)
  # Matrices won't recycle so we have to recycle the colour vectors before
  # decoding them.
  vec_ab <- vec_recycle_common(a, b)
  a <- farver::decode_colour(vec_ab[[1]], to = "rgb")
  b <- farver::decode_colour(vec_ab[[2]], to = "rgb")

  if (mode == "normal")   clr <- a
  if (mode == "multiply") clr <- a * b / 255
  if (mode == "darken")   clr <- ifelse(a > b, b, a)
  if (mode == "lighten")  clr <- ifelse(a > b, a, b)
  if (mode == "screen")   clr <- 255 * (1 - (1 - a/255) * (1 - b/255))
  if (mode == "overlay")  clr <- ifelse(b < 128, 2 * a * b / 255, 255 * (1 - 2 * (1 - a / 255 ) * ( 1 - b / 255 )))
  if (mode == "burn")     clr <- 255 * (1 - (1 - b / 255) / (a/255))
  # FIXME: Can give NAs!
  if (mode == "dodge")    clr <- 255 * (b / 255) / (1 - a / 255)

  clr <- farver::encode_colour(clr, from = "rgb")
  as_colour(clr)

}
#'
#' #' @export
blend_modes <- function() {
  c("normal", "multiply", "darken", "lighten", "screen", "overlay", "burn", "dodge")
}
