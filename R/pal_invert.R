#' #' Invert a colour vector
#' #'
#' #' @param x An object of class `palettes_palette` or `palettes_colour`.
#' #'
#' #' @return An object of the same type as `x`.
#' #' @export
#' #'
#' #' @examples
#' #' pal_invert("white")
pal_invert <- function(x) {
  UseMethod("pal_invert")
}

#' #' @export
#' #' @rdname pal_invert
pal_invert.default <- function(x) {
  x_in  <- farver::decode_colour(validate_colour(x), to = "rgb")
  x_out <- farver::encode_colour(255 - x_in, from = "rgb")
  new_colour(x_out)
}

#' #' @export
#' #' @rdname pal_invert
pal_invert.palettes_colour <- function(x) {
  NextMethod()
}

#' #' @export
#' #' @rdname pal_invert
pal_invert.palettes_palette <- function(x) {
  palette <- purrr::map(x, function(x) pal_invert(x))
  new_palette(palette)
}
