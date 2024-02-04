#' Cast colour vectors and colour palettes to tibbles
#'
#' `as_tibble()` turns an existing colour vector or colour palette into a
#' so-called [tibble][tibble::tibble-package], a data frame with class `tbl_df`.
#'
#' @param x An object of class [`palettes_palette`][pal_palette()] or
#'   [`palettes_colour`][pal_colour()].
#' @param ... Not used.
#' @return
#' A [tibble][tibble::tibble-package]. The output has the following properties:
#'
#' * For objects of class [`palettes_colour`][pal_colour()]: A tibble with
#'   column `colour` containing the colour vector.
#' * For objects of class [`palettes_palette`][pal_palette()]: A tibble with
#'   columns `palette` and `colour` containing palette names and colour vectors.
#' @seealso [pal_colour()], [pal_palette()]
#' @export
#' @examples
#' x <- pal_colour(c("#663171", "#EA7428", "#0C7156"))
#' as_tibble(x)
#'
#' y <- pal_palette(
#'   Egypt = c("#DD5129", "#0F7BA2", "#43B284", "#FAB255"),
#'   Java  = c("#663171", "#CF3A36", "#EA7428", "#E2998A", "#0C7156")
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
