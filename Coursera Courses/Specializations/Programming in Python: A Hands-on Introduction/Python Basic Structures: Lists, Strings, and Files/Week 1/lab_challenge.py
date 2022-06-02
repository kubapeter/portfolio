########################################################
# DO NOT EDIT THE CODE IN THE SECTION BELOW
########################################################
import sys

numbers = sys.argv[1:]
for i in range(len(numbers)):
  numbers[i] = int(numbers[i])

########################################################
# Enter your code below
########################################################

answ = []
for num in numbers:
  if num % 2 == 0:
    answ.append('even')
  else:
    answ.append('odd')
    
print(answ)
