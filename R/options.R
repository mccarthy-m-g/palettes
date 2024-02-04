#' Package options
#'
#' Options that adjust the behaviour of the palettes package.
#'
#' These options can be set via [options()] and queried via [getOption()].
#'
#' @section Options for the palettes package:
#'
#' \describe{
#'
#' \item{\code{palettes.print_symbol}:}{
#'
#'   Character string setting the symbol used for colour previews. See
#'   [list_colour_symbols()] for a list of symbol choices. Defaults to
#'   `"circle_small"`. Set to `FALSE` to disable printing symbols.
#'
#' }
#' \item{\code{palettes.print_hex}:}{
#'
#'   Logical setting whether to print hex codes in colour previews. Defaults to
#'   `TRUE`.
#'
#' }
#' \item{\code{palettes.print_alpha}:}{
#'
#'   Logical setting whether to print the hex code alpha channel in colour
#'   previews. Defaults to `FALSE`. Colours without an alpha channel will be
#'   assumed to be full opacity.
#'
#' }
#' \item{\code{palettes.print_sep}:}{
#'
#'   Character string to separate colours by in colour previews. Defaults to `""`.
#'
#' }
#' \item{\code{palettes.print_width}:}{
#'
#'   Integer setting the maximum number of colours on a line in colour previews.
#'   Defaults to `1`.
#'
#' }
#' \item{\code{palettes.print_index}:}{
#'
#'   Logical setting whether to print the index of the first colour on each line
#'   in colour previews. Defaults to `FALSE`.
#'
#' }
#'
#' }
#' @section Note:
#' To disable formatting in colour previews set both `palettes.print_symbol` and
#' `palettes.print_hex` to `FALSE`.
#' @name palettes-options
#' @examples
#' options(
#'   palettes.print_symbol = "square",
#'   palettes.print_hex = FALSE,
#'   palettes.print_sep = " ",
#'   palettes.print_width = 3,
#'   palettes.print_index = TRUE
#' )
#' met_palettes$Cross
NULL
