# 1. 

# There are 5280 feet in a mile. Write a Python statement 
# that calculates and prints the number of feet in 13 miles. 

print(13 * 5280)

# 2.

# Write a Python statement that calculates and prints 
# the number of seconds in 7 hours, 21 minutes and 37 seconds. 

print((7 * 60 + 21) * 60 + 37)

# 3.

# The perimeter of a rectangle is 2w+2h, where w and h are the lengths of its sides. 
# Write a Python statement that calculates and prints the length in inches 
# of the perimeter of a rectangle with sides of length 4 and 7 inches. 

print(4 * 2 + 7 * 2)

# 4.

# The area of a rectangle is wh, where w and h are the lengths of its sides. 
# Note that the multiplication operation is not shown explicitly in this formula. 
# This is standard practice in mathematics, but not in programming. 
# Write a Python statement that calculates and prints the area 
# in square inches of a rectangle with sides of length 4 and 7 inches.

print(4 * 7)

# 5.

# The circumference of a circle is 2πr where r is the radius of the circle. 
# Write a Python statement that calculates and prints the circumference 
# in inches of a circle whose radius is 8 inches. Assume that the constant π=3.14. 

print(2 * 3.14 * 8)

# 6.

# The area of a circle is πr^2 where r is the radius of the circle. 
# (The raised 2 in the formula is an exponent.) Write a Python statement 
# that calculates and prints the area in square inches of a circle 
# whose radius is 8 inches. Assume that the constant π=3.14.

print(3.14 * 8 ** 2)

# 7.

# Given p dollars, the future value of this money when compounded yearly 
# at a rate of r percent interest for y years is p(1+0.01r)^y. 
# (Remember that you don't need to understand how this formula works, 
#  only how to translate it into Python.) Write a Python statement 
# that calculates and prints the value of 1000 dollars 
# compounded at 7 percent interest for 10 years. 

print(1000 * (1 + 0.01 * 7) ** 10)

# 8. 

# Write a single Python statement that combines the three strings 
# "My name is", "Joe" and "Warren" (plus a couple of other small strings) 
# into one larger string "My name is Joe Warren." and prints the result. 
# (Hint: Experiment with adding two strings in Python using the +  operator.) 

print("My name is " + "Joe" + " " + "Warren" + ".")

# 9. 

# Write a Python expression that creates the string 
# "Joe Warren is 56 years old." from several strings including 
# "Joe Warren" and the number 56 and then prints the result 
# (Hint: Use the function str to convert the number into a string.) 

print("Joe Warren" + " is " + str(56) + " years old.")

# 10. 

# Challenge: The distance between two points (x0,y0) and (x1,y1) is 
# sqrt{(x_0-x_1)^2 + (y_0-y_1)^2}. Write a Python statement that 
# calculates and prints the distance between the points (2,2) and (5,6). 
# (Hint: Remember that a square root can be computed 
# by raising a value to the 0.50.50.5 power.)

print(((2 - 5) ** 2 + (2 - 6) ** 2) ** 0.5)

# 11.

# Given a template that pre-defines a variable miles, 
# write an assignment statement that defines a variable feet 
# whose value is the number of feet in miles miles. 

miles = 13
feet = miles * 5280
print(str(miles) + " miles equals " + str(feet) + " feet.")

# 12. 

# Given a template that pre-defines three variables hours, minutes and seconds, 
# write an assignment statement that updates the variable total_seconds 
# to have a value corresponding to the total number of seconds for hours hours, 
# minutes minutes and seconds seconds. 

hours = 7
minutes = 21
seconds = 37
total_seconds = (hours * 60 + minutes) * 60 + seconds
print(str(hours) + " hours, " + str(minutes) + " minutes, and " + 
      str(seconds) + " seconds totals to " + str(total_seconds) + " seconds.")

# 13.

# Given a template that pre-defines the variables width and height 
# that are the lengths of the sides of a rectangle, 
# write an assignment statement that defines a variable perimeter 
# whose value is the perimeter of the rectangle in inches. 

width = 4
height = 7
perimeter = width * 2 + height * 2
print("A rectangle " + str(width) + " inches wide and " + str(height) + 
      " inches high has a perimeter of " + str(perimeter) + " inches.")

# 14.

# Given a template that pre-defines the variables width and height 
# that are the lengths of the sides of a rectangle, 
# write an assignment statement that defines a variable area 
# whose value is the area of the rectangle in square inches. 

width = 4
height = 7
area = width * height
print("A rectangle " + str(width) + " inches wide and " + str(height) + 
      " inches high has an area of " + str(area) + " square inches.")

# 15.

# Given a template that pre-defines the constant PI and the variable radius 
# corresponding to the radius of a circle in inches, 
# write an assignment statement that defines a variable circumference 
# whose value is the circumference of a circle with radius radius in inches. 

PI = 3.14
radius = 8
circumference = 2 * PI * radius
print("A circle with a radius of " + str(radius) + 
      " inches has a circumference of " + str(circumference) + " inches.")

# 16.

# Given a template that pre-defines the constant PI and the variable radius 
# corresponding to the radius of a circle in inches, 
# write an assignment statement that defines a variable area 
# whose value is the area of a circle with radius radius in square inches.

PI = 3.14
radius = 8
area = PI * radius ** 2
print("A circle with a radius of " + str(radius) + 
      " inches has an area of " + str(area) + " square inches.")

# 17.

# Given the pre-defined variables present_value, annual_rate and years, 
# write an assignment statement that define a variable future_value 
# whose value is present_value dollars invested at annual_rate percent interest, 
# compounded annually for years years. 

present_value = 1000
annual_rate = 7
years = 10
future_value = present_value * (1 + 0.01 * annual_rate) ** years
print("The future value of $" + str(present_value) + " in " + str(years) + 
      " years at an annual rate of " + str(annual_rate) + "% is $" + str(future_value) + ".")

# 18.

# Give the pre-defined variables first_name and last_name, 
# write an assignment statement that defines the variable name_tag 
# whose value is the string "My name is % %." 
# where the percents should be replaced by first_name and last_name. 
# Remember that, in Python, you can use the + operator on strings 
# to concatenate (i.e. join) them together into a single string.

first_name = "Joe"
last_name = "Warren"
name_tag = "My name is " + first_name + " " + last_name + "."
print(name_tag)

# 19.

# Given the pre-defined variables name (a string) and age (a number), 
# write an assignment statement that defines a variable statement 
# whose value is the string "% is % years old." where the percents 
# should be replaced by name and the string form of age. 

name = "Joe Warren"
age = 5
statement = name + " is " + str(age) + " years old."
print(statement)

# 20.

# Challenge: Given the variables x_0, y_0, x_1, and y_1, 
# write an assignment statement that defines a variable distance 
# whose values is the distance between the points (x0,y0) and (x1,y1).

x_0 = 2
y_0 = 2
x_1 = 5
y_1 = 6
distance = ((x_0 - x_1) ** 2 + (y_0 - y_1) ** 2) ** 0.5
print("The distance from (" + str(x_0) + ", " + str(y_0) + 
      ") to (" + str(x_1) + ", " + str(y_1) + ") is " + str(distance) + ".")

# 21. 

# Challenge:Heron's formula states the area of a triangle is 
# sqrt{s(s-a)(s-b)(s-c)} where a, b and c are the lengths 
# of the sides of the triangle and s=0.5(a+b+c) is thes emi-perimeter
# of the triangle. Given the variables x_0, y_0, x_1, y_1, x_2 and y_2, 
# write a Python program that computes a variable area 
# whose value is the area of the triangle with vertices (x0,y0), (x1,y1) 
# and (x2,y2). (Hint: our solution uses five assignment statements.)

x_0, y_0 = 0, 0
x_1, y_1 = 3, 4
x_2, y_2 = 1, 1

len_01 = ((x_0 - x_1) ** 2 + (y_0 - y_1) ** 2) ** 0.5
len_02 = ((x_0 - x_2) ** 2 + (y_0 - y_2) ** 2) ** 0.5
len_12 = ((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2) ** 0.5
semi_perim = (len_01 + len_02 + len_12) / 2
area = (semi_perim * (semi_perim - len_01) * (semi_perim - len_02) * (semi_perim - len_12)) ** 0.5

print("A triangle with vertices (" + str(x_0) + "," + str(y_0) + ")," + 
      " (" + str(x_1) + "," + str(y_1) + "), and" + 
      " (" + str(x_2) + "," + str(y_2) + ") has an area of " + str(area) + ".")
