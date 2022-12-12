pal_mix <- function(x) {
  x_mat <- farver::decode_colour(x, to = "xyz")
  sum_mix <- t(as.matrix(colSums(x_mat)))
  hex <- farver::encode_colour(sum_mix, from = "xyz")
  # This probably isn't realistic, but ensures that red + yellow gives orange,
  # because sum mix gives yellow
  if (hex %in% str_to_hex(x)) {
    mean_mix <- t(as.matrix(colMeans(x_mat)))
    hex <- farver::encode_colour(mean_mix, from = "xyz")
  }
  as_colour(hex)
}
