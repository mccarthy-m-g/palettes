## code to prepare `DATASET` dataset goes here
load_all()
library(purrr)

# Cartography palettes ----
discrete_palettes <- pal_palette(
  Antique = c("#855C75", "#D9AF6B", "#AF6458", "#736F4C", "#526A83", "#625377", "#68855C", "#9C9C5E", "#A06177", "#8C785D", "#467378", "#7C7C7C"),
  Bold = c("#7F3C8D", "#11A579", "#3969AC", "#F2B701", "#E73F74", "#80BA5A", "#E68310", "#008695", "#CF1C90", "#f97b72", "#4b4b8f", "#A5AA99"),
  Pastel = c("#66C5CC", "#F6CF71", "#F89C74", "#DCB0F2", "#87C55F", "#9EB9F3", "#FE88B1", "#C9DB74", "#8BE0A4", "#B497E7", "#D3B484", "#B3B3B3"),
  Prism = c("#5F4690", "#1D6996", "#38A6A5", "#0F8554", "#73AF48", "#EDAD08", "#E17C05", "#CC503E", "#94346E", "#6F4070", "#994E95", "#666666"),
  Safe = c("#88CCEE", "#CC6677", "#DDCC77", "#117733", "#332288", "#AA4499", "#44AA99", "#999933", "#882255", "#661100", "#6699CC", "#888888"),
  Vivid = c("#E58606", "#5D69B1", "#52BCA3", "#99C945", "#CC61B0", "#24796C", "#DAA51B", "#2F8AC4", "#764E9F", "#ED645A", "#CC3A8E", "#A5AA99"),
)

sequential_palettes <- pal_palette(
  Burg       = c("#ffc6c4", "#f4a3a8", "#e38191", "#cc607d", "#ad466c", "#8b3058", "#672044"),
  BurgYl     = c("#fbe6c5", "#f5ba98", "#ee8a82", "#dc7176", "#c8586c", "#9c3f5d", "#70284a"),
  RedOr      = c("#f6d2a9", "#f5b78e", "#f19c7c", "#ea8171", "#dd686c", "#ca5268", "#b13f64"),
  OrYel      = c("#ecda9a", "#efc47e", "#f3ad6a", "#f7945d", "#f97b57", "#f66356", "#ee4d5a"),
  Peach      = c("#fde0c5", "#facba6", "#f8b58b", "#f59e72", "#f2855d", "#ef6a4c", "#eb4a40"),
  PinkYl     = c("#fef6b5", "#ffdd9a", "#ffc285", "#ffa679", "#fa8a76", "#f16d7a", "#e15383"),
  Mint       = c("#e4f1e1", "#b4d9cc", "#89c0b6", "#63a6a0", "#448c8a", "#287274", "#0d585f"),
  BluGrn     = c("#c4e6c3", "#96d2a4", "#6dbc90", "#4da284", "#36877a", "#266b6e", "#1d4f60"),
  DarkMint   = c("#d2fbd4", "#a5dbc2", "#7bbcb0", "#559c9e", "#3a7c89", "#235d72", "#123f5a"),
  Emrld      = c("#d3f2a3", "#97e196", "#6cc08b", "#4c9b82", "#217a79", "#105965", "#074050"),
  BluYl      = c("#f7feae", "#b7e6a5", "#7ccba2", "#46aea0", "#089099", "#00718b", "#045275"),
  Teal       = c("#d1eeea", "#a8dbd9", "#85c4c9", "#68abb8", "#4f90a6", "#3b738f", "#2a5674"),
  TealGrn    = c("#b0f2bc", "#89e8ac", "#67dba5", "#4cc8a3", "#38b2a3", "#2c98a0", "#257d98"),
  Purp       = c("#f3e0f7", "#e4c7f1", "#d1afe8", "#b998dd", "#9f82ce", "#826dba", "#63589f"),
  PurpOr     = c("#f9ddda", "#f2b9c4", "#e597b9", "#ce78b3", "#ad5fad", "#834ba0", "#573b88"),
  Sunset     = c("#f3e79b", "#fac484", "#f8a07e", "#eb7f86", "#ce6693", "#a059a0", "#5c53a5"),
  Magenta    = c("#f3cbd3", "#eaa9bd", "#dd88ac", "#ca699d", "#b14d8e", "#91357d", "#6c2167"),
  SunsetDark = c("#fcde9c", "#faa476", "#f0746e", "#e34f6f", "#dc3977", "#b9257a", "#7c1d6f"),
  BrwnYl     = c("#ede5cf", "#e0c2a2", "#d39c83", "#c1766f", "#a65461", "#813753", "#541f3f")
)

diverging_palettes <- pal_palette(
  ArmyRose = c("#798234", "#a3ad62", "#d0d3a2", "#fdfbe4", "#f0c6c3", "#df91a3", "#d46780"),
  Fall = c("#3d5941", "#778868", "#b5b991", "#f6edbd", "#edbb8a", "#de8a5a", "#ca562c"),
  Geyser = c("#008080", "#70a494", "#b4c8a8", "#f6edbd", "#edbb8a", "#de8a5a", "#ca562c"),
  Temps = c("#009392", "#39b185", "#9ccb86", "#e9e29c", "#eeb479", "#e88471", "#cf597e"),
  TealRose = c("#009392", "#72aaa1", "#b1c7b3", "#f1eac8", "#e5b9ad", "#d98994", "#d0587e"),
  Tropic = c("#009B9E", "#42B7B9", "#A7D3D4", "#F1F1F1", "#E4C1D9", "#D691C1", "#C75DAB"),
  Earth = c("#A16928", "#bd925a", "#d6bd8d", "#edeac2", "#b5c8b8", "#79a7ac", "#2887a1"),
)

usethis::use_data(discrete_palettes, overwrite = TRUE)
usethis::use_data(sequential_palettes, overwrite = TRUE)
usethis::use_data(diverging_palettes, overwrite = TRUE)

# performance palettes ----
performance_palettes <- pal_palette(
  dark = c("#3AAF85", "#1B6CA8", "#CD201F")
)

usethis::use_data(performance_palettes, overwrite = TRUE)

# MetBrewer palettes ----
met_palettes <- MetBrewer::MetPalettes |>
  map(1) |>
  map(as_colour) |>
  new_palette()

met_palettes_a11y <- met_palettes[
  names(met_palettes) %in% MetBrewer::colorblind_palettes
]

usethis::use_data(met_palettes, overwrite = TRUE)
usethis::use_data(met_palettes_a11y, overwrite = TRUE)

# Penguin palettes ----
penguin_palettes <- pal_palette(
  dark = c("#F37A00", "#6A3D9A", "#33A02C"),
  medium = c("#F89D38", "#9A78B8", "#73C05B"),
  light = c("#FDBF6F", "#CAB2D6", "#B2DF8A"),
  adelie = c("#F37A00", "#F89D38", "#FDBF6F"),
  chinstrap = c("#6A3D9A", "#9A78B8", "#CAB2D6"),
  gentoo = c("#33A02C", "#73C05B", "#B2DF8A")
)

usethis::use_data(penguin_palettes, overwrite = TRUE)

# nord palettes ----
nord_palettes <- nord::nord_palettes |>
  map(as_colour) |>
  new_palette()

usethis::use_data(nord_palettes, overwrite = TRUE)

# PNWColors palettes ----
pnw_palettes <- PNWColors::pnw_palettes |>
  map(function(x) as_colour(x[1,]))  |>
  new_palette()

usethis::use_data(pnw_palettes, overwrite = TRUE)

# viridisLite palettes ----
n_colours <- 27

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
