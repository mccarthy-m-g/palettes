#' @export
vec_cast.palettes_colour.palettes_colour <- function(x, to, ...) x

#' @export
vec_cast.palettes_colour.character <- function(x, to, ...) pal_colour(x)

#' @export
vec_cast.character.palettes_colour <- function(x, to, ...) vec_data(x)
