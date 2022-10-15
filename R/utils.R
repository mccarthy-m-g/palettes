rgb2col <- function(x, alpha = FALSE) {
  if (alpha) {
    rgb(x[1, ], x[2, ], x[3, ], alpha = x[4, ], maxColorValue = 255)
  } else {
    rgb(x[1, ], x[2, ], x[3, ], maxColorValue = 255)
  }
}
