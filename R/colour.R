# for compatibility with the S4 system
methods::setOldClass(c("palettes_colour", "vctrs_vctr"))

#' Colour vectors
#'
#' This creates a character vector that represents colours so when it is
#' printed, colours will be formatted as hexadecimal strings.
#'
#' @param x
#'  * For `pal_colour()`: A character vector of any of the three kinds of R colour
#'   specifications.
#'  * For `as_colour()`: An object to be coerced.
#'  * For `is_colour()`: An object to test.
#' @details
#' Colours can be specified using either:
#' - Hexadecimal strings of the form `"#RRGGBB"` or `"#RRGGBBAA"`
#' - Colour names from [grDevices::colors()]
#' - Positive integers `i` that index into [grDevices::palette()]`[i]`
#' @return An S3 vector of class `palettes_colour`.
#' @seealso [pal_palette()]
#' @export
#' @examples
#' pal_colour(c("darkred", "#0F7BA2"))
#'
#' is_colour("darkred")
#' is_colour(pal_colour("darkred"))
#'
#' as_colour("#0F7BA2")
pal_colour <- function(x = character()) {
  x <- vec_cast(x, character())
  validate_colour(new_colour(x))
}

new_colour <- function(x = character()) {
  vec_assert(x, character())
  new_vctr(x, class = "palettes_colour")
}

validate_colour <- function(x) {
  values <- vec_data(x)
  valid_colours <- is_valid_colour(values)

  if (!all(valid_colours) && vec_size(values) != 0) {
    invalid_colours <- values[!valid_colours]
    cli::cli_abort(c(
      "All `x` values must be hexadecimal strings or colour names.",
      "x" = "The following value{?s} {?is/are} not {?a/} valid colour{?s}: {.str {invalid_colours}}."
    ))
  }

  x
}

#' @export
#' @rdname pal_colour
is_colour <- function(x) {
  inherits(x, "palettes_colour")
}

#' @export
#' @rdname pal_colour
as_colour <- function(x) {
  UseMethod("as_colour")
}

#' @export
#' @rdname pal_colour
as_colour.default <- function(x) {
  vec_cast(x, new_colour())
}

#' @export
#' @rdname pal_colour
as_colour.palettes_palette <- function(x) {
  value <- unname(unlist(x))
  new_colour(value)
}

# Coerce ----------------------------------------------------------------------

#' @export
vec_ptype2.palettes_colour.palettes_colour <- function(x, y, ...) new_colour()
#' @export
vec_ptype2.palettes_colour.character <- function(x, y, ...) character()
#' @export
vec_ptype2.character.palettes_colour <- function(x, y, ...) character()

# Cast ------------------------------------------------------------------------

#' @export
vec_cast.palettes_colour.palettes_colour <- function(x, to, ...) x
#' @export
vec_cast.palettes_colour.character <- function(x, to, ...) pal_colour(x)
#' @export
vec_cast.character.palettes_colour <- function(x, to, ...) vec_data(x)

# British to American spellings ----------------------------------------------

#' @export
#' @rdname pal_colour
#' @usage NULL
pal_color <- pal_colour

#' @export
#' @rdname pal_colour
#' @usage NULL
is_color <- is_colour

#' @export
#' @rdname pal_colour
#' @usage NULL
as_color <- as_colour
