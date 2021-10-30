x <- color(c("red", "#A2A0B8FF", NA, "gray62"))
x

# Coerce ----
as_color("red")

# Format ----
str(x)
data.frame(x)
tibble::as_tibble(x)

# Arithmetic ----
x + x
x + rev(x)
color("red") + color("blue")

# Math ----
cumsum(x)
sum(x)

# Math functions not implemented will throw an error, as they should.
try(mean(x))

# Pretty ----
pretty_color(x)

cat(pretty_color(x))
cat(pretty_color(x + rev(x)))

# -----------------------------------------------------------------------------

# Mock-up print method. The challenge is in adding a line number to the output;
# it also does not handle wrapping well when there are lots of colours.
x_format <- pretty_color(format(x))
cat(
  glue("<{vctrs::vec_ptype_full(x)}[{length(x)}]>"),
  "\n", "[1] ",
  paste(x_format, collapse = " "),
  sep = ""
)
cat(
  glue("<{vctrs::vec_ptype_full(x)}[{length(x)}]>"),
  "\n", "[1] ",
  paste(rep(x_format, 5), collapse = " "),
  sep = ""
)
cat(
  glue("<{vctrs::vec_ptype_full(x)}[{length(x)}]>"),
  "\n", "[1] ",
  stringr::str_wrap(paste(rep(x_format, 5), collapse = " ")),
  sep = ""
)

cat(
  glue("<{vctrs::vec_ptype_full(x)}[{length(x)}]>"),
  strwrap(paste(rep(x_format, 5), collapse = " "), width = 250, prefix = c("[1] ")),
  sep = ""
)

# This gives line numbers rather than the index of the item at the start of each line
wrap_x <- stringr::str_wrap(paste(rep(x_format, 5), collapse = " "))
split_x <- unlist(stringr::str_split(wrap_x, "\n"))
glue_x <- glue("[{1:length(split_x)}] {split_x}")

cat(
  glue("<{vctrs::vec_ptype_full(x)}[{length(x)}]>"),
  glue("[{1:length(split_x)}] {split_x}", .sep = "AHHHHHHH"),
  sep = "\n"
)

