# ------------------------------------------------------------------------------
# as_color()

test_that("can convert color -> color", {
  expect_identical(as_color(new_color("black")), new_color("black"))
})

# ------------------------------------------------------------------------------
# as.character()

test_that("as.character() works", {
  x <- color("black")
  expect_identical(as.character(x), "black")
})

test_that("as.character() works with NA", {
  expect_identical(as.character(color(NA)), NA_character_)
})

# ------------------------------------------------------------------------------
# format()

test_that("format - can format() a color", {
  expect_snapshot(format(color("black")))
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
  expect_identical(vec_ptype(color("black")), color(character()))
})

# ------------------------------------------------------------------------------
# vec_arith()

# ------------------------------------------------------------------------------
# vec_math()
