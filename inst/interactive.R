x <- color(c("red", "#A2A0B8FF", NA, "gray62"))
x
y <- color(c("red", "green", "blue"))
xy <- palette(v1 = x, v2 = y)
xy
tibble::tibble(color(c("red", "#ffffff", NA)))

# Class ----
class(x)
class(xy)

# Extract ----
x[1]
xy[1]
xy[[1]]
xy$v1

# Equality ----
x == x
x == x[1]
x[1] == y[1]

xy == xy
xy == xy[1]
xy == color("red")

# Coerce ----
as_color("red")

# Format ----
str(x)
data.frame(x)
tibble::as_tibble(x)

str(xy)
data.frame(xy)
tibble::as_tibble(xy)

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

# Plot ----
plot(x)

plot(xy)
