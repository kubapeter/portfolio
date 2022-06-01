for row in range(8):
  for column in range(8):
    if ((column + row) % 2 ) == 0:
      print("X", end="")
    else:
      print("O", end="")
  print()
