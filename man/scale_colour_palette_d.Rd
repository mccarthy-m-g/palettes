% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale_colour.R
\name{scale_colour_palette_d}
\alias{scale_colour_palette_d}
\alias{scale_fill_palette_d}
\alias{scale_colour_palette_c}
\alias{scale_fill_palette_c}
\alias{scale_colour_palette_b}
\alias{scale_fill_palette_b}
\alias{scale_color_palette_d}
\alias{scale_color_palette_c}
\alias{scale_color_palette_b}
\title{Colour scales from palettes}
\usage{
scale_colour_palette_d(palette, direction = 1, ...)

scale_fill_palette_d(palette, direction = 1, ...)

scale_colour_palette_c(palette, direction = 1, ...)

scale_fill_palette_c(palette, direction = 1, ...)

scale_colour_palette_b(palette, direction = 1, ...)

scale_fill_palette_b(palette, direction = 1, ...)
}
\arguments{
\item{palette}{A colour palette of class \code{palettes_palette}.}

\item{direction}{Sets the order of colours in the scale. If 1, the default,
colours are ordered from first to last If -1, the order of colours is
reversed.}

\item{...}{Other arguments passed on to \code{ggplot2::discrete_scale()},
\code{ggplot2::continuous_scale()}, or \code{ggplot2::binned_scale} to control name,
limits, breaks, labels and so forth.}
}
\description{
Colour scales from palettes
}
\examples{

library(ggplot2)

rgb_pal <- pal_palette(rgb = c("red", "green", "blue"))

# Use palette_d with discrete data
ggplot(mtcars, aes(wt, mpg, colour = as.factor(cyl))) +
  geom_point(size = 3) +
  scale_colour_palette_d(rgb_pal)

# Use palette_c with continuous data
ggplot(mtcars, aes(wt, mpg, colour = mpg)) +
  geom_point(size = 3) +
  scale_colour_palette_c(rgb_pal)

# Use palette_b to bin continuous data before mapping
ggplot(mtcars, aes(wt, mpg, colour = mpg)) +
  geom_point(size = 3) +
  scale_colour_palette_b(rgb_pal)
}