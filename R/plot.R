# TODO: Add accessibility check functions
#' Plot colour vectors and colour palettes
#'
#' Plot colour vectors and colour palettes as swatches.
#'
#' @inheritParams pal_ramp
#' @param x An object of class [`palettes_palette`][pal_palette()] or
#'   [`palettes_colour`][pal_colour()].
#' @param ... Not used.
#' @return
#' A [ggplot2][ggplot2::ggplot2-package] object. The output has the following properties:
#'
#' * For objects of class [`palettes_colour`][pal_colour()]: A plot of colour
#'   swatches.
#' * For objects of class [`palettes_palette`][pal_palette()] with one palette:
#'   A plot of colour swatches with the palette name spanned across the swatches.
#' * For objects of class [`palettes_palette`][pal_palette()] with more than one
#'   palette: A faceted plot of colour swatches with palette names as facet
#'   titles.
#' @seealso [pal_colour()], [pal_palette()], [pal_ramp()]
#' @export
#' @examples
#' # Objects of class `palettes_colour` are plotted as swatches.
#' x <- pal_colour(c("darkslateblue", "cornflowerblue", "slategray1"))
#' plot(x)
#'
#' # Objects of class `palettes_palette` with one palette are plotted with
#' # the palette name spanned across the swatches.
#' y <- pal_palette(Egypt = c("#DD5129", "#0F7BA2", "#43B284", "#FAB255"))
#' plot(y)
#'
#' # Objects of class `palettes_palette` with multiple palettes are faceted.
#' z <- pal_palette(
#'   Egypt = c("#DD5129", "#0F7BA2", "#43B284", "#FAB255"),
#'   Java  = c("#663171", "#CF3A36", "#EA7428", "#E2998A", "#0C7156")
#' )
#' plot(z)
#'
#' # Colours can also be interpolated.
#' plot(x, n = 5)
#' plot(y, n = 5)
#' plot(z, n = 5)
plot.palettes_colour <- function(
  x,
  n = NULL,
  direction = 1,
  space = "lab",
  interpolate = c("linear", "spline"),
  ...
) {
  plot_colour(x, n, direction, space, interpolate, ...)
}

#' @export
#' @rdname plot.palettes_colour
plot.palettes_palette <- function(
  x,
  n = NULL,
  direction = 1,
  space = "lab",
  interpolate = c("linear", "spline"),
  ...
) {
  plot_palette(x, n, direction, space, interpolate, ...)
}

plot_colour <- function(
  x,
  n = NULL,
  direction = 1,
  space = "lab",
  interpolate = c("linear", "spline")
) {

  x <- pal_ramp(x, n, direction, space, interpolate)
  x <- tibble::as_tibble(x)
  # When the same colour is repeated in a pal_colour() or pal_palette() object
  # it needs a unique position identifier in order to be plotted in the same
  # order as it appears in the vector.
  x$position <- make.unique(x$colour)
  x$position <- factor(x$position, levels = x$position)

  ggplot2::ggplot(
    x,
    mapping = ggplot2::aes(
      x = .data$position,
      y = 0.5,
      fill = .data$colour
    )
  ) +
    ggplot2::geom_raster() +
    ggplot2::scale_fill_identity() +
    ggplot2::coord_cartesian(expand = FALSE) +
    ggplot2::theme_void() +
    ggplot2::theme(
      plot.margin = ggplot2::margin(0.5, 0.5, 0.5, 0.5, "lines"),
      panel.spacing = ggplot2::unit(1, "lines"),
      strip.text.x = ggplot2::element_text(
        family = "serif",
        size = 11,
        margin = ggplot2::margin(0, 0, 0.5, 0, "lines")
      )
    )

}

plot_palette <- function(
  x,
  n = NULL,
  direction = 1,
  space = "lab",
  interpolate = c("linear", "spline")
) {

  if (vec_size(x) == 1) {

    cols <- get_palette_colours(x)
    cols_length <- ifelse(is.null(n), vec_size(cols), n)

    plot_colour(x, n, direction, space, interpolate) +
      ggplot2::annotate(
        "rect",
        xmin = -Inf, xmax = Inf,
        ymin = 0.4, ymax = 0.6,
        fill = "white",
        alpha = 0.8
      ) +
      ggplot2::annotate(
        "text",
        x = (cols_length + 1) / 2,
        y = 0.5,
        hjust = "inward",
        vjust = "inward",
        label = vec_names(x),
        size = 10.55,
        family = "serif"
      )

  } else {
    plot_colour(x, n, direction, space, interpolate) +
      ggplot2::facet_wrap(~ palette, scales = "free") +
      # When there are a lot of palettes a smaller font size is needed to
      # prevent longer strip text from getting cut off.
      ggplot2::theme(
        strip.text.x = ggplot2::element_text(
          size = ifelse(vec_size(x) > 50, 9, 11)
        )
      )
  }

}
