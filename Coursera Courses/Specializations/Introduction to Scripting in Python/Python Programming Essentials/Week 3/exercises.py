# 1. 

# Write a Python function is_even that takes as input the parameter 
# number (an integer) and returns True if number is even and 
# False if number is odd. Hint: Apply the remainder operator to n 
# (i.e., number % 2) and compare to zero. 

def is_even(number):
    """
    Returns whether number is even.
    """
    return (number % 2) == 0

number = 8
if is_even(number):
    print(number, "is even.")
else:
    print(number, "is odd.")
    
number = 3
if is_even(number):
    print(number, "is even.")
else:
    print(number, "is odd.")
    
number = 12
if is_even(number):
    print(number, "is even.")
else:
    print(number, "is odd.")


# 2. 

# Write a Python function is_cool that takes as input the string name and 
# returns True if name is either "Joe", "John" or "Stephen" and 
# returns False otherwise. (Let's see if Scott manages to catch this. :) ) 

def is_cool(name):
    """
    Returns whether the person with specified name is cool.
    """
    
    return (name == "Joe") or (name == "John") or (name == "Stephen")

name = "Joe"
if is_cool(name):
    print(name, "is cool.")
else:
    print(name, "is not cool.")

name = "John"
if is_cool(name):
    print(name, "is cool.")
else:
    print(name, "is not cool.")
    
name = "Stephen"
if is_cool(name):
    print(name, "is cool.")
else:
    print(name, "is not cool.")
    
name = "Scott"
if is_cool(name):
    print(name, "is cool.")
else:
    print(name, "is not cool.")


# 3.

# Write a Python function is_lunchtime that takes as input the parameters hour 
# (an integer in the range [1,12][1, 12][1,12]) and is_am 
# (a Boolean “flag” that represents whether the hour is before noon). 
# The function should return True when the input corresponds to 11am or 12pm 
# (noon) and False otherwise. If the problem specification is unclear, 
# look at the test cases in the provided template. Our solution does not use 
# conditional statements. 

def is_lunchtime(hour, is_am):
    """
    Returns whether the given time, as represented by the hour
    and is_am, is lunchtime.
    """	
    return (hour == 11 and is_am) or (hour == 12 and not is_am)

def is_lunchtime_test(hour, is_am):
    """Tests the is_lunchtime function."""
    print(hour, end = "")
    if is_am:
        print("AM", end = "")
    else:
        print("PM", end = "")
    if is_lunchtime(hour, is_am):
        print(" is lunchtime.")
    else:
        print(" is not lunchtime.")

is_lunchtime_test(11, True)
is_lunchtime_test(12, True)
is_lunchtime_test(11, False)
is_lunchtime_test(12, False)
is_lunchtime_test(10, False)

# 4.

# Write a Python function is_leap_year that take as input the parameter year 
# and returns True if year (an integer) is a leap year according 
# to the Gregorian calendar and False otherwise. The Wikipedia entry for 
# leap years contains a simple algorithmic rule for determining whether 
# a year is a leap year. Your main task will be to translate this rule 
# into Python. 

def is_leap_year(year):
    """
    Returns whether the given Gregorian year is a leap year.
    """	
    return ((year % 4) == 0 and ((year % 100) != 0 or (year % 400) == 0))

year = 2000
if is_leap_year(year):
    print(year, "is a leap year.")
else:
    print(year, "is not a leap year.")
    
year = 1996
if is_leap_year(year):
    print(year, "is a leap year.")
else:
    print(year, "is not a leap year.")
    
year = 1800
if is_leap_year(year):
    print(year, "is a leap year.")
else:
    print(year, "is not a leap year.")
    
year = 2013
if is_leap_year(year):
    print(year, "is a leap year.")
else:
    print(year, "is not a leap year.")


# 5.

# Write a Python function interval_intersect that takes parameters a, b, c, and d 
# and returns True if the intervals [a,b] and [c,d] intersect and False otherwise. 
# While this test may seem tricky, the solution is actually very simple and 
# consists of one line of Python code. 
# (You may assume that a≤b and c≤d.) 

def interval_intersect(int1_lower, int1_upper, int2_lower, int2_upper):
    """
    Returns whether the intervals [int1_lower, int1_upper] and 
    [int2_lower, int2_upper] intersect.
    """
    return (int2_lower <= int1_upper) and (int1_lower <= int2_upper)

int1_lower, int1_upper, int2_lower, int2_upper = 0, 1, 1, 2
print("Intervals [" + str(int1_lower) + ", " + str(int1_upper) + "] and [" + 
      str(int2_lower) + ", " + str(int2_upper) + "] ", end = "")
if interval_intersect(int1_lower, int1_upper, int2_lower, int2_upper):
    print("intersect.")
else:
    print("do not intersect.")
    
int1_lower, int1_upper, int2_lower, int2_upper = 1, 2, 0, 1
print("Intervals [" + str(int1_lower) + ", " + str(int1_upper) + "] and [" + 
      str(int2_lower) + ", " + str(int2_upper) + "] ", end = "")
if interval_intersect(int1_lower, int1_upper, int2_lower, int2_upper):
    print("intersect.")
else:
    print("do not intersect.")
    
int1_lower, int1_upper, int2_lower, int2_upper = 0, 1, 2, 3
print("Intervals [" + str(int1_lower) + ", " + str(int1_upper) + "] and [" + 
      str(int2_lower) + ", " + str(int2_upper) + "] ", end = "")
if interval_intersect(int1_lower, int1_upper, int2_lower, int2_upper):
    print("intersect.")
else:
    print("do not intersect.")
    
int1_lower, int1_upper, int2_lower, int2_upper = 2, 3, 0, 1
print("Intervals [" + str(int1_lower) + ", " + str(int1_upper) + "] and [" + 
      str(int2_lower) + ", " + str(int2_upper) + "] ", end = "")
if interval_intersect(int1_lower, int1_upper, int2_lower, int2_upper):
    print("intersect.")
else:
    print("do not intersect.")
    
int1_lower, int1_upper, int2_lower, int2_upper = 0, 3, 1, 2
print("Intervals [" + str(int1_lower) + ", " + str(int1_upper) + "] and [" + 
      str(int2_lower) + ", " + str(int2_upper) + "] ", end = "")
if interval_intersect(int1_lower, int1_upper, int2_lower, int2_upper):
    print("intersect.")
else:
    print("do not intersect.")


# 6.

# Write a Python function name_and_age that take as input the parameters 
# name (a string) and age (a number) and returns a string of the form 
# "% is % years old." where the percents are the string forms of 
# name and age. The function should include an error check for the case when 
# age is less than zero. In this case, the function should return the string 
# "Error: Invalid age". Name and age template --- Name and age solution

def name_and_age(name, age):
    """
    Returns a string stating the person's age if non-negative.
    Returns an error is the age is negatice
    """
    if age >= 0:
        return name + " is " + str(age) + " years old."
    else:
        return "Error: Invalid age"

name, age = "Joe Warren", 56
print(name_and_age(name, age))

name, age = "Scott Rixner", 40
print(name_and_age(name, age))

name, age = "John Greiner", -46
print(name_and_age(name, age))


# 7.

# Write a Python function print_digits that takes an integer number 
# in the range [0,100) and prints the message 
# "The tens digit is %, and the ones digit is %." where the percents 
# should be replaced with the appropriate values. The function should include 
# an error check for the case when number is negative or greater than or equal 
# to 100. In those cases, the function should instead print 
# "Error: Input is not a two-digit number.". 

def print_digits(number):
    """
    Prints the tens and ones digit of an integer in the range(0,100).
    """
    
    if 0 <= number < 100:
        print("The tens digit is " + str(number // 10) + "," + 
              "and the ones digit is " + str(number % 10) + ".")
    else:
        print("Error: Input is not a two-digit number.")

print_digits(42)
print_digits(99)
print_digits(5)
print_digits(459)


# 8.

# Write a Python function name_lookup that takes a string first_name 
# that corresponds to one of ("Joe", "Scott", "John" or "Stephen") and then 
# returns their corresponding last name ("Warren", "Rixner", "Greiner" or "Wong"). 
# If first_name doesn't match any of those strings, return the string 
# "Error: Not an instructor". 

def name_lookup(first_name):
    """Returns the instructor's last name."""
    
    if first_name == "Joe":
        return "Warren"
    elif first_name == "Scott":
        return "Rixner"
    elif first_name == "John":
        return "Greiner"
    elif first_name == "Stephen":
        return "Wong"
    else:
        return "Error: Not an instructor"


first_name = "Joe"
print(first_name + "'s last name is", name_lookup(first_name))
      
first_name = "Scott"
print(first_name + "'s last name is", name_lookup(first_name))
      
first_name = "John"
print(first_name + "'s last name is", name_lookup(first_name))
      
first_name = "Stephen"
print(first_name + "'s last name is", name_lookup(first_name))
      
first_name = "Mary"
print(first_name + "'s last name is", name_lookup(first_name))


# 9.

# Pig Latin is a language game that involves altering words via 
# a simple set of rules. Write a Python function pig_latin that takes a string 
# word and applies the following rules to generate a new word in Pig Latin. 
# If the first letter in word is a consonant, append the consonant plus "ay" 
# to the end of the remainder of the word. For example, pig_latin("pig") 
# would return "igpay". If the first letter in word is a vowel, append "way" 
# to the end of the word. For example, pig_latin("owl") returns "owlway". 
# You can assume that word is in lower case. The provided template includes 
# code to extract the first letter and the rest of word in Python. Note that, 
# in full Pig Latin, the leading consonant cluster is moved to the end of the word. 
# However, we don't know enough Python to implement full Pig Latin just yet. 

def pig_latin(word):
    """
    Returns the (simplified) Pig Latin version of the word.
    """
    
    # Partial code for body
    first_letter = word[0]
    rest_of_word = word[1 : ]
    
    # Student should complete function on the next lines.
    if (first_letter == "a" or first_letter == "e" or first_letter == "i" or
        first_letter == "o" or first_letter == "u"):
        return word + "way"
    else:
        return rest_of_word + first_letter + "ay"

word = "pig"
print(pig_latin(word))

word = "owl"
print(pig_latin(word))

word = "python"
print(pig_latin(word))


# 10. 

# Given numbers a, b, and c, the quadratic equation ax^2+bx+c=0 
# can have zero, one or two real solutions (i.e; values for x 
# that satisfy the equation). The quadratic formula x=(−b±\sqrt{b^2 - 4ac})/2a
# can be used to compute these solutions. The expression b^2−4ac 
# is the discriminant associated with the equation. 
# If the discriminant is positive, the equation has two solutions. 
# If the discriminant is zero, the equation has one solution. 
# Finally, if the discriminant is negative, the equation has no solutions. 
# Write a Python function smaller_root that takes an input the numbers 
# a, b and c and returns the smaller solution to this equation if one exists. 
# If the equation has no real solution, print the message 
# "Error: No real solutions" and simply return. 
# Note that, in this case, the function will actually 
# return the special Python value None.

def smaller_root(coeff_a, coeff_b, coeff_c):
    """
    Returns the smaller root of a quadratic equation with the
    given coefficients.
    """
    
    discriminant = coeff_b ** 2 - 4 * coeff_a * coeff_c
    if discriminant < 0 or coeff_a == 0:
        print("Error: No real solutions")
    else:
        discriminant_sqrt = discriminant ** 0.5
        # Choose the positive or negative square root that leads to a smaller root.
        if coeff_a > 0:
            smaller = - discriminant_sqrt
        else:
            smaller = discriminant_sqrt
        return (-coeff_b + smaller) / (2 * coeff_a)

coeff_a, coeff_b, coeff_c = 1, 2, 3
print("The smaller root of " + str(coeff_a) + "x^2 + " + str(coeff_b) + 
      "x + " + str(coeff_c) + " is: ")
print(str(smaller_root(coeff_a, coeff_b, coeff_c)))

coeff_a, coeff_b, coeff_c = 2, 0, -10
print("The smaller root of " + str(coeff_a) + "x^2 + " + str(coeff_b) + 
      "x + " + str(coeff_c) + " is: ")
print(str(smaller_root(coeff_a, coeff_b, coeff_c)))


coeff_a, coeff_b, coeff_c = 6, -3, 5
print("The smaller root of " + str(coeff_a) + "x^2 + " + str(coeff_b) + 
      "x + " + str(coeff_c) + " is: ")
print(str(smaller_root(coeff_a, coeff_b, coeff_c)))
