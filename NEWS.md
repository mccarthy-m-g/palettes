# palettes 0.2.1

This is a small patch release that applies some internal fixes for the `scale_()` functions, due to a breaking change in ggplot2 v3.5.0 that deprecated the `scale_name` argument in `ggplot2::continuous_scale()`, `ggplot2::discrete_scale()` and `ggplot2::binned_scale()`. The "gt" vignette has also been updated to reflect changes to the `gt::data_color()` function in gt v0.9.0.

# palettes 0.2.0

- Added a variety of global options to adjust the printing behaviour of colour vectors. See `help("palettes-options")` and `vignette("palettes")` for details and examples (#35).

- Added a "Made with palettes" article to the pkgdown site showcasing colour palette packages made with palettes (#37).

- Improved error message for invalid colours to support singular and plural grammar (@olivroy, #32).

- Minor improvements to documentation throughout the package---mainly cross-linking (#38).

# palettes 0.1.1

This is a small patch release that fixes a typo in the "Creating a Colour Package" vignette, replacing the non-existent `pal_brewer()` function with the intended `pal_ramp()` function.

# palettes 0.1.0

First public release.
