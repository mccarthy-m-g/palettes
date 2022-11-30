# TODO: Decide on swatch appearance
# TODO: Add accessibility check functions
#' Plot colour palette
#'
#' Plots a colour palette object.
#'
#' @param x An object of class `palettes_palette` or `palettes_colour`.
#' @export
#' @examples
#' x <- pal_colour(c("red", "green", "blue"))
#' plot(x)
#'
#' y <- pal_palette(my_pal = c("red", "green", "blue"))
#' plot(y)
#'
#' z <- pal_palette(
#'   pal1 = c("red", "green", "blue"),
#'   pal2 = c("yellow", "orange", "purple")
#' )
#' plot(z)
plot.palettes_colour <- function(x, ...) {
  plot_colour(x)
}

#' @export
#' @rdname plot.palettes_colour
plot.palettes_palette <- function(x, ...) {
  plot_palette(x)
}

plot_colour <- function(x) {

  x <- tibble::as_tibble(x)
  # When the same colour is repeated in a pal_colour() or pal_palette() object
  # it needs a unique position identifier in order to be plotted in the same
  # order as it appears in the vector.
  x$position <- make.unique(x$colour)

  ggplot2::ggplot(
    x,
    mapping = ggplot2::aes(
      x = factor(position, levels = position),
      y = 1,
      fill = colour
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

plot_palette <- function(x) {

  if (vec_size(x) == 1) {

    cols <- get_palette_colours(x)
    cols <- factor(cols, levels = cols)
    cols_length <- vec_size(cols)

    x |>
      plot_colour() +
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
    x |>
      plot_colour() +
      ggplot2::facet_wrap(~ palette, scales = "free")
  }

}
