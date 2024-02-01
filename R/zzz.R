## nocov start

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.palettes <- list(
    palettes.print_symbol = "bullet",
    palettes.print_hex = TRUE,
    palettes.print_sep = "",
    palettes.print_width = 1,
    palettes.print_index = FALSE
  )
  toset <- !(names(op.palettes) %in% names(op))
  if (any(toset)) options(op.palettes[toset])

  invisible()
}

## nocov end
