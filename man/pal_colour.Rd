% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pal_colour.R
\name{pal_colour}
\alias{pal_colour}
\alias{is_colour}
\alias{as_colour}
\alias{as_colour.default}
\alias{as_colour.palettes_palette}
\alias{pal_color}
\alias{is_color}
\alias{as_color}
\title{Colour vectors}
\usage{
pal_colour(x = character())

is_colour(x)

as_colour(x)

\method{as_colour}{default}(x)

\method{as_colour}{palettes_palette}(x)
}
\arguments{
\item{x}{\itemize{
\item For \code{pal_colour()}: A character vector of any of the three kinds of R colour
specifications.
\item For \code{as_colour()}: An object to be coerced.
\item For \code{is_colour()}: An object to test.
}}
}
\value{
An S3 vector of class \code{palettes_colour}.
}
\description{
This creates a character vector that represents colours so when it is
printed, colours will be formatted as hexadecimal strings.
}
\details{
Colours can be specified using either:
\itemize{
\item Hexadecimal strings of the form \code{"#RRGGBB"} or \code{"#RRGGBBAA"}
\item Colour names from \code{\link[grDevices:colors]{grDevices::colors()}}
\item Positive integers \code{i} that index into \code{\link[grDevices:palette]{grDevices::palette()}}\verb{[i]}
}
}
\examples{
pal_colour(c("darkred", "#0F7BA2"))

is_colour("darkred")
is_colour(pal_colour("darkred"))

as_colour("#0F7BA2")
}
\seealso{
\code{\link[=pal_palette]{pal_palette()}}
}
