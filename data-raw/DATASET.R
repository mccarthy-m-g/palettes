## code to prepare `DATASET` dataset goes here
load_all()
library(purrr)

# MetBrewer palettes ----
met_palettes <- MetBrewer::MetPalettes |>
  map(1) |>
  map(as_colour) |>
  new_palette()

usethis::use_data(met_palettes, overwrite = TRUE)

met_palettes_a11y <- met_palettes[
  names(met_palettes) %in% MetBrewer::colorblind_palettes
]

usethis::use_data(met_palettes_a11y, overwrite = TRUE)

# viridisLite ----

n_colours <- 9

viridis_palettes <- pal_palette(
  viridis = viridisLite::viridis(n_colours),
  magma   = viridisLite::magma(n_colours),
  inferno = viridisLite::inferno(n_colours),
  plasma  = viridisLite::plasma(n_colours),
  cividis = viridisLite::cividis(n_colours),
  rocket  = viridisLite::rocket(n_colours),
  mako    = viridisLite::mako(n_colours),
  turbo   = viridisLite::turbo(n_colours)
)

usethis::use_data(viridis_palettes, overwrite = TRUE)

