# 1. 

# Write a Python function miles_to_feet that takes a parameter miles 
# and returns the number of feet in miles miles. 

def miles_to_feet(miles):
    """
    Returns the number of feet in the given number of miles.
    """
    
    return miles * 5280

miles = 13
print(str(miles) + " miles equals " + str(miles_to_feet(miles)) + " feet.")
    
miles = 57
print(str(miles) + " miles equals " + str(miles_to_feet(miles)) + " feet.")

miles = 82.67
print(str(miles) + " miles equals " + str(miles_to_feet(miles)) + " feet.")
  
  
# 2. 

# Write a Python function total_seconds that takes three parameters 
# hours, minutes and seconds and returns the total number of seconds 
# for hours hours, minutes minutes and seconds seconds. 

def total_seconds(hours, minutes, seconds):
    """
    Returns the number of seconds in the given number of hours, minutes, and seconds.
    """
    
    return (hours * 60 + minutes) * 60 + seconds

hours, minutes, seconds = 7, 21, 37
print(str(hours) + " hours, " + str(minutes) + " minutes, and " + 
      str(seconds) + " seconds totals to " + str(total_seconds(hours, minutes, seconds)) + 
      " seconds.")

hours, minutes, seconds = 10, 1, 7
print(str(hours) + " hours, " + str(minutes) + " minutes, and " + 
      str(seconds) + " seconds totals to " + str(total_seconds(hours, minutes, seconds)) + 
      " seconds.")

hours, minutes, seconds = 1, 0, 1
print(str(hours) + " hours, " + str(minutes) + " minutes, and " + 
      str(seconds) + " seconds totals to " + str(total_seconds(hours, minutes, seconds)) + 
      " seconds.")

  
# 3.

# Write a Python function rectangle_perimeter 
# that takes two parameters width and height 
# corresponding to the lengths of the sides of a rectangle 
# and returns the perimeter of the rectangle in inches. 

def rectangle_perimeter(width, height):
    """
    Returns the perimeter of a rectangle with the given width and height.
    """
    
    return width * 2 + height * 2

width, height = 4, 7
print("A rectangle " + str(width) + " inches wide and " + str(height) + 
      " inches high has a perimeter of " + str(rectangle_perimeter(width, height)) + " inches.")

width, height = 7, 4
print("A rectangle " + str(width) + " inches wide and " + str(height) + 
      " inches high has a perimeter of " + str(rectangle_perimeter(width, height)) + " inches.")

width, height = 10, 10
print("A rectangle " + str(width) + " inches wide and " + str(height) + 
      " inches high has a perimeter of " + str(rectangle_perimeter(width, height)) + " inches.")

  
# 4.

# Write a Python function rectangle_area 
# that takes two parameters width and height 
# corresponding to the lengths of the sides of a rectangle and 
# returns the area of the rectangle in square inches. 

def rectangle_area(width, height):
    """
    Returns the area of a rectangle with the given width and height.
    """
    
    return width * height

width, height = 4, 7
print("A rectangle " + str(width) + " inches wide and " + str(height) + 
      " inches high has an area of " + str(rectangle_area(width, height)) + " square inches.")
    
width, height = 7, 4
print("A rectangle " + str(width) + " inches wide and " + str(height) + 
      " inches high has an area of " + str(rectangle_area(width, height)) + " square inches.")

width, height = 10, 10
print("A rectangle " + str(width) + " inches wide and " + str(height) + 
      " inches high has an area of " + str(rectangle_area(width, height)) + " square inches.")


# 5.

# Write a Python function circle_circumference that takes a single parameter 
# radius corresponding to the radius of a circle in inches and 
# returns the the circumference of a circle with radius radius in inches. 
# Do not use π=3.14, instead use the math module to supply 
# a higher-precision approximation to π. 

import math
PI = math.pi

def circle_circumference(radius):
    """
    Returns the circumference of a circle of the given radius.
    """
    
    return 2 * PI * radius

radius = 8
print("A circle with a radius of " + str(radius) + 
      " inches has a circumference of " + str(circle_circumference(radius)) + " inches.")

radius = 3
print("A circle with a radius of " + str(radius) + 
      " inches has a circumference of " + str(circle_circumference(radius)) + " inches.")

radius = 12.9
print("A circle with a radius of " + str(radius) + 
      " inches has a circumference of " + str(circle_circumference(radius)) + " inches.")


# 6.

# Write a Python function circle_area that takes a single parameter radius 
# corresponding to the radius of a circle in inches and 
# returns the area of a circle with radius radius in square inches. 
# Do not use π=3.14, instead use the math module to supply 
# a higher-precision approximation to π. 

import math
PI = math.pi

def circle_area(radius):
    """
    Returns the area of a circle of the given radius.
    """
    return PI * radius ** 2

radius = 8
print("A circle with a radius of " + str(radius) + 
      " inches has an area of " + str(circle_area(radius)) + 
      " square inches.")

radius = 3
print("A circle with a radius of " + str(radius) + 
      " inches has an area of " + str(circle_area(radius)) + 
      " square inches.")

radius = 12.9
print("A circle with a radius of " + str(radius) + 
      " inches has an area of " + str(circle_area(radius)) + 
      " square inches.")



# 7.

# Write a Python function future_value that takes three parameters 
# present_value, annual_rate and years and 
# returns the future value of present_value dollars invested at 
# annual_rate percent interest, compounded annually for years years. 

def future_value(present_value, annual_rate, years):
    """
    Returns the future value of the given money invested at an annual
    interest rate, compounded annually for the given number of years.
    """
    
    return present_value * (1 + 0.01 * annual_rate) ** year

present_value, annual_rate, years = 1000, 7, 10	
print("The future value of $" + str(present_value) + " in " + str(years) + 
      " years at an annual rate of " + str(annual_rate) + "% is $" + 
      str(future_value(present_value, annual_rate, years)) + ".")
    
present_value, annual_rate, years = 200, 4, 5
print("The future value of $" + str(present_value) + " in " + str(years) + 
      " years at an annual rate of " + str(annual_rate) + "% is $" + 
      str(future_value(present_value, annual_rate, years)) + ".")

present_value, annual_rate, years = 1000, 3, 20
print("The future value of $" + str(present_value) + " in " + str(years) + 
      " years at an annual rate of " + str(annual_rate) + "% is $" + 
      str(future_value(present_value, annual_rate, years)) + ".")


# 8.

# Write a Python function name_tag that takes as input 
# the parameters first_name and last_name (strings) and 
# returns a string of the form "My name is % %." where the percents are 
# the strings first_name and last_name. Reference the test cases in the 
# provided template for an exact description of the 
# format of the returned string. 

def name_tag(first_name, last_name):
    """
    Returns a name tag string with the given name.
    """
    
    return "My name is " + first_name + " " + last_name + ".

first_name, last_name = "Joe", "Warren"
print(name_tag(first_name, last_name))

first_name, last_name = "Scott", "Rixner"
print(name_tag(first_name, last_name))

first_name, last_name = "John", "Greiner"
print(name_tag(first_name, last_name))


# 9.

# Write a Python function name_and_age that takes as input 
# the parameters name (a string) and age (a number) and 
# returns a string of the form "% is % years old." 
# where the percents are the string forms of name and age. 
# Reference the test cases in the provided template for an exact description 
# of the format of the returned string. 

def name_and_age(name, age):
    """
    Returns a string stating the person's age.
    """
    
    return name + " is " + str(age) + " years old."

name, age = "Joe Warren", 56
print(name_and_age(name, age))

name, age = "Scott Rixner", 40
print(name_and_age(name, age))

name, age = "John Greiner", 46
print(name_and_age(name, age))


# 10.

# Write a Python function point_distance that takes as input the parameters 
# x_0, y_0, x_1 and y_1, and returns the distance between the points 
# (x0,y0) and (x1,y1). 

def point_distance(x_0, y_0, x_1, y_1):
    """
    Returns the Euclidian distance between two points (x0,y0) and (x1,y1).
    """
    
    return ((x_0 - x_1) ** 2 + (y_0 - y_1) ** 2) ** 0.5

x_0, y_0, x_1, y_1 = 2, 2, 5, 6
print("The distance from (" + str(x_0) + ", " + str(y_0) + ") to (" + 
      str(x_1) + ", " + str(y_1) + ") is " + str(point_distance(x_0, y_0, x_1, y_1)) + ".")

x_0, y_0, x_1, y_1 = 1, 1, 2, 2
print("The distance from (" + str(x_0) + ", " + str(y_0) + ") to (" + 
      str(x_1) + ", " + str(y_1) + ") is " + str(point_distance(x_0, y_0, x_1, y_1)) + ".")

x_0, y_0, x_1, y_1 = 0, 0, 3, 4
print("The distance from (" + str(x_0) + ", " + str(y_0) + ") to (" + 
      str(x_1) + ", " + str(y_1) + ") is " + str(point_distance(x_0, y_0, x_1, y_1)) + ".")


# 11.

# Challenge: Write a Python function triangle_area that takes the parameters 
# x_0, y_0, x_1,y_1, x_2, and y_2 (all numbers), and returns 
# the area of the triangle with vertices (x0,y0), (x1,y1) and (x2,y2). 
# (Hint: use the function point_distance as a helper function and 
# apply Heron's formula.)

def point_distance(x_0, y_0, x_1, y_1):
    """
    Returns the Euclidian distance between two points (x0,y0) and (x1,y1).
    """
    
    return ((x_0 - x_1) ** 2 + (y_0 - y_1) ** 2) ** 0.5
    
def triangle_area(x_0, y_0, x_1, y_1, x_2, y_2):
    """
    Returns the area of a triangle with vertices (x0,y0), (x1,y1), and (x2,y2).
    """
    
    # Compute the lengths of the three sides.
    len_01 = point_distance(x_0, y_0, x_1, y_1)
    len_02 = point_distance(x_0, y_0, x_2, y_2)
    len_12 = point_distance(x_1, y_1, x_2, y_2)
    
    # Compute the semi-perimeter length, i.e., half of the perimeter length.
    semi_perim = (len_01 + len_02 + len_12) / 2
    
    # Compute the area according to Heron's formula.
    return (semi_perim * (semi_perim - len_01) * (semi_perim - len_02) * (semi_perim - len_12)) ** 0.5

def test(x_0, y_0, x_1, y_1, x_2, y_2):
    """Tests the triangle_area function."""
    
    print("A triangle with vertices (" + str(x_0) + "," + str(y_0) + "),")
    print("(" + str(x_1) + "," + str(y_1) + "), and")
    print("(" + str(x_2) + "," + str(y_2) + ") has an area of")
    print(str(triangle_area(x_0, y_0, x_1, y_1, x_2, y_2)) + ".")

x_0, y_0, x_1, y_1, x_2, y_2 = 0, 0, 3, 4, 1, 1
print("A triangle with vertices (" + str(x_0) + ", " + str(y_0) + "), (" + 
      str(x_1) + "," + str(y_1) + "), and (" + str(x_2) + ", " + str(y_2) + 
      ") has an area of " + str(triangle_area(x_0, y_0, x_1, y_1, x_2, y_2)) + ".")

x_0, y_0, x_1, y_1, x_2, y_2 = -2, 4, 1, 6, 2, 1
print("A triangle with vertices (" + str(x_0) + ", " + str(y_0) + "), (" + 
      str(x_1) + "," + str(y_1) + "), and (" + str(x_2) + ", " + str(y_2) + 
      ") has an area of " + str(triangle_area(x_0, y_0, x_1, y_1, x_2, y_2)) + ".")

x_0, y_0, x_1, y_1, x_2, y_2 = 10, 0, 0, 0, 0, 10
print("A triangle with vertices (" + str(x_0) + ", " + str(y_0) + "), (" + 
      str(x_1) + "," + str(y_1) + "), and (" + str(x_2) + ", " + str(y_2) + 
      ") has an area of " + str(triangle_area(x_0, y_0, x_1, y_1, x_2, y_2)) + ".")


# 12.
 
# Challenge: Write a Python function print_digits that takes 
# an integer number in the range [0,100), (i.e., at least 0, but less than 100) 
# and prints the message "The tens digit is %, and the ones digit is %.", 
# where the percent signs should be replaced with the appropriate values. 
# (Hint: Use the arithmetic operators for integer division // and 
# remainder % to find the two digits. 
# Note that this function should print the desired message, 
# rather than returning it as a string. 

def print_digits(number):
    """
    Prints the tens and ones digit of an integer in [0,100).
    """
    
    print("The tens digit is " + str(number // 10) + ", and the ones digit is " + 
          str(number % 10) + ".")

print_digits(42)
print_digits(99)
print_digits(5)


# 13.
 
# Challenge:Powerball is lottery game in which 6 numbers are drawn at random. 
# Players can purchase a lottery ticket with a specific number combination and, 
# if the number on the ticket matches the numbers generated in a random drawing, 
# the player wins a massive jackpot. 
# Write a Python function powerball that takes no arguments and prints the message 
#  "Today’s numbers are %, %, %, %, and %. The Powerball number is %.". 
#  The first five numbers should be random integers in the range [1,60), 
#  i.e., at least 1, but less than 60. In reality, these five numbers must all 
#  be distinct, but for this problem, we will allow duplicates. 
#  The Powerball number is a random integer in the range [1,36), 
#  i.e., at least 1 but less than 36. Note that this function should print the 
#  desired message, rather than returning it as a string. 

import random

def powerball():
    """
    Prints Powerball lottery numbers.
    """
    
    # Note that including the optional argument end = "" to print() cause
    # print to NOT generate a newline
    
    print("Today's numbers are " + str(random.randrange(1, 60)) + ", ", end = "")
    print(str(random.randrange(1, 60)) + ", ", end = "")
    print(str(random.randrange(1, 60)) + ", ", end = "") 
    print(str(random.randrange(1, 60)) + ", and ", end = "")
    print(str(random.randrange(1, 60)) + ". The Powerball number is ",  end = "") 
    print(str(random.randrange(1, 36)) + ".")

powerball()
powerball()
powerball()


