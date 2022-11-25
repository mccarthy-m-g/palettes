#' @export
as_tibble.palettes_colour <- function(x, ...) {
  tibble::tibble(colour = x)
}

#' @export
as_tibble.palettes_palette <- function(x, ...) {

  purrr::map_dfr(
    x,
    function(x) tibble::tibble(colour = x),
    .id = "palette"
  )

}
