# Exercise 1

string_input = input('Please, enter a string: ')

print(f"Type of name variable is: {type(string_input)}. It should be <class 'str'>")

bool_input = bool(input('Please, enter a boolean value: '))

print(f"Type of loyalty variable is: {type(bool_input)}. It should be <class 'bool'>")

float_input = float(input('Please, enter a floating-point number: '))

print(f"Type of height variable is: {type(float_input)}. It should be <class 'float'>")

int_input = int(input('Please, enter an integer: '))

print(f"Type of age variable is: {type(int_input)}. It should be <class 'int'>")


# Exercise 2

number_of_sandwiches = int(input('How many sandwiches do you want? '))

price_of_sandwich = float(input('The price of one sandwich is $ '))

number_of_coffees = int(input('How many coffees do you want? '))

price_of_coffee = float(input('The price of one coffee is $ '))

bill_total = (number_of_sandwiches * price_of_sandwich) + (number_of_coffees * price_of_coffee)

print('Your total bill is $', bill_total)
