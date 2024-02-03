## Package Listings

If you have a colour palette package that you would like included in the listing of [packages made with palettes](https://mccarthy-m-g.github.io/palettes/articles/made-with-palettes.html), please send me a pull request that includes an addition to the `made-with-palettes.R` file in this directory.

### Requirements

Colour palette packages submitted for listing should meet the following requirements:

1. Hosted from a GitHub repository.
2. Made using the palettes package.

### Instructions

In your pull request, add the package info to the the `made_with_palettes <- tibble::tribble(...)` on line 8. The columns in the tribble are as follows:

- `package`: R package name.
- `gh_owner`: The account owner of the repository.
- `gh_repo`: The name of the repository.

Please add new entries in alphabetical order, according to the package name.
