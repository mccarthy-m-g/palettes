colour_names <- readRDS("data-raw/sysdata/colour_names.rds")
made_with_palettes<- readRDS("data-raw/sysdata/made-with-palettes.rds")

usethis::use_data(
  colour_names,
  made_with_palettes,
  overwrite = TRUE,
  internal = TRUE
)
