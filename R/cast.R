#' @export
vec_cast.palettes_color.palettes_color <- function(x, to, ...) x

#' @export
vec_cast.palettes_color.character <- function(x, to, ...) pal_color(x)

#' @export
vec_cast.character.palettes_color <- function(x, to, ...) vec_data(x)
