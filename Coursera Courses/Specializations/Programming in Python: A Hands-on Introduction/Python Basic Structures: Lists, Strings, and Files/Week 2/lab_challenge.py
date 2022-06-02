##########################################################
# Erase the variable my_string before submitting your work
##########################################################

my_string = ""

##########################################################
# Enter your code below
##########################################################

answer = ""
vowels = ['a', 'e', 'i', 'o', 'u']
for char in my_string:
  if char in vowels:
    answer += '*'
  else:
    answer += char

print(answer)
