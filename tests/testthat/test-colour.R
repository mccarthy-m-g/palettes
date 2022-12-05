# ------------------------------------------------------------------------------
# as_colour()

test_that("can convert colour -> colour", {
  expect_identical(as_colour(new_colour("black")), new_colour("black"))
})

test_that("can convert palette -> colour", {
  colour_palette <- pal_palette(black = "black")
  expect_identical(as_colour(colour_palette), new_colour("black"))
})

# ------------------------------------------------------------------------------
# as.character()

test_that("as.character() works", {
  x <- pal_colour("black")
  expect_identical(as.character(x), "black")
})

test_that("as.character() works with NA", {
  expect_identical(as.character(pal_colour(NA)), NA_character_)
})

# ------------------------------------------------------------------------------
# as_tibble()

test_that("as_tibble() works", {
  colour_vector <- pal_colour("black")
  colour_tibble <- tibble(colour = pal_colour("black"))
  expect_identical(as_tibble(colour_vector), colour_tibble)
})

# ------------------------------------------------------------------------------
# format()

test_that("format - can format() a colour", {
  expect_snapshot(format(pal_colour("black")))
})

# ------------------------------------------------------------------------------
# pal_colour()

test_that("zero-length input works", {
  expect_s3_class(pal_colour(), "palettes_colour")
  expect_length(pal_colour(), 0)
  expect_true(is_colour(pal_colour()))
})

# ------------------------------------------------------------------------------
# print() / obj_print_data() / obj_print_footer()

# test_that("normal print method works", {
#   x <- year_month_day(2019, 1:5)
#   expect_snapshot(x)
# })

# ------------------------------------------------------------------------------
# vec_c()

test_that("vec_c(x, y) is class palettes_colour", {
  expect_s3_class(vec_c(pal_colour(), pal_colour()), "palettes_colour")
})

test_that("vec_c(x, y) and vec_c(y, x) are type character", {
  expect_type(vec_c(pal_colour(), character()), "character")
  expect_type(vec_c(character(), pal_colour()), "character")
})

test_that("inputs that cannot be combined fail with an error", {
  expect_error(vec_c(1, pal_colour()), class = "vctrs_error_incompatible_type")
  expect_error(vec_c(TRUE, pal_colour()), class = "vctrs_error_incompatible_type")
})

# ------------------------------------------------------------------------------
# vec_ptype()

test_that("ptype is correct", {
  expect_identical(vec_ptype(pal_colour("black")), pal_colour(character()))
})

# ------------------------------------------------------------------------------
# vec_arith()

# ------------------------------------------------------------------------------
# vec_math()
