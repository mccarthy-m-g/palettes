#' Cartography palettes
#'
#' Discrete, sequential, and diverging palettes created by cartographers.
#'
#' @source <https://github.com/CartoDB/CartoColor/>
#' @seealso [pal_palette()], [pal_colour()]
#' @name carto_palettes
#' @aliases discrete_palettes, sequential_palettes, diverging_palettes
#' @examples
#' # Get all palettes by name.
#' names(discrete_palettes)
#' names(sequential_palettes)
#' names(diverging_palettes)
#'
#' # Plot all palettes.
#' plot(discrete_palettes)
#' plot(sequential_palettes)
#' plot(diverging_palettes)
NULL

#' @rdname carto_palettes
#' @format ## `discrete_palettes`
#' An object of class `palettes_palette` with `r vec_size(discrete_palettes)`
#' colour palettes. Use `names(discrete_palettes)` to return all palette names.
"discrete_palettes"

#' @rdname carto_palettes
#' @format ## `sequential_palettes`
#' An object of class `palettes_palette` with `r vec_size(sequential_palettes)`
#' colour palettes. Use `names(sequential_palettes)` to return all palette names.
"sequential_palettes"

#' @rdname carto_palettes
#' @format ## `diverging_palettes`
#' An object of class `palettes_palette` with `r vec_size(diverging_palettes)`
#' colour palettes. Use `names(diverging_palettes)` to return all palette names.
"diverging_palettes"

#' Performance palettes
#'
#' A colourblind accessible palette for visualizing performance.
#'
#' @format ## `performance_palettes`
#' An object of class `palettes_palette` with `r vec_size(performance_palettes)`
#' colour palettes. All colours in each palette are distinguishable with
#' deuteranopia, protanopia, and tritanopia. Use `names(performance_palettes)`
#' to return all palette names.
#' @source <https://github.com/easystats/performance/>
#' @seealso [pal_palette()], [pal_colour()]
#' @examples
#' # Get all palettes by name.
#' names(performance_palettes)
#'
#' # Plot all palettes.
#' plot(performance_palettes)
"performance_palettes"

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

#' Palmer penguins palettes
#'
#' Palettes inspired by the Palmer penguins.
#'
#' @format ## `penguin_palettes`
#' An object of class `palettes_palette` with `r vec_size(penguin_palettes)`
#' colour palettes. Use `names(penguin_palettes)` to return all palette names.
#' @source <https://github.com/allisonhorst/palmerpenguins/>
#' @author [Allison Horst](https://github.com/allisonhorst)
#' @seealso [pal_palette()], [pal_colour()]
#' @examples
#' # Get all palettes by name.
#' names(penguin_palettes)
#'
#' # Plot all palettes.
#' plot(penguin_palettes)
"penguin_palettes"

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
