# TODO: Add accessibility check functions
#' Plot colour vectors and colour palettes
#'
#' Plots a colour palette object.
#'
#' @param x An object of class `palettes_palette` or `palettes_colour`.
#' @param n An integer specifying the number of colours to return.
#' @param direction Sets the order of colours in the scale. If 1, the default,
#'   colours are ordered from first to last If -1, the order of colours is
#'   reversed.
#' @param interpolate The interpolation method. Either "linear" (default) or
#'   "spline".
#' @param ... Not used.
#'
#' @seealso `pal_brewer()`
#' @export
#' @examples
#' # Objects of class `palettes_colour` are plotted as swatches.
#' x <- pal_colour(c("red", "green", "blue"))
#' plot(x)
#'
#' # Objects of class `palettes_palette` with one palette are plotted with
#' # the palette name spanned across the swatches.
#' y <- pal_palette(my_pal = c("red", "green", "blue"))
#' plot(y)
#'
#' # Objects of class `palettes_palette` with multiple palettes are faceted.
#' z <- pal_palette(
#'   pal1 = c("red", "green", "blue"),
#'   pal2 = c("yellow", "orange", "purple")
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
  interpolate = c("linear", "spline"),
  ...
) {
  plot_colour(x, n, direction, interpolate, ...)
}

#' @export
#' @rdname plot.palettes_colour
plot.palettes_palette <- function(
  x,
  n = NULL,
  direction = 1,
  interpolate = c("linear", "spline"),
  ...
) {
  plot_palette(x, n, direction, interpolate, ...)
}

plot_colour <- function(
  x,
  n = NULL,
  direction = 1,
  interpolate = c("linear", "spline")
) {

  x <- pal_brewer(x, n, direction, interpolate)
  x <- tibble::as_tibble(x)
  # When the same colour is repeated in a pal_colour() or pal_palette() object
  # it needs a unique position identifier in order to be plotted in the same
  # order as it appears in the vector.
  x$position <- make.unique(x$colour)
  x$position <- factor(x$position, levels = x$position)

  ggplot2::ggplot(
    x,
    mapping = ggplot2::aes_string(
      x = "position",
      y = 1,
      fill = "colour"
    )
  ) +
    ggplot2::geom_col(width = 1) +
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
  interpolate = c("linear", "spline")
) {

  if (vec_size(x) == 1) {

    cols <- get_palette_colours(x)
    cols_length <- ifelse(is.null(n), vec_size(cols), n)

    plot_colour(x, n, direction, interpolate) +
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
    plot_colour(x, n, direction, interpolate) +
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
