#' Cast colour vectors and colour palettes to tibbles
#'
#' `as_tibble()` turns an existing colour vector or colour palette into a
#' so-called tibble, a data frame with class `tbl_df`.
#'
#' @param x An object of class `palettes_palette` or `palettes_colour`.
#' @param ... Not used.
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @examples
#' x <- pal_colour(c("red", "green", "blue"))
#' as_tibble(x)
#'
#' y <- pal_palette(
#'   pal1 = c("red", "green", "blue"),
#'   pal2 = c("yellow", "orange", "purple")
#' )
#' as_tibble(y)
as_tibble.palettes_colour <- function(x, ...) {
  tibble::tibble(colour = x)
}

#' @export
#' @rdname as_tibble.palettes_colour
as_tibble.palettes_palette <- function(x, ...) {

  purrr::map_dfr(
    x,
    function(x) tibble::tibble(colour = x),
    .id = "palette"
  )

}
