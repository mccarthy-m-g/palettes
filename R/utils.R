str_to_hex <- function(x) {
  # TODO: Decide whether to support alpha channel
  farver::encode_colour(farver::decode_colour(x))
}

is_valid_colour <- function(x) {
  is_named_colour <- x %in% colour_names # From sysdata.rda
  is_hex_colour <- grepl(x, pattern = "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{8})$")
  is_na_colour <- is.na(x)
  is_valid <- is_named_colour | is_hex_colour | is_na_colour
  is_valid
}
