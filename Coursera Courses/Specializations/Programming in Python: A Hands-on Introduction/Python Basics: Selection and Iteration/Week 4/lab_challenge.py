for row in range(8):
  if row % 2 == 0:
    for column in range(8):
      if column % 2 == 0:
        print("X", end="")
      else:
        print("O", end="")
    print()
  else:
    for column in range(8):
      if column % 2 == 0:
        print("O", end="")
      else:
        print("X", end="")
    print()
