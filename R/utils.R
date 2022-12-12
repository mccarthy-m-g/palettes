str_to_hex <- function(x) {
  # TODO: Decide whether to support alpha channel
  farver::encode_colour(farver::decode_colour(x))
}
