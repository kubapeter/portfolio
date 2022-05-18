# 1.

# Fix the four string definitions below

#string1 = It's just a flesh wound
#string2 = 'It's just a flesh wound'	
#string3 = ""It's just a flesh wound""	
#string4 = """It's just a flesh wound"

string1 = "It's just a flesh wound"
string2 = "It's just a flesh wound"	
string3 = "It's just a flesh wound"	
string4 = """It's just a flesh wound"""

print(string1)
print(string2)
print(string3)
print(string4)

# 2.

# Create a string formed by selecting the first and last letters of example_string
example_string = "It's just a flesh wound"
print(example_string)

# Note that negative indices select characters from the end of the string
solution_string = example_string[0] + example_string[-1]
print(solution_string)

# Output should be 
#It's just a flesh wound
#Id

# 3. 

# Create a string formed by selecting all but the first and last letters of example_string
example_string = "It's just a flesh wound"
print(example_string)

# Note that negative indices select characters from the end of the string
solution_string = example_string[1 : -1]
print(solution_string)

# Output should be 
#It's just a flesh wound
#t's just a flesh woun

# 4.

# Create a string formed by selecting the first three characters of example_string
# plus the last three characters of example_string
example_string = "It's just a flesh wound"
print(example_string)

# Note that the default values for a slice are the start and end of the string
solution_string = example_string[: 3] + example_string[-3 :]
print(solution_string)

# Output should be 
#It's just a flesh wound
#It'und

# 5. 

# Write a function echo(call, repeats) that takes a string call and an integer repeats
# and prints repeats copies of the string call to console, each on a separate line. 
# Do not not use a loop for this problem. Instead, use string muplication 
# and the new line character '\n'.
def echo(call, repeats):
    """
    Echo the string call to the console repeats number of time
    Each echo should be on a separate line
    """
    answer = call + ('\n' + call) * (repeats - 1)
    print(answer)


# Tests
echo("Hello", 5)
echo("Goodbye", 3)

# 6. 

# Write a function is_substring(example_string, test_string) 
# that takes the strings example_string and test_string and returns True 
# if there exists a slice of example_string that exactly equals test_string 
# and returns False otherwise. Note that the body of this function requires 
# only one line of code and should not use any kind of slicing or iteration.
def is_substring(example_string, test_string):
    """
    Function that returns True if test_string
    is a substring of example_string and False otherwise
    """
    return test_string in example_string
    

# Tests

example_string = "It's just a flesh wound."

print(is_substring(example_string, "just"))
print(is_substring(example_string, "flesh wound"))
print(is_substring(example_string, "piddog"))
print(is_substring(example_string, "it's"))
print(is_substring(example_string, "It's"))

# Output

#True
#True
#False
#False
#True

# 7. 

# Write a function  make_nametag(name, topic) that takes two strings 
# first_name and topic and returns the string 
# "Hi! My name is XXX.  This lecture covers YYY." 
# where XXX is replaced by first_name and YYY is replaced by topic. 
# For this exercises, please use new-style string formatting.
def make_nametag(first_name, topic):
    """
    Given two strings first_name and topic,
    return a string of the form ""Hi! My name 
    is XXX. This lecture covers YYY." where
    XXX and YYY are first_name and topic.
    """
    
    template = "Hi! My name is {0}. This lecture covers {1}."
    return template.format(first_name, topic)
    
# Tests

print(make_nametag("Scott", "Python"))
print(make_nametag("Joe", "games"))
print(make_nametag("John", "programming tips"))


# Output

#Hi! My name is Scott. This lecture covers Python.
#Hi! My name is Joe. This lecture covers games.
#Hi! My name is John. This lecture covers programming tips.

# 8. 

# Write a function make_int(int_string) that takes as input 
# the string int_string and checks whether int_string can be converted to 
# a non-negative integer. If so, the function returns that integer. 
# Otherwise, the function returns the integer -1. For this question, 
# be sure to use the Python docs to search for a string function 
# that checks whether a string consists entirely of digits.
def make_int(int_string):
    """
    Given the string int_string, return the associated integer if all 
    digits are decimal digits.  Other return -1.
    """
    
    if int_string.isdigit():
        return int(int_string)
    else:
        return -1
    
# Test

print(make_int("123"))
print(make_int("00123"))
print(make_int("1.23"))
print(make_int("-123"))


# Output

#123
#123
#-1
#-1

# 9. 

# Challenge: Write a function name_swap(name_string) that 
# converts an input string name_string of the form "first last" 
# into the form "Last First" and returns this converted string. 
# For this problem, you may assume that name_string contains exactly one space.
def name_swap(name_string):
    """
    Given the string name string of the form "first last", return 
    the string "Last First" where both names are now capitalized
    """
    
    (first, last) = name_string.split(" ")
    return last.capitalize() + " " + first.capitalize()
    
# Tests

print(name_swap("joe warren"))
print(name_swap("scott rixner"))
print(name_swap("john greiner"))


# Output

#Warren Joe
#Rixner Scott
#Greiner John
