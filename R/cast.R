# palettes_colour ------------------------------------------------------------

#' @export
vec_cast.palettes_colour.palettes_colour <- function(x, to, ...) x

#' @export
vec_cast.palettes_colour.character <- function(x, to, ...) pal_colour(x)

#' @export
vec_cast.character.palettes_colour <- function(x, to, ...) vec_data(x)

# palettes_palette ------------------------------------------------------------

#' @export
vec_cast.palettes_palette.palettes_palette <- function(x, to, ...) x

#' @export
vec_cast.palettes_palette.list <- function(x, to, ...) do.call(pal_palette, x)

#' @export
vec_cast.list.palettes_palette <- function(x, to, ...) vec_data(x)
