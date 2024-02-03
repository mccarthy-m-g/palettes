library(dplyr)
library(purrr)
library(gh)
library(desc)
library(readr)

# Please add new entries in alphabetical order, according to the package name.
made_with_palettes <- tibble::tribble(
  ~package, ~gh_owner, ~gh_repo,
  "hutchplot", "fhdsl", "hutchplot",
  "palettes", "mccarthy-m-g", "palettes",
  "warwickplots", "Warwick-Stats-Resources", "warwickplots"
)

cran_pkgs <- tools::CRAN_package_db()$Package

made_with_palettes <- made_with_palettes |>
  rowwise() |>
  mutate(
    # Check whether package is also on CRAN
    on_cran = package %in% cran_pkgs,
    # Get and read DESCRIPTION from package GitHub repositories
    pkg_description = list(gh::gh(
      "/repos/:owner/:repo/contents/:path",
      owner = gh_owner,
      repo = gh_repo,
      path = "DESCRIPTION",
      .accept = "application/vnd.github.raw+json"
    )),
    pkg_description = purrr::pluck(pkg_description, 1),
    pkg_description = list(desc(text = pkg_description)),
    # Get and format fields from DESCRIPTION
    title = pkg_description$get("Title"),
    authors = format(
      pkg_description$get_author("aut"),
      include = c("given", "family")
    ),
    # Get URLs
    # url = pkg_description$get_field("URL", default = NA),
    gh_url = paste0("https://github.com/", gh_owner, "/", gh_repo, ""),
    cran_url = ifelse(
      on_cran, paste0("https://CRAN.R-project.org/package=", package), NA
    )
  ) |>
  select(-c(gh_owner:pkg_description)) |>
  arrange(package)

saveRDS(made_with_palettes, "data-raw/sysdata/made-with-palettes.rds")
