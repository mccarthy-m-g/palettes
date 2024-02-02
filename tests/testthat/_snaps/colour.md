# format - can format() a colour

    Code
      format(pal_colour("black"))
    Output
      [1] "#000000"

# pillar shaft works [plain]

    Code
      pillar_shaft(x$colour)
    Output
      <pillar_ornament>
      * #FF0000

# pillar shaft works [ansi]

    Code
      pillar_shaft(x$colour)
    Output
      <pillar_ornament>
      [31m*[39m #FF0000

# pillar shaft works [unicode]

    Code
      pillar_shaft(x$colour)
    Output
      <pillar_ornament>
      • #FF0000

# pillar shaft works [fancy]

    Code
      pillar_shaft(x$colour)
    Output
      <pillar_ornament>
      [31m•[39m #FF0000

# normal print method works [plain]

    Code
      x
    Output
      <palettes_colour[1]>
      * #FF0000

# normal print method works [ansi]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m*[39m #FF0000

# normal print method works [unicode]

    Code
      x
    Output
      <palettes_colour[1]>
      • #FF0000

# normal print method works [fancy]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m•[39m #FF0000

# zero-length normal print method works

    Code
      x
    Output
      <palettes_colour[0]>

# print_hex option works [plain]

    Code
      x
    Output
      <palettes_colour[1]>
      *

# print_hex option works [ansi]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m*[39m

# print_hex option works [unicode]

    Code
      x
    Output
      <palettes_colour[1]>
      •

# print_hex option works [fancy]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m•[39m

