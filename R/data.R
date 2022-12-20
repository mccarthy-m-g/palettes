#' Metropolitan Museum of Art palettes
#'
#' Palettes inspired by works at the Metropolitan Museum of Art in New York.
#' Pieces selected come from various time periods, regions, and mediums.
#'
#' @format ## `met_palettes`
#' An object of class `palettes_palette` with `r vec_size(met_palettes)` colour
#' palettes. Use `names(met_palettes)` to return all palette names.
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
#' An object of class `palettes_palette` limited to
#' `r vec_size(met_palettes_a11y)` colourblind accessible palettes. All colours
#' in each palette are distinguishable with deuteranopia, protanopia, and
#' tritanopia. Use `names(met_palettes_a11y)` to return all palette names.
"met_palettes_a11y"

#' Nord palettes
#'
#' Dimmed pastel palettes inspired by the Arctic and Canadian wilderness.
#'
#' @format ## `nord_palettes`
#' An object of class `palettes_palette` with `r vec_size(nord_palettes)`
#' colour palettes. Use `names(nord_palettes)` to return all palette names.
#' @source <https://github.com/jkaupp/nord>
#' @author [Jake Kaupp](https://github.com/jkaupp)
#' @seealso [pal_palette()], [pal_colour()], [nord::nord()]
#' @examples
#' # Get all palettes by name.
#' names(nord_palettes)
#'
#' # Plot all palettes.
#' plot(nord_palettes)
"nord_palettes"

#' Pacific Northwest palettes
#'
#' Palettes inspired by Jake Lawlor's photos of the dreamiest, most colourful,
#' PNW-iest places in Washington State.
#'
#' @format ## `pnw_palettes`
#' An object of class `palettes_palette` with `r vec_size(pnw_palettes)` colour
#' palettes. Use `names(pnw_palettes)` to return all palette names.
#' @source <https://github.com/jakelawlor/PNWColors>
#' @author [Jake Lawlor](https://github.com/jakelawlor)
#' @seealso [pal_palette()], [pal_colour()], [PNWColors::pnw_palette()]
#' @examples
#' # Get all palettes by name.
#' names(pnw_palettes)
#'
#' # Plot all palettes.
#' plot(pnw_palettes)
"pnw_palettes"

#' Viridis palettes
#'
#' Colourblind accessible palettes that are perceptually uniform in both colour
#' and black-and-white.
#'
#' @format ## `viridis_palettes`
#' An object of class `palettes_palette` with `r vec_size(viridis_palettes)`
#' colour palettes. All colours in each palette are distinguishable with
#' deuteranopia, protanopia, and tritanopia. Use `names(viridis_palettes)` to
#' return all palette names.
#' @source <https://github.com/sjmgarnier/viridisLite>
#' @author [Simon Garnier](https://github.com/sjmgarnier)
#' @seealso [pal_palette()], [pal_colour()], [viridisLite::viridis()]
#' @examples
#' # Get all palettes by name.
#' names(viridis_palettes)
#'
#' # Plot all palettes.
#' plot(viridis_palettes, n = 256)
"viridis_palettes"
