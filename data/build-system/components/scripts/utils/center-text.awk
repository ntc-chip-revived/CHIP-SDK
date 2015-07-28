#!/usr/bin/awk -f
{
  z = 92 - length - 4
  y = int(z / 2)
  x = z - y
  printf "%*s= %s =%*s\n", x, "", $0, y, ""
}