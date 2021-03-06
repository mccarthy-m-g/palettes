% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/color.R
\name{color}
\alias{color}
\alias{is_color}
\alias{as_color}
\title{\code{color} vector}
\usage{
color(x = character())

is_color(x)

as_color(x)
}
\arguments{
\item{x}{\itemize{
\item For \code{color()}: A character vector of any of the three kinds of R colour
specifications.
\item For \code{as_color()}: An object to be coerced.
\item For \code{is_color()}: An object to test.
}}
}
\value{
An S3 vector of class \code{palettes_color}.
}
\description{
This creates a character vector that represents colours so when it is
printed, colours will be formatted as hexadecimal strings.
}
\details{
Colours can be specified using either:
\itemize{
\item A color name (as listed by colors())
\item a hexadecimal string of the form "#rrggbb" or "#rrggbbaa" (see rgb)
\item A positive integer i meaning palette()\link{i}.
}
}
\examples{
color(c("red", "#A2A0B8", "gray62"))
is_color(c("#DA3A2C", "blue"))
as_color("white")
}
