## Release summary

This is a small patch release that fixes a typo in the "Creating a Colour Package" vignette, replacing the non-existent `pal_brewer()` function with the intended `pal_ramp()` function.

The code in question is not evaluated when building the vignette, but running it interactively leads to the error `ERROR: could not find function "pal_brewer"`, hence the need for a patch.

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

None.
