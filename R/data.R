#' Metropolitan Museum of Art palettes
#'
#' Palettes inspired by works at the Metropolitan Museum of Art in New York.
#' Pieces selected come from various time periods, regions, and mediums.
#'
#' @format ## `met_palettes`
#' An object of class `palettes_palette`. Use `names(met_palettes)` to return
#' all palette names.
#' @source <https://github.com/BlakeRMills/MetBrewer>
#' @author [Blake Robert Mills](https://github.com/BlakeRMills)
#' @seealso [pal_palette()], [pal_colour()], [MetBrewer::met.brewer()]
#' @examples
#' # Get all palettes by name.
#' names(met_palettes)
#'
#' # Plot all palettes.
#' plot(met_palettes)
"met_palettes"

#' @rdname met_palettes
#' @format ## `met_palettes_a11y`
#' An object of class `palettes_palette` limited to colourblind accessible
#' palettes. All colours in each palette are distinguishible with deuteranopia,
#' protanopia, and tritanopia. Use `names(met_palettes_a11y)` to return all
#' palette names.
"met_palettes_a11y"

#' Viridis palettes
#'
#' Colourblind accessible palettes that are perceptually uniform in both colour
#' and black-and-white.
#'
#' @format ## `viridis_palettes`
#' An object of class `palettes_palette`. All colours in each palette are
#' distinguishible with deuteranopia, protanopia, and tritanopia. Use
#' `names(met_palettes)` to return all palette names.
#' @source <https://github.com/sjmgarnier/viridisLite>
#' @author [Simon Garnier](https://github.com/sjmgarnier)
#' @seealso [pal_palette()], [pal_colour()], [viridisLite::viridis()]
#' @examples
#' # Get all palettes by name.
#' names(viridis_palettes)
#'
#' # Plot all palettes.
#' plot(viridis_palettes)
"viridis_palettes"
