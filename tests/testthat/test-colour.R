# ------------------------------------------------------------------------------
# as_colour()

test_that("can convert colour -> colour", {
  expect_identical(as_colour(new_colour("black")), new_colour("black"))
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
# format()

test_that("format - can format() a colour", {
  expect_snapshot(format(pal_colour("black")))
})

# ------------------------------------------------------------------------------
# print() / obj_print_data() / obj_print_footer()

# test_that("normal print method works", {
#   x <- year_month_day(2019, 1:5)
#   expect_snapshot(x)
# })

# ------------------------------------------------------------------------------
# vec_ptype()

test_that("ptype is correct", {
  expect_identical(vec_ptype(pal_colour("black")), pal_colour(character()))
})

# ------------------------------------------------------------------------------
# vec_arith()

# ------------------------------------------------------------------------------
# vec_math()
