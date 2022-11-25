# options(buildtools.check = function(action) TRUE )

x <- pal_colour(c("red", "#A2A0B8FF", NA, "gray62"))
x
y <- pal_colour(c("red", "green", "blue"))
xy <- pal_palette(v1 = x, v2 = y)
xy
tibble::tibble(pal_colour(c("red", "#ffffff", NA)))

# Class ----
class(x)
class(xy)

# Extract ----
x[1]
xy[1]
xy[[1]]
xy$v1

# Equality ----
x == x
x == x[1]
x[1] == y[1]

xy == xy
xy == xy[1]
xy == pal_colour("red")

# Coerce ----
as_colour("red")

# Format ----
str(x)
data.frame(x)
tibble::as_tibble(x)

str(xy)
data.frame(xy)
tibble::as_tibble(xy)

# Arithmetic ----
x + x
x + rev(x)
pal_colour("red") + pal_colour("blue")


pal_colour("red") + pal_colour("blue") + pal_colour("green") # White
pal_colour("red") + pal_colour("blue") # Purple
pal_colour("red") + pal_colour("green") # Yellow

colorspace::mixcolor(0.5, colorspace::hex("#FF0000"), colorspace::hex("#0000FF"), "XYZ")

# Math ----
cumsum(x)
sum(x)

# Math functions not implemented will throw an error, as they should.
try(mean(x))

# Pretty ----
pretty_colour(x)

cat(pretty_colour(x))
cat(pretty_colour(x + rev(x)))

# ggplot2 scales ----
library(ggplot2)

ggplot(mtcars, aes(wt, mpg, colour = as.factor(cyl))) +
  geom_point(size = 3) +
  scale_colour_palette_d(pal_palette(mypal = c("red", "blue", "green")))

ggplot(mtcars, aes(wt, mpg, colour = mpg)) +
  geom_point(size = 3) +
  scale_colour_palette_c(pal_palette(mypal = c("red", "blue", "green")))

ggplot(mtcars, aes(wt, mpg, colour = mpg)) +
  geom_point(size = 3) +
  scale_colour_palette_b(pal_palette(mypal = c("red", "blue", "green")))

# Plot ----
plot(x)

plot(xy)

plot(xy$v2)
plot(xy["v2"])

scales::show_col(as.character(format(na.omit(x))))

ggplot2::ggplot(mapping = ggplot2::aes(
  x = 1,
  y = as.character(format(na.omit(x))),
  fill = as.character(format(na.omit(x)))
  )
) +
  ggplot2::geom_col(width = 1) +
  ggplot2::geom_text(mapping = ggplot2::aes(
    label = as.character(format(na.omit(x))),
    x = 0.1
    ),
    family = "mono"
  ) +
  ggplot2::scale_fill_identity() +
  ggplot2::theme_void() +
  ggplot2::theme(legend.position = "none")

#' Show colours
#'
#' A quick and dirty way to show colours in a plot.
#'
#' @param colours A character vector of colours
#' @param labels Label each colour with its hex name?
#' @param borders Border colour for each tile. Default uses `par("fg")`.
#'    Use `border = NA` to omit borders.
#' @param cex_label Size of printed labels, as multiplier of default size.
#' @param ncol Number of columns. If not supplied, tries to be as square as
#'   possible.
#' @export
#' @importFrom graphics par plot rect text
#' @keywords internal
#' @examples
#' show_col(hue_pal()(9))
#' show_col(hue_pal()(9), borders = NA)
#'
#' show_col(viridis_pal()(16))
#' show_col(viridis_pal()(16), labels = FALSE)
show_col <- function(colours, labels = TRUE, borders = NULL, cex_label = 1,
                     ncol = NULL) {
  n <- length(colours)
  ncol <- ncol %||% ceiling(sqrt(length(colours)))
  nrow <- ceiling(n / ncol)

  colours <- c(colours, rep(NA, nrow * ncol - length(colours)))
  colours <- matrix(colours, ncol = ncol, byrow = TRUE)

  old <- par(pty = "s", mar = c(0, 0, 0, 0))
  on.exit(par(old))

  size <- max(dim(colours))
  plot(c(0, size), c(0, -size), type = "n", xlab = "", ylab = "", axes = FALSE)
  rect(col(colours) - 1, -row(colours) + 1, col(colours), -row(colours),
       col = colours, border = borders
  )
  if (labels) {
    hcl <- farver::decode_colour(colours, "rgb", "hcl")
    label_col <- ifelse(hcl[, "l"] > 50, "black", "white")

    text(col(colours) - 0.5, -row(colours) + 0.5, colours, cex = cex_label, col = label_col)
  }
}

# ----
x <- pal_colour(c("red", "#A2A0B8FF", "gray62"))
y <- pal_colour(c("red", "green", "blue"))
z <- pal_palette(my_palette = y)
xy <- pal_palette(v1 = x, v2 = y)
xy

# Borrowed/modified from MetBrewer::print.palette
plot_colour <- function(x) {

  pal_length <- vec_size(x)

  # Make the plot margins small for better aesthetics
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(
    x = 1:pal_length, y = 1, z = as.matrix(1:pal_length),
    col = x,
    xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n"
  )

}

plot_colour(y)

plot_palette <- function(x, direction = 1) {

  if (vec_size(x) == 1) {
    pal_length <- vec_size(get_palette_colours(x))

    # Make the plot margins small for better aesthetics
    old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
    on.exit(par(old))

    image(
      x = 1:pal_length, y = 1, z = as.matrix(1:pal_length),
      col = get_palette_colours(x, direction),
      xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n"
    )
    rect(0, 0.92, pal_length + 1, 1.08, col = rgb(1, 1, 1, 0.8), border = NA)
    text((pal_length + 1) / 2, 1, labels = attr(x, "name"), cex = 2.5, family = "serif")
  } else {
    warning("Multiple palettes supplied, please only use one.")
  }

}

plot_palette(xy)
plot_palette(z)
plot_palette(z, -1)

plot_palette_2 <- function(x) {

  cols <- get_palette_colours(x)
  cols <- factor(cols, levels = cols)
  cols_length <- vec_size(cols)

  ggplot2::ggplot(
    mapping = ggplot2::aes(
      x = as.factor(na.omit(cols)),
      y = 1,
      fill = as.factor(na.omit(cols))
    )
  ) +
    ggplot2::geom_col(width = 1) +
    ggplot2::scale_fill_identity() +
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
    ) +
    ggplot2::coord_cartesian(expand = FALSE) +
    ggplot2::theme_void() +
    ggplot2::theme(
      plot.margin = ggplot2::margin(0.5, 0.5, 0.5, 0.5, "lines")
    )

}

plot_palette_2(z)


purrr::map_dfr(xy, function(x) x, .id = "palette")

plot_palette_3 <- function(x) {

  # FIXME: colours don't respect order
  x |>
    as_tibble() |>
    ggplot2::ggplot(
      mapping = ggplot2::aes(
        x = as.factor(colour),
        y = 1,
        fill = as.factor(colour)
      )
    ) +
    ggplot2::geom_col(width = 1) +
    ggplot2::scale_fill_identity() +
    ggplot2::facet_wrap(~ palette, scales = "free") +
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

plot_palette_3(xy)


# Borrowed/modifed from MetBrewer::display_all
plot_all_palettes <- function(x) {

  pal_length <- vec_size(x)
  pal_names <- names(x)

  orig_pars <- par()

  plott_palette <- function(name) {

    par(mar = c(0.1,0.1,1,0.1))

    pall_length <- vec_size(get_palette_colours(x[name]))

    plot(0,type='n',bty='n',xaxt='n',yaxt='n',xlab='',ylab='',
         ylim = c(0,1),xlim=c(0,pall_length), main = name)

    for(j in 1:pall_length){
      polygon(x = c(j-1,j-1,j,j),
              y = c(0,1,1,0),
              border = NA,
              col = get_palette_colours(x[name])[j])
    }

  }

  layout(matrix(1:pal_length))
  for(i in 1:pal_length) plott_palette(pal_names[i])

}

plot_all_palettes(xy)

w <- pal_palette(v1 = x, v2 = y, v3 = x, v4 = y, v5 = x, v6 = y)
plot_all_palettes(w)
