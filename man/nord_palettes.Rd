% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/included-palettes.R
\docType{data}
\name{nord_palettes}
\alias{nord_palettes}
\title{Nord palettes}
\format{
\subsection{\code{nord_palettes}}{

An object of class \code{palettes_palette} with 16
colour palettes. Use \code{names(nord_palettes)} to return all palette names.
}
}
\source{
\url{https://github.com/jkaupp/nord}
}
\usage{
nord_palettes
}
\description{
Dimmed pastel palettes inspired by the Arctic and Canadian wilderness.
}
\examples{
# Get all palettes by name.
names(nord_palettes)

# Plot all palettes.
plot(nord_palettes)
}
\seealso{
\code{\link[=pal_palette]{pal_palette()}}, \code{\link[=pal_colour]{pal_colour()}}, \code{\link[nord:nord]{nord::nord()}}
}
\author{
\href{https://github.com/jkaupp}{Jake Kaupp}
}
\keyword{datasets}
