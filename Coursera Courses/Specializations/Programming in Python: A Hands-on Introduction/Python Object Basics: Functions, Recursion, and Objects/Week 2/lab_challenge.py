def recursive_power(base, exp):
  if exp == 0:
    return 1
  else:
    return base * recursive_power(base, exp-1)
