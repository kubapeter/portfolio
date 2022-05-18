# 1. 

# Given a list example_list containing at least 4 elements, write an expression that assigns the value 0 to the 
# third element of the list. 

example_list = [2, 3, 5, 7, 11, 13]
print(example_list)

# Enter update code here
example_list[2] = 0
print(example_list)


# Output
#[2, 3, 5, 7, 11, 13]
#[2, 3, 0, 7, 11, 13]


# 2. 

# Given a list example_list containing at least 4 elements, write an expression that replaces the second and 
# third elements of the list by the list [0, 0, 0].

example_list = [2, 3, 5, 7, 11, 13]
print(example_list)

# Enter update code here
example_list[1 : 3] = [0, 0, 0]
print(example_list)


# Output
#[2, 3, 5, 7, 11, 13]
#[2, 0, 0, 0, 7, 11, 13]


# 3. 

# Given a list example_list, write an expression that mutates example_list such that the number 0 is 
# appended (i.e. added to the end) to the list. 

example_list = [2, 3, 5, 7, 11, 13]
print(example_list)

# Enter update code here
example_list.append(0)
print(example_list)


# Output
#[2, 3, 5, 7, 11, 13]
#[2, 3, 5, 7, 11, 13, 0]


# 4. 

# Given a list example_list, write an expression that mutates example_list such that the numbers in the 
# list [0, 0, 0] are appended to the list. You should not use a loop here. 

example_list = [2, 3, 5, 7, 11, 13]
print(example_list)

# Enter update code here
example_list.extend([0, 0, 0])
print(example_list)


# Output
#[2, 3, 5, 7, 11, 13]
#[2, 3, 5, 7, 11, 13, 0, 0, 0]


# 5. 

# Given a list example_list, write an expression that appends the numbers in the list [0, 0, 0] to 
# example_list. Note that this expression should not mutate example_list. (Again, you should not use a 
# loop here.) 

example_list = [2, 3, 5, 7, 11, 13]
print(example_list)

# Enter update code here

new_list = example_list + [0, 0, 0]
print(example_list)
print(new_list)


# Output
#[2, 3, 5, 7, 11, 13]
#[2, 3, 5, 7, 11, 13]
#[2, 3, 5, 7, 11, 13, 0, 0, 0]


# 6. 

# Given a list example_list, write a loop that mutates example_list such that the numbers in the list 
# [0, 0, 0] are appended to the list. 

example_list = [2, 3, 5, 7, 11, 13]
print(example_list)

# Enter update code here

for number in [0, 0, 0]:
    example_list.append(number)
    
print(example_list)


# Output
#[2, 3, 5, 7, 11, 13]
#[2, 3, 5, 7, 11, 13, 0, 0, 0]


# 7. 

# Given a list example_list, write an expression that constructs a tuple whose items correspond to those in 
# example_list. 

example_list = [2, 3, 5, 7, 11, 13]
print(example_list)

# Enter update code here

example_tuple = tuple(example_list)
    
print(example_tuple)


# Output
#[2, 3, 5, 7, 11, 13]
#(2, 3, 5, 7, 11, 13)


# 8. 

# Given a list example_list, write an expression that mutates example_list by shuffling (i.e. randomly 
# reordering) the items in this list. Hint: investigate the various methods in the random module.

import random

example_list = [2, 3, 5, 7, 11, 13]
print(example_list)

# Enter update code here

random.shuffle(example_list)    
print(example_list)


# Output - note that order of second list may vary due to randomness
#[2, 3, 5, 7, 11, 13]
#[11, 2, 7, 5, 13, 3]


# 9. 

# Challenge: The items in a list can themselves be lists. These nested lists can be used to represent a wide range of 
# 2D data such as spreadsheet information. Write a function flatten(nested_list) that takes as input the 
# list of lists nested_list. The function flaten() should return a list consisting of the items in the sublists of 
# nested_list all appended together. (See the provided template for example input and output.)

def flatten(nested_list):
    """
    Given a list whose items are list, 
    return the list formed by joining all of these lists
    """
    flattened_list = []
    for sub_list in nested_list:
        flattened_list.extend(sub_list)
    return flattened_list

# Test code
print(flatten([]))
print(flatten([[]]))
print(flatten([[1, 2, 3]]))
print(flatten([["cat", "dog"], ["pig", "cow"]]))
print(flatten([[9, 8, 7], [6, 5], [4, 3, 2], [1]]))


# Output
#[]
#[]
#[1, 2, 3]
#['cat', 'dog', 'pig', 'cow']
#[9, 8, 7, 6, 5, 4, 3, 2, 1]


# 10. 

# Challenge: Write a function remove_duplicates(items) that takes a list items and returns a new list 
# that consists of all unique items in items. The items in the returned list should be in the same order as those in 
# items. 

myList = [1, 2, 3, 1, 2, 5, 6, 7, 8]
cleanlist = []
[cleanlist.append(x) for x in myList if x not in cleanlist]


def remove_duplicates(items):
    """
    Given a list, return a list with duplicate items removed
    and the remaining items in the same order
    """
    no_duplicates = []
    for item in items:
        if item not in no_duplicates:
            no_duplicates.append(item)
    return no_duplicates



# Test code
print(remove_duplicates([]))
print(remove_duplicates([1, 2, 3, 4]))
print(remove_duplicates([1, 2, 2, 3, 3, 3, 4, 5, 6, 6]))
print(remove_duplicates(["cat", "dog", "cat", "pig", "cow", "cat", "pig", "pug"]))


# Output
#[]
#[1, 2, 3, 4]
#[1, 2, 3, 4, 5, 6]
#['cat', 'dog', 'pig', 'cow', 'pug']
