# 1. 

# Create a list that contains first 6 prime numbers in ascending order. 
# (This list should be created manually.) Print out the 2nd, 4th, 
# and 6th numbers in this list.
prime_list = [2, 3, 5, 7, 11, 13]
print(prime_list[1], prime_list[3], prime_list[5])

# Output
#3 7 13

# 2. 

# Given a non-empty list example_list, write a Python expression 
# that produces the list formed by the first and last elemets in example_list.
example_list = [2, 3, 5, 7, 11, 13]
firstlast_list = [example_list[0], example_list[-1]]
print(firstlast_list)

# Output
#[2, 13]

# 3. 

# Given a list example_list with at least two elemts, 
# write a Python expression using a string slice that produces the string 
# formed by excluding the first and last elements in example_list.
example_list = [2, 3, 5, 7, 11, 13]
middle_list = example_list[1 : -1]
print(middle_list)

# Output
#[3, 5, 7, 11]

# 4. 

# Write a Python expression that creates a list of length 16 
# whose first 8 entries are True and whose last 8 entries are False. 
# Note that your answer should not include more than one instance of True
# and one instance of False in the expression used to create the list.

truefalse_list = 8 * [True] + 8 * [False]
print(truefalse_list)

# Output
#[True, True, True, True, True, True, True, True, False, False, False, False, False, False, False, False]

# 5. 

# Write a Python expression that that takes a string text 
# and split it into a list of words separated by spaces. For this problem, 
# you may assume that the words in text are separated by spaces with no punctuation.
quote = "Bring me a shrubbery"
word_list = quote.split(" ")
print(word_list)

# Output
#['Bring', 'me', 'a', 'shrubbery']

# 6. 

# Write a function word_count(text, word) that takes a string text and a string word as input. 
# word_count should split the string of text into a list of words and count the number of times 
# that word appears in the resulting list. For this problem, you may assume that the words in 
# text are separated by spaces with no punctuation and word includes no spaces.
def word_count(text, word):
    """
    Given a string text consist of words separate by spaces and a string word
    (with no spaces), return the number of times that word appears in the text
    """
    word_list = text.split(" ")
    return word_list.count(word)

# Tests

print(word_count("this pigdog is a fine pigdog", "pigdog"))
print(word_count("this pigdog is not a dog", "dog"))
print(word_count("this pigdog is not a pig", "pigdog"))

# Output
#2
#1
#1

# 7. 

# Given the list list1 in the template, make a new reference list2 
# to list1. Update the first entry in list2 to be zero. What happened 
# to the first entry in list1? Explain your answer (in a comment).

# Initial list
list1 = [2, 3, 5, 7, 11, 13]

# Another reference to list1
list2 = list1

# Print out both lists
print(list1)
print(list2)

# Update the first item in second list to zero
list2[0] = 0

# Print out both lists
print(list1)
print(list2)

# Explain what happens to list1 in a comment

# Answer - list1 and list2 are references to the same list
# Updating an item in one list mutates the other list


# Output
#[2, 3, 5, 7, 11, 13]
#[2, 3, 5, 7, 11, 13]
#[0, 3, 5, 7, 11, 13]
#[0, 3, 5, 7, 11, 13]

# 8. 

# Given the list list1 in the template, make a new copy list2 of the list list1 
# using the function list. Update the first entry in list2 to be zero. 
# What happened to the first entry in list1? Explain your answer (in a comment).

# Initial list
list1 = [2, 3, 5, 7, 11, 13]

# Make a copy of list1
list2 = list(list1)

# Print out both lists
print(list1)
print(list2)

# Update the first item in second list to zero
list2[0] = 0

# Print out both lists
print(list1)
print(list2)

# Explain what happens to list1 in a comment

# Answer - list1 and list2 are two references to distinct lists
# Updating an item in one list does not affect the second list


# Output
#[2, 3, 5, 7, 11, 13]
#[2, 3, 5, 7, 11, 13]
#[2, 3, 5, 7, 11, 13]
#[0, 3, 5, 7, 11, 13]

# 9. 

# Write a Python function list_max(num_list) that takes 
# a non-empty list of numbers num_list and returns maximum (largest) number
# in the list. Since there is a built-in function max in Python that 
# performs this computation in a single step, instead implement this function 
# using a loop that iterates over the input list.
def list_max(numbers):
    """
    Given a list of numbers, return the maximum (largest) number
    in the list
    """
    maximum = numbers[0]
    for number in numbers[1 :]:
        if number > maximum:
            maximum = number
    return maximum

# Tests
print(list_max([4]))
print(list_max([-3, 4]))
print(list_max([5, 3, 1, 7, -3, -4]))
print(list_max([1, 2, 3, 4, 5]))


# Output
#4
#4
#7
#5

# 10. 

# Challenge: Write a Python function concatenate_ints(int_list) 
# that takes a list of non-negative integers int_list and returns 
# a single integer formed by concatenating the digits of the integer in the list. 
# For example, list_to_int([11, 33, 50]) should return the integer 113350.
def concatenate_ints(int_list):
    """
    Given a list of integers int_list, return the integer formed by
    concatenating their decimal digits together
    """
    digits = ""
    for number in int_list:
        digits += str(number)
    return int(digits)

# Tests
print(concatenate_ints([4]))
print(concatenate_ints([4, 0, 4]))
print(concatenate_ints([123, 456, 789]))
print(concatenate_ints([32, 796, 1000]))


# Output
#4
#404
#123456789
#327961000








