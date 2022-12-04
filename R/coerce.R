# palettes_colour ------------------------------------------------------------

#' @export
vec_ptype2.palettes_colour.palettes_colour <- function(x, y, ...) new_colour()
#' @export
vec_ptype2.palettes_colour.character <- function(x, y, ...) character()
#' @export
vec_ptype2.character.palettes_colour <- function(x, y, ...) character()

# palettes_palette ------------------------------------------------------------

#' @export
vec_ptype2.palettes_palette.palettes_palette <- function(x, y, ...) new_palette()
#' @export
vec_ptype2.palettes_palette.list <- function(x, y, ...) list()
#' @export
vec_ptype2.list.palettes_palette <- function(x, y, ...) list()
