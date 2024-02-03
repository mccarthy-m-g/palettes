## nocov start

package_env <- environment()

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.palettes <- list(
    palettes.print_symbol = "circle_small",
    palettes.print_hex = TRUE,
    palettes.print_alpha = FALSE,
    palettes.print_sep = "",
    palettes.print_width = 1,
    palettes.print_index = FALSE
  )
  toset <- !(names(op.palettes) %in% names(op))
  if (any(toset)) options(op.palettes[toset])

  makeActiveBinding(
    "pal_symbol",
    function() {
      if (cli::is_utf8_output()) {
        symbol_utf8
      } else {
        symbol_ascii
      }
    },
    package_env
  )

  invisible()
}

## nocov end
