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
