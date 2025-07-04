% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/included-palettes.R
\docType{data}
\name{viridis_palettes}
\alias{viridis_palettes}
\title{Viridis palettes}
\format{
\subsection{\code{viridis_palettes}}{

An object of class \code{palettes_palette} with 8
colour palettes. All colours in each palette are distinguishable with
deuteranopia, protanopia, and tritanopia. Use \code{names(viridis_palettes)} to
return all palette names.
}
}
\source{
\url{https://github.com/sjmgarnier/viridisLite}
}
\usage{
viridis_palettes
}
\description{
Colourblind accessible palettes that are perceptually uniform in both colour
and black-and-white.
}
\examples{
# Get all palettes by name.
names(viridis_palettes)

# Plot all palettes.
plot(viridis_palettes, n = 256)
}
\seealso{
\code{\link[=pal_palette]{pal_palette()}}, \code{\link[=pal_colour]{pal_colour()}}, \code{\link[viridisLite:viridis]{viridisLite::viridis()}}
}
\author{
\href{https://github.com/sjmgarnier}{Simon Garnier}
}
\keyword{datasets}
