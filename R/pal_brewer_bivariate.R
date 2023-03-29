#
# # ----
#
# pal_ramp_bivariate_2 <- function(
#   x = "#ae3a4e", y = "#4885c1", l = "#cabed0", h = "#3f2949"
# ) {
#   as_colour(c(
#     "1-1" = l, # low x, low y
#     "2-1" = x, # high x, low y
#     "1-2" = y, # low x, high y
#     "2-2" = h # high x, high y
#   ))
# }
#
pal_ramp_bivariate_3 <- function(
  x = "#ae3a4e", y = "#4885c1", l = "#cabed0", h = "#3f2949"
) {

  xyl <- as_colour(str_to_hex(vec_data(c(x, y, l, h))))
  x <- xyl[1]
  y <- xyl[2]
  l <- xyl[3]
  h <- xyl[4]

  # Light interpolation
  xyl <- pal_ramp(c(x, l, y), 5, space = "cmy")[c(2, 4)]
  xl  <- xyl[1]
  yl  <- xyl[2]
  # Dark interpolation
  xyd <- pal_ramp(c(x, h, y), 5, space = "cmy")[c(2, 4)]
  xd  <- xyd[1]
  yd  <- xyd[2]
  z   <- h
  xzl <- pal_ramp(c(xl, yl), 3, space = "cmy")[2]
  yzd <- pal_ramp(c(xd, yd), 3, space = "cmy")[2]
  zl  <- pal_ramp(c(xzl, yzd), 3, space = "cmy")[2]

  c(
    "1-1" = l, # low x, low y
    "2-1" = xl,
    "3-1" = x, # high x, low y
    "1-2" = yl,
    "2-2" = zl, # medium x, medium y
    "3-2" = xd,
    "1-3" = y, # low x, high y
    "2-3" = yd,
    "3-3" = z # high x, high y
  )

}
#
# pal_ramp_bivariate_4 <- function(
#   x = "#9e3547", y = "#4279b0", l = "#d3d3d3", h = "#311e3b"
# ) {
#
#   xyl <- as_colour(str_to_hex(vec_data(c(x, y, l, h))))
#   x <- xyl[1]
#   y <- xyl[2]
#   l <- xyl[3]
#   h <- xyl[4]
#
#   # Light interpolation
#   xyl <- pal_ramp(c(x, l, y), 7, space = "cmy")[c(2, 3, 5, 6)]
#   xl  <- xyl[1:2]
#   yl  <- xyl[3:4]
#   # Dark interpolation
#   xyd <- pal_ramp(c(x, h, y), 7, space = "cmy")[c(2, 3, 5, 6)]
#   xd  <- xyd[1:2]
#   yd  <- xyd[3:4]
#   z   <- h
#
#   xld <- pal_ramp(c(yl[1], xd[1]), 4, space = "cmy")[2:3]
#   yld <- pal_ramp(c(xl[2], yd[2]), 4, space = "cmy")[2:3]
#
#   yzd <- pal_ramp(c(xd[2], yd[1]), 3, space = "cmy")[2] # the brighter dark clrs xld[2], yld[2]
#   xzd <- pal_ramp(c(xld[2], yld[2]), 3, space = "cmy")[2] # the brighter dark clrs
#   zl  <- pal_ramp(c(xzd, yzd), 3, space = "cmy")[2]
#
#   as_colour(c(
#     "1-1" = l, # low x, low y
#     "2-1" = xl[2],
#     "3-1" = xl[1],
#     "4-1" = x, # high x, low y
#     "1-2" = yl[1],
#     "2-2" = yld[1],
#     "3-2" = xld[2],
#     "4-2" = xd[1],
#     "1-3" = yl[2],
#     "2-3" = yld[2],
#     "3-3" = zl,
#     "4-3" = xd[2],
#     "1-4" = y, # low x, high y
#     "2-4" = yd[2],
#     "3-4" = yd[1],
#     "4-4" = z # high x, high y
#   ))
#
# }
#
# test_palette <- function() {
#   as_colour(c(
#     "1-1" = "#d3d3d3", # low x, low y
#     "2-1" = "#c2a0a6",
#     "3-1" = "#b16d79",
#     "4-1" = "#9e3547", # high x, low y
#     "1-2" = "#a3b5c7",
#     "2-2" = "#96899d",
#     "3-2" = "#895e72",
#     "4-2" = "#7a2d43",
#     "1-3" = "#7397bb",
#     "2-3" = "#697394",
#     "3-3" = "#604e6b",
#     "4-3" = "#56263f",
#     "1-4" = "#4279b0", # low x, high y
#     "2-4" = "#3c5c8b",
#     "3-4" = "#373f65",
#     "4-4" = "#311e3b" # high x, high y
#   )) |>
#     biscale::bi_pal(dim = 4)
# }
#
# make_grid <- function(dim = 2) {
#   colour_grid <- expand.grid(x = 1:dim, y = 1:dim)
#   colour_grid$name <- paste0(colour_grid$x, "-", colour_grid$y)
#   colour_grid
# }
#
# pal_ramp_bivariate <- function(
#   dim = 2, x = "#9e3547", y = "#4279b0", l = "#d3d3d3", h = "#311e3b"
# ) {
#
#   xyl <- as_colour(str_to_hex(vec_data(c(x, y, l, h))))
#   x <- xyl[1]
#   y <- xyl[2]
#   l <- xyl[3]
#   h <- xyl[4]
#
#   # Light interpolation
#   row_1 <- pal_ramp(c(l, x), dim, space = "cmy")
#   col_1 <- pal_ramp(c(l, y), dim, space = "cmy")
#
#   colour_grid <- make_grid(dim)
#
# }
#
# # https://observablehq.com/@benjaminadk/bivariate-choropleth-color-generator
# observable <- function(
#   dim = 2, x = "#9e3547", y = "#4279b0", l = "#d3d3d3", mode = "darken"
# ) {
#
#   xyl <- as_colour(str_to_hex(vec_data(c(x, y, l))))
#   x <- xyl[1]
#   y <- xyl[2]
#   l <- xyl[3]
#
#   scale_1 <- pal_ramp(c(l, y), dim, space = "rgb")
#   scale_2 <- pal_ramp(c(l, x), dim, space = "rgb")
#
#   colour_data <- data.frame(colour = character(), position = character())
#
#   for (i in 1:length(scale_1)) {
#     for (j in 1:length(scale_2)) {
#
#       new_colour_data <- data.frame(
#         #colour = pal_ramp(c(scale_1[i], scale_2[j]), 3)[2],
#         colour = pal_blend(scale_1[i], scale_2[j], mode),
#         position = paste0(j, "-", i)
#       )
#       colour_data <- rbind(colour_data, new_colour_data)
#     }
#   }
#
#   colour_vector <- colour_data$colour
#   names(colour_vector) <- colour_data$position
#   colour_vector
#
# }
#
# observable_2 <- function(
#   dim = 2, x = "#9e3547", y = "#4279b0", l = "#d3d3d3", mode = "multiply"
# ) {
#
#   xyl <- as_colour(str_to_hex(vec_data(c(x, y, l))))
#   x <- xyl[1]
#   y <- xyl[2]
#   l <- xyl[3]
#   d <- pal_blend(x, y, mode = "multiply")
#
#   scale_1 <- pal_ramp(c(l, y), dim, space = "rgb")
#   scale_2 <- pal_ramp(c(l, x), dim, space = "rgb")
#   scale_3 <- pal_ramp(c(l, d), dim, space = "rgb")
#
#   colour_data <- tibble(colour = character(), position = character())
#
#   for (i in 1:length(scale_1)) {
#     for (j in 1:length(scale_2)) {
#
#       new_colour_data <- tibble(
#         col  = pal_blend(scale_1[i], scale_2[j], mode = "normal"),
#         row  = pal_blend(scale_2[j], scale_1[i], mode = "normal"),
#         diag = pal_blend(scale_3[i], scale_1[j], mode = "normal"),
#         mix  = pal_blend(col, row, mode),
#         x = j,
#         y = i,
#         position = paste0(j, "-", i)
#       )
#       colour_data <- rbind(colour_data, new_colour_data)
#     }
#   }
#
#   colour_data
#
# }
#
# observable_2 <- function(
#   dim = 2, x = "#9e3547", y = "#4279b0", l = "#d3d3d3", mode = "multiply"
# ) {
#
#   xyl <- as_colour(str_to_hex(vec_data(c(x, y, l))))
#   x <- xyl[1]
#   y <- xyl[2]
#   l <- xyl[3]
#   d <- pal_blend(x, y, mode = "multiply")
#
#   scale_y_l <- pal_ramp(c(l, y), dim, space = "rgb")
#   scale_x_l <- pal_ramp(c(l, x), dim, space = "rgb")
#   scale_z_l <- pal_ramp(c(l, d), dim, space = "rgb")
#   scale_y_d <- pal_ramp(c(d, y), dim, space = "rgb")
#   scale_x_d <- pal_ramp(c(d, x), dim, space = "rgb")
#
#   colour_data <- tibble(colour = character(), position = character())
#
#   for (i in 1:length(scale_y_l)) {
#     for (j in 1:length(scale_x_l)) {
#
#       new_colour_data <- tibble(
#         mix_l = pal_blend(scale_y_l[i], scale_x_l[j], mode = "darken"),
#         mix_d = pal_blend(rev(scale_y_d)[i], rev(scale_x_d)[j], mode = "lighten"),
#         mix   = pal_blend(mix_l, mix_d, mode),
#         x = j,
#         y = i,
#         position = paste0(j, "-", i)
#       )
#       colour_data <- rbind(colour_data, new_colour_data)
#     }
#   }
#
#   colour_data
#
# }
#
# observable_4 <- function(
#   dim = 2, x = "#9e3547", y = "#4279b0", l = "#d3d3d3", mode = "multiply"
# ) {
#
#   xyl <- as_colour(str_to_hex(vec_data(c(x, y, l))))
#   x <- xyl[1]
#   y <- xyl[2]
#   l <- xyl[3]
#   d <- pal_blend(x, y, mode = "multiply")
#
#   scale_y_l <- pal_ramp(c(l, y), dim, space = "rgb")
#   scale_x_l <- pal_ramp(c(l, x), dim, space = "rgb")
#   scale_z_l <- pal_ramp(c(l, d), dim, space = "rgb")
#   scale_y_d <- pal_ramp(c(y, d), dim, space = "rgb")
#   scale_x_d <- pal_ramp(c(x, d), dim, space = "rgb")
#
#   colour_data <- tibble(colour = character(), position = character())
#
#   for (i in 1:length(scale_y_l)) {
#     for (j in 1:length(scale_x_l)) {
#
#       # Light x colours
#       if (i == 1 & j != 1) {
#         new_colour_data <- tibble(
#           colour = scale_x_l[j],
#           x = j,
#           y = i,
#           position = paste0(j, "-", i)
#         )
#         colour_data <- rbind(colour_data, new_colour_data)
#       }
#
#       # Light y colours
#       if (j == 1) {
#         new_colour_data <- tibble(
#           colour = scale_y_l[i],
#           x = j,
#           y = i,
#           position = paste0(j, "-", i)
#         )
#         colour_data <- rbind(colour_data, new_colour_data)
#       }
#
#       # Dark high y colours
#       if (i == length(scale_y_l) & j != 1 & j != length(scale_y_l)) {
#         new_colour_data <- tibble(
#           colour = scale_y_d[j],
#           x = j,
#           y = i,
#           position = paste0(j, "-", i)
#         )
#         colour_data <- rbind(colour_data, new_colour_data)
#       }
#
#       # Dark high x colours
#       if (j == length(scale_y_l) & i != 1 & i != length(scale_y_l)) {
#         new_colour_data <- tibble(
#           colour = scale_x_d[i],
#           x = j,
#           y = i,
#           position = paste0(j, "-", i)
#         )
#         colour_data <- rbind(colour_data, new_colour_data)
#       }
#
#       # Diagonal colours
#       if (i == j & i != 1 & j != 1) {
#         new_colour_data <- tibble(
#           colour = scale_z_l[i],
#           x = j,
#           y = i,
#           position = paste0(j, "-", i)
#         )
#         colour_data <- rbind(colour_data, new_colour_data)
#       }
#
#       # Off-diagonal colours
#       # TODO: Consider splitting this into light-dark or x-y
#       # if (i != j & i != 1 & j != 1 & i != length(scale_y_l) & j != length(scale_y_l)) {
#       #   new_colour_data <- tibble(
#       #     colour = pal_blend(scale_x_l[i], scale_y_l[j], "multiply"),
#       #     x = j,
#       #     y = i,
#       #     position = paste0(j, "-", i)
#       #   )
#       #   colour_data <- rbind(colour_data, new_colour_data)
#       # }
#
#       # Off-diagonal colours upper
#       # FIXME: This doesn't generalize past 5
#       if (i > 2 & i < length(scale_y_l) & j >= 2 & j < length(scale_y_l) - 1 & i != j) {
#         new_colour_data <- tibble(
#           colour = pal_ramp(c(scale_y_l[i], scale_z_l[j]), 3)[2],
#           x = j,
#           y = i,
#           position = paste0(j, "-", i)
#         )
#         colour_data <- rbind(colour_data, new_colour_data)
#       }
#
#       # Off-diagonal colours lower
#       # FIXME: This doesn't generalize past 5
#       if (j > 2 & j < length(scale_y_l) & i >= 2 & i < length(scale_y_l) - 1 & i != j) {
#         new_colour_data <- tibble(
#           colour = pal_ramp(c(scale_x_l[i], scale_z_l[j]), 3)[2],
#           x = j,
#           y = i,
#           position = paste0(j, "-", i)
#         )
#         colour_data <- rbind(colour_data, new_colour_data)
#       }
#
#     }
#   }
#
#   colour_data
#
#   colour_vector <- colour_data$colour
#   names(colour_vector) <- colour_data$position
#   colour_vector
#
# }
#
pal_ramp_bivariate_4 <- function(
  x = "#9e3547", y = "#4279b0", l = "#d3d3d3", h = "#311e3b"
) {

  xyl <- as_colour(str_to_hex(vec_data(c(x, y, l, h))))
  x <- xyl[1]
  y <- xyl[2]
  l <- xyl[3]
  h <- xyl[4]

  # Light interpolation
  xyl <- pal_ramp(c(x, l, y), 7, space = "cmy")[c(2, 3, 5, 6)]
  xl  <- xyl[1:2]
  yl  <- xyl[3:4]
  # Dark interpolation
  xyd <- pal_ramp(c(x, h, y), 7, space = "cmy")[c(2, 3, 5, 6)]
  xd  <- xyd[1:2]
  yd  <- xyd[3:4]
  z   <- h

  xld <- pal_ramp(c(yl[1], xd[1]), 4, space = "cmy")[2:3]
  yld <- pal_ramp(c(xl[2], yd[2]), 4, space = "cmy")[2:3]

  yzd <- pal_ramp(c(xd[2], yd[1]), 3, space = "cmy")[2] # the brighter dark clrs xld[2], yld[2]
  xzd <- pal_ramp(c(xld[2], yld[2]), 3, space = "cmy")[2] # the brighter dark clrs
  zl  <- pal_ramp(c(xzd, yzd), 3, space = "cmy")[2]

  as_colour(c(
    "1-1" = l, # low x, low y
    "2-1" = xl[2],
    "3-1" = xl[1],
    "4-1" = x, # high x, low y
    "1-2" = yl[1],
    "2-2" = yld[1],
    "3-2" = xld[2],
    "4-2" = xd[1],
    "1-3" = yl[2],
    "2-3" = yld[2],
    "3-3" = zl,
    "4-3" = xd[2],
    "1-4" = y, # low x, high y
    "2-4" = yd[2],
    "3-4" = yd[1],
    "4-4" = z # high x, high y
  ))

}
#
observable_5 <- function(
  dim = 4, x = "#9e3547", y = "#4279b0", l = "#d3d3d3", mode = "multiply"
) {

  xyl <- as_colour(str_to_hex(vec_data(c(x, y, l))))
  x <- xyl[1]
  y <- xyl[2]
  l <- xyl[3]
  d <- as_colour("#311e3b") # pal_blend(x, y, mode = "multiply")

  scale_y_l <- pal_ramp(c(l, y), dim, space = "rgb")
  scale_x_l <- pal_ramp(c(l, x), dim, space = "rgb")
  scale_z_l <- pal_ramp(c(l, d), dim, space = "rgb") # Improve
  scale_y_d <- pal_ramp(c(y, d), dim, space = "rgb")
  scale_x_d <- pal_ramp(c(x, d), dim, space = "rgb")

  # scale_diag_l <- purrr::map2_chr(scale_y_l, scale_x_l, ~{
  #   pal_ramp(c(.x, .y), 3, space = "rgb")[2]
  # })
  # scale_diag_d <- purrr::map2_chr(scale_y_d, scale_x_d, ~{
  #   pal_ramp(c(.x, .y), 3, space = "rgb")[2]
  # })
  # scale_z_l <- as_colour(c(scale_diag_l[1:2], scale_diag_d[3:4]))

  scale_diag_x <- purrr::map2_chr(scale_x_l, scale_x_d, ~{
    pal_ramp(c(.x, .y), 3, space = "rgb")[2]
  })
  scale_diag_y <- purrr::map2_chr(scale_y_l, scale_y_d, ~{
    pal_ramp(c(.x, .y), 3, space = "rgb")[2]
  })
  scale_diag_mix <- purrr::map2_chr(scale_diag_x, scale_diag_y, ~{
    pal_ramp(as_colour(c(.x, .y)), 3, space = "rgb")[2]
  }) |> as_colour()
  scale_z_low <- pal_ramp(c(l, scale_diag_mix[4]), dim, space = "rgb")[3:4]
  scale_z_high <- pal_ramp(c(l, scale_diag_mix[4]), dim, space = "rgb")[3:4]
  scale_z_l <- c(l, scale_z_low, d)


  # scale_z_l <- pal_ramp(as_colour(c(scale_diag_d, scale_diag_l)), dim, space = "rgb")
  #scale_z_l <- pal_ramp(c(scale_x_l, scale_diag_mix), dim, space = "rgb")

  colour_data <- tibble(colour = character(), position = character())

  for (i in 1:length(scale_y_l)) {
    for (j in 1:length(scale_x_l)) {

      # Light x colours
      if (i == 1 & j != 1) {
        new_colour_data <- tibble(
          colour = scale_x_l[j],
          x = j,
          y = i,
          position = paste0(j, "-", i)
        )
        colour_data <- rbind(colour_data, new_colour_data)
      }

      # Light y colours
      if (j == 1) {
        new_colour_data <- tibble(
          colour = scale_y_l[i],
          x = j,
          y = i,
          position = paste0(j, "-", i)
        )
        colour_data <- rbind(colour_data, new_colour_data)
      }

      # Dark high y colours
      if (i == length(scale_y_l) & j != 1 & j != length(scale_y_l)) {
        new_colour_data <- tibble(
          colour = scale_y_d[j],
          x = j,
          y = i,
          position = paste0(j, "-", i)
        )
        colour_data <- rbind(colour_data, new_colour_data)
      }

      # Dark high x colours
      if (j == length(scale_y_l) & i != 1 & i != length(scale_y_l)) {
        new_colour_data <- tibble(
          colour = scale_x_d[i],
          x = j,
          y = i,
          position = paste0(j, "-", i)
        )
        colour_data <- rbind(colour_data, new_colour_data)
      }

      # Diagonal colours
      # FIXME: These aren't saturated enough
      if (i == j & i != 1 & j != 1) {
        new_colour_data <- tibble(
          colour = scale_z_l[i],
          x = j,
          y = i,
          position = paste0(j, "-", i)
        )
        colour_data <- rbind(colour_data, new_colour_data)
      }

      # Off-diagonal colours upper
      # FIXME: This doesn't generalize past 5
      if (i > 2 & i < length(scale_y_l) & j >= 2 & j < length(scale_y_l) - 1 & i != j) {
        new_colour_data <- tibble(
          colour = pal_ramp(c(scale_y_l[i], scale_z_l[j]), 3)[2],
          x = j,
          y = i,
          position = paste0(j, "-", i)
        )
        colour_data <- rbind(colour_data, new_colour_data)
      }

      # Off-diagonal colours lower
      # FIXME: This doesn't generalize past 5
      if (j > 2 & j < length(scale_y_l) & i >= 2 & i < length(scale_y_l) - 1 & i != j) {
        new_colour_data <- tibble(
          colour = pal_ramp(c(scale_x_l[i], scale_z_l[j]), 3)[2],
          x = j,
          y = i,
          position = paste0(j, "-", i)
        )
        colour_data <- rbind(colour_data, new_colour_data)
      }

    }
  }

  colour_data

  colour_vector <- colour_data$colour
  names(colour_vector) <- colour_data$position
  colour_vector

}

# #7a6b84

pal_ramp_bivariate <- function(
  dim = 4, x = "#9e3547", y = "#4279b0", l = "#d3d3d3"
) {
  xyl <- as_colour(str_to_hex(vec_data(c(x, y, l))))
  x <- xyl[1]
  y <- xyl[2]
  l <- xyl[3]
  d <- as_colour("#311e3b") # pal_blend(x, y, mode = "multiply")

  scale_y_l <- pal_ramp(c(l, y), dim, space = "rgb")
  scale_x_l <- pal_ramp(c(l, x), dim, space = "rgb")
  scale_z_l <- pal_ramp(c(l, d), dim, space = "rgb") # Improve
  scale_y_d <- pal_ramp(c(y, d), dim, space = "rgb")
  scale_x_d <- pal_ramp(c(x, d), dim, space = "rgb")
}
