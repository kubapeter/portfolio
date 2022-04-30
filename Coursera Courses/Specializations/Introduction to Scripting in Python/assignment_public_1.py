"""
The main goals of the project for Week 4 of 
"Python Programming Essentials" are
	- to use built-in library
	- to use functions and constant not discussed in course
	- to read and understand documentation
	- to break down question to smaller parts 
	- to call functions inside other functions


The course used datetime library. Asked to write the following 
functions: 
	- next_month(month)
	- days_in_month(year, month)
	- is_valid_date(year, month, day)
	- days_between(year1, month1, day1, year2, month2, day2)
	- age_in_days(year, month, day)

In this example cmath library is used. The main goal is 
to see that due to floating point calculations sometimes 
rounding errors occur, but these can be handeled with 
cmath.isclose() function
"""

import cmath 

def cube_root(cplx_rect, nth):
	"""
	Input:
		cplx_rect - a complex number
		nth - an integer index in [1, 3] telling which cube root to calculate
	
	Returns:
		the 1st, 2nd or 3rd complex cube roots of cplx_rect
	"""
	radius, phase = cmath.polar(cplx_rect)
	root_radius = radius ** (1/3)
	root_phase = phase / 3
	phase_shift = (cmath.pi * 2) / 3
	
	root = cmath.rect(root_radius, root_phase + (nth - 1) * phase_shift)
	return root

# # tests
# """
# We can easily see that in some cases we get results without rounding error
# but in other cases rounding error appears
# """
# print("first cube root of 1 + 0j: ", cube_root(1 + 0j, 1))
# print("second cube root of 1 + 0j: ", cube_root(1 + 0j, 2))
# print("third cube root of 1 + 0j: ", cube_root(1 + 0j, 3))
# print("first cube root of 8 + 0j: ", cube_root(8 + 0j, 1))
# print("second cube root of -j (should be j): ", cube_root(0 - 1j, 2))
# print("first cube root of 3 + 4j: ", cube_root(3 + 4j, 1))

def cube_root_cubed_is_the_same(cplx_rect, nth):
	"""
	Check if f^(-1)(f(x)) == id

	Input:
		cplx_rect - a complex number
		nth - an integer index in [1, 3] telling which cube root to calculate
	
	Returns:
		true if cube root cubed is the same float 
	"""
	root = cube_root(cplx_rect, nth)
	return root ** 3 == cplx_rect

# # tests
# """
# We can easily see that in some cases we get back the same float
# but in other cases rounding errors appear
# """
# print(cube_root_cubed_is_the_same(1 + 0j, 1))
# print(cube_root_cubed_is_the_same(1 + 0j, 2))
# print(cube_root_cubed_is_the_same(8 + 0j, 1))
# print(cube_root_cubed_is_the_same(0 - 1j, 2))
# print(cube_root_cubed_is_the_same(3 + 4j, 1))

def cube_roots_cubed_are_close(cplx_rect):
	"""
	Check if f^(-1)(f(x)) and x are close

	Input:
		cplx_rect - a complex number
	
	Returns:
		true if all 3 cube roots cubed are the close to cplx_rect 
		(difference can be attributed solely to rounding)
	"""
	
	# calculate all roots
	root1 = cube_root(cplx_rect, 1)
	root2 = cube_root(cplx_rect, 2)
	root3 = cube_root(cplx_rect, 3)
	check1 = cmath.isclose(root1 ** 3, cplx_rect)
	check2 = cmath.isclose(root2 ** 3, cplx_rect)
	check3 = cmath.isclose(root3 ** 3, cplx_rect)
	return check1 and check2 and check3

# # tests
# print("cube roots of 1 + 0j cubed are all close to 1 + 0j: ", 
# 	cube_roots_cubed_are_close(1 + 0j))
# print("cube roots of 8 + 0j cubed are all close to 8 + 0j: ", 
# 	cube_roots_cubed_are_close(8 + 0j))
# print("cube roots of -j cubed are all close to -j: ", 
# cube_roots_cubed_are_close(0 - 1j))
# print("cube roots of 3 + 4j cubed are all close to 3 + 4j: ", 
# 	cube_roots_cubed_are_close(3 + 4j))

def eulers_from(cplx_rect):
	"""
	Return the complex number using Euler's formula: r*(e^(j*phi)) 
	where r is the absolute value, phi is the phase and j is sqrt(-1)

	Input:
		cplx_rect - a complex number
	
	Returns:
		a complex number calculted with Euler's formula
	"""
	radius, phase = cmath.polar(cplx_rect)
	cplx_euler = radius * (cmath.e ** (1j * phase))
	return cplx_euler

# # tests
# """
# We can easily see that in some cases we get back the same float
# but in other cases rounding errors appear
# """
# print("1 + 0j through Euler's formula: ", eulers_from(1 + 0j))
# print("-j through Euler's formula: ", eulers_from(0 - 1j))
# print("2.8 + 0j through Euler's formula: ", eulers_from(2.8 + 0j))
# print("3 + 4j through Euler's formula: ", eulers_from(3 + 4j))

"""
Let's check if the numbers are truly different
"""

def is_eulers_form_the_same(cplx_rect):
	"""
	Check if Euler's formula gives back the same float

	Input:
		cplx_rect - a complex number
	
	Returns:
		true if the complex number calculated by Euler's formula
		is the same float
	"""
	return eulers_from(cplx_rect) == cplx_rect

# # tests
# """
# In some cases it gives back the same float but in other cases not
# """
# print("1 + 0j through Euler's formula is the same float as 1 + 0j: ", 
# 	is_eulers_form_the_same(1 + 0j))
# print("-j through Euler's formula is the same float as -j: ", 
# 	is_eulers_form_the_same(0 - 1j))
# print("2.8 + 0j through Euler's formula is the same float as 2.8 + 0j: ", 
# 	is_eulers_form_the_same(2.8 + 0j))
# print("3 + 4j through Euler's formula is the same float as 3 + 4j: ", 
# 	is_eulers_form_the_same(3 + 4j))

"""
Are the differences due to rounding errors or is the formula incorrect?
"""

def is_eulers_form_close(cplx_rect):
	"""
	Check if Euler's formula gives back a close float

	Input:
		cplx_rect - a complex number
	
	Returns:
		true if the complex number calculated by Euler's formula
		is close to cplx_rect 
		(difference can be attributed solely to rounding)		
	"""
	return cmath.isclose(eulers_from(cplx_rect), cplx_rect)

# # tests
# print("1 + 0j through Euler's formula is close to 1 + 0j: ", 
# 	is_eulers_form_close(1 + 0j))
# print("-j through Euler's formula is close to -j: ", 
# 	is_eulers_form_close(0 - 1j))
# print("2.8 + 0j through Euler's formula is close to 2.8 + 0j: ", 
# 	is_eulers_form_close(2.8 + 0j))
# print("3 + 4j through Euler's formula is close to 3 + 4j: ", 
# 	is_eulers_form_close(3 + 4j))


