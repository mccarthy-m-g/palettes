#' Colour vector and colour palette mapping
#'
#' Conveniently maps data values (numeric or factor/character) to colours
#' according to a given colour vector or colour palette.
#'
#' @details `pal_numeric` is a simple linear mapping from continuous numeric
#'   data to an interpolated palette.
#'
#' @param palette An object of class `palettes_palette` or `palettes_colour`.
#' @param domain The possible values that can be mapped.
#'
#'   For `pal_numeric` and `pal_bin`, this can be a simple numeric
#'   range (e.g. `c(0, 100)`); `pal_quantile` needs representative
#'   numeric data; and `pal_factor` needs categorical data.
#'
#'   If `NULL`, then whenever the resulting colour function is called, the
#'   `x` value will represent the domain. This implies that if the function
#'   is invoked multiple times, the encoding between values and colours may not
#'   be consistent; if consistency is needed, you must provide a non-`NULL`
#'   domain.
#' @param na.color The colour to return for `NA` values. Note that
#'   `na.color = NA` is valid.
#' @param alpha Whether alpha channels should be respected or ignored. If `TRUE`
#'   then colors without explicit alpha information will be treated as fully
#'   opaque.
#' @param reverse Whether the colours in `palette` should be
#'   used in reverse order. For example, if the default order of a palette goes
#'   from blue to green, then `reverse = TRUE` will result in the colors going
#'   from green to blue.
#' @return A function that takes a single parameter `x`; when called with a
#'   vector of numbers (except for `pal_factor`, which expects
#'   factors/characters), #RRGGBB colour strings are returned (unless
#'   `alpha = TRUE` in which case #RRGGBBAA may also be possible).
#' @seealso [scales::col_numeric()]
#' @export
pal_numeric <- function(
  palette,
  domain,
  na.color = "#808080",
  alpha = FALSE,
  reverse = FALSE
) { # nocov start

  palette <- get_palette_colours(palette)
  palette <- as.character(palette)

  scales::col_numeric(
    palette = palette,
    domain = domain,
    na.color = na.color,
    alpha = alpha,
    reverse = reverse
  )

} # nocov end

#' @details `pal_bin` also maps continuous numeric data, but performs
#'   binning based on value (see the [base::cut()] function). `pal_bin`
#'   defaults for the `cut` function are `include.lowest = TRUE` and
#'   `right = FALSE`.
#' @param bins Either a numeric vector of two or more unique cut points or a
#'   single number (greater than or equal to 2) giving the number of intervals
#'   into which the domain values are to be cut.
#' @param pretty Whether to use the function [pretty()] to generate
#'   the bins when the argument `bins` is a single number. When
#'   `pretty = TRUE`, the actual number of bins may not be the number of
#'   bins you specified. When `pretty = FALSE`, [seq()] is used
#'   to generate the bins and the breaks may not be "pretty".
#' @param right parameter supplied to [base::cut()]. See Details
#' @seealso [scales::col_bin()]
#' @rdname pal_numeric
#' @export
pal_bin <- function(
  palette,
  domain,
  bins = 7,
  pretty = TRUE,
  na.color = "#808080",
  alpha = FALSE,
  reverse = FALSE,
  right = FALSE
) { # nocov start

  palette <- get_palette_colours(palette)
  palette <- as.character(palette)

  scales::col_bin(
    palette = palette,
    domain = domain,
    bins = bins,
    pretty = pretty,
    na.color = na.color,
    alpha = alpha,
    reverse = reverse,
    right = right
  )

} # nocov end

#' @details `pal_quantile` similarly bins numeric data, but via the
#'   [stats::quantile()] function.
#' @param n Number of equal-size quantiles desired. For more precise control,
#'   use the `probs` argument instead.
#' @param probs See [stats::quantile()]. If provided, the `n`
#'   argument is ignored.
#' @seealso [scales::col_quantile()]
#' @rdname pal_numeric
#' @export
pal_quantile <- function(
  palette,
  domain,
  n = 4,
  probs = seq(0, 1, length.out = n + 1),
  na.color = "#808080",
  alpha = FALSE,
  reverse = FALSE,
  right = FALSE
) { # nocov start

  palette <- get_palette_colours(palette)
  palette <- as.character(palette)

  scales::col_quantile(
    palette = palette,
    domain = domain,
    na.color = na.color,
    alpha = alpha,
    reverse = reverse,
    right = right
  )

} # nocov end

#' @details `pal_factor` maps factors to colours. If the palette is
#'   discrete and has a different number of colours than the number of factors,
#'   interpolation is used.
#' @param levels An alternate way of specifying levels; if specified, domain is
#'   ignored
#' @param ordered If `TRUE` and `domain` needs to be coerced to a
#'   factor, treat it as already in the correct order
#' @seealso [scales::col_factor()]
#' @rdname pal_numeric
#' @export
pal_factor <- function(
  palette,
  domain,
  levels = NULL,
  ordered = FALSE,
  na.color = "#808080",
  alpha = FALSE,
  reverse = FALSE
) { # nocov start

  palette <- get_palette_colours(palette)
  palette <- as.character(palette)

  scales::col_factor(
    palette = palette,
    domain = domain,
    levels = levels,
    ordered = ordered,
    na.color = na.color,
    alpha = alpha,
    reverse = reverse
  )

} # nocov end

#' @examples
#' pal <- pal_bin(met_palettes$Tam, domain = 0:100)
#' plot(as_colour(pal(sort(runif(16, 0, 100)))))
#'
#' # Exponential distribution, mapped continuously
#' pal <- pal_numeric(met_palettes$Tam, domain = NULL)
#' plot(as_colour(pal(sort(rexp(16)))))
#'
#' # Exponential distribution, mapped by interval
#' pal <- pal_bin(met_palettes$Tam, domain = NULL, bins = 4)
#' plot(as_colour(pal(sort(rexp(16)))))
#'
#' # Exponential distribution, mapped by quantile
#' pal <- pal_quantile(met_palettes$Tam, domain = NULL)
#' plot(as_colour(pal(sort(rexp(16)))))
#'
#' # Categorical data; by default, the values being coloured span the gamut...
#' pal <- pal_factor(met_palettes$Java, domain = NULL)
#' plot(as_colour(pal(LETTERS[1:5])))
#'
#' # ...unless the data is a factor, without droplevels...
#' pal <- pal_factor(met_palettes$Java, domain = NULL)
#' plot(as_colour(pal(factor(LETTERS[1:5], levels = LETTERS))))
#'
#' # ...or the domain is stated explicitly.
#' pal <- pal_factor(met_palettes$Java, domain = NULL, levels = LETTERS)
#' plot(as_colour(pal(LETTERS[1:5])))
#' @rdname pal_numeric
#' @name pal_numeric
NULL
