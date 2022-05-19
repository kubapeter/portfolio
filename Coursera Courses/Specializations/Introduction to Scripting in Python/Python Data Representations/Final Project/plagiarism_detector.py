"""
The main goals of the project for Week 4 of 
"Python Data Representations" are
	- to use string methods
	- to use lists and interation for searching
	- to use methods on lists
	- to read from file

In this file the check_plagiarism() function 
- opens two files 
- reads texts from them 
- searches the two texts for identical sections
- if found any, prints out the 5 longest and
- writes all identical sections to a file
It is apparent that this code also fulfills the 
four goals listed above

About the attached files
- textfile1.txt and textfile2.txt are two distinct 
passages from a standard "Lorem ipsum" text. They 
do not even have common words
- textfile3.txt is made from textfile1.txt with some 
deletion. Hence the identical sections
- text1original.txt and text2original.txt are two 
distinct passages of the Wikipedia entry "Plagiarism"
- text1rewritten.txt is the rewritten version of 
text1original.txt. 
"""

WORD_INTEVAL = 4

def is_precise_match(text1, text2, i, j, length):
	"""
	Inputs:
		text1 - a list of strings
		text2 - a list of strings
		i - start index for <text1>
		j - start index for <text2>
		length - the length of the section tested
	Output:
		boolean
		True, if the <length> number of words in <text1>
		starting from the i-th word are the same as the 
		<length> number of words in <text2> starting from 
		the j-th word, 
		and 
		no <length+1> number of words containing these two 
		are the same.
	"""

	# the two sections are the same
	is_match = text1[i:i+length] == text2[j:j+length]
	
	# not downward augmentable 
	no_match_down = True
	if i != 0: 
		no_match_down = text1[i-1 : i+length] != text2[j-1 : j+length]
	
	# not upward augmentable 
	no_match_up = True
	if i+length != len(text1) and j+length != len(text2):
		no_match_up = text1[i : i+length+1] != text2[j : j+length+1]
	
	return is_match and no_match_down and no_match_up

# # tests
# length = 2
# test_text1 = ["a", "b", "c", "d"]
# test_text2 = ["x", "b", "c", "y"]
# print(is_precise_match(test_text1, test_text2, 1, 1, length))
# test_text1 = ["a", "b"]
# test_text2 = ["a", "b"]
# print(is_precise_match(test_text1, test_text2, 0, 0, length))
# test_text1 = ["a", "b", "c", "d"]
# test_text2 = ["a", "b", "c", "y"]
# print(is_precise_match(test_text1, test_text2, 1, 1, length))
# test_text1 = ["a", "b", "c", "d"]
# test_text2 = ["x", "b", "c", "d"]
# print(is_precise_match(test_text1, test_text2, 1, 1, length))

def find_matches_of_length(text1, text2, length, matches):
	"""
    Inputs:
		text1 - a list of strings 
		text2 - a list of strings 
		length - an int, function looks for sections of this length 
		matches - a list of strings to collect found matches 
    Output:
		no return value
		the function looks for sublists of strings that are 
		- exactly <length> long, 
		- and can be found in both <tex1> and <text2>
		(no extension of them could still be found in both)
		if it finds such pair, it puts them into <mathches> 
    """

	for i in range(len(text1) - length + 1):
		section = text1[i:i+length]
		
		# if section is already found, do not test it
		if section in matches: 
			break
		for j in range(len(text2) - length + 1):
			if is_precise_match(text1, text2, i, j, length): 
				matches.append(section)

# # tests
# test_text1 = ["x", "x", "a", "b", "x"]
# test_text2 = ["y", "a", "b", "y"]
# length = 2
# test_container = []
# find_matches_of_length(test_text1, test_text2, length, test_container)
# print(test_container == [['a', 'b']]) 


# test_text1 = ["a", "b"]
# test_text2 = ["y", "a", "b", "y"]
# length = 2
# test_container = []
# find_matches_of_length(test_text1, test_text2, length, test_container)
# print(test_container == [['a', 'b']])

# test_text1 = ["x", "x"]
# test_text2 = ["y", "y", "y", "y"]
# length = 2
# test_container = []
# find_matches_of_length(test_text1, test_text2, length, test_container)
# print(test_container == [])

# test_text1 = ["x", "a", "b", "x", "a", "b"]
# test_text2 = ["y", "a", "b", "y"]
# length = 2
# test_container = []
# find_matches_of_length(test_text1, test_text2, length, test_container)
# print(test_container == [['a', 'b']]) 

# test_text1 = ["x", "a", "b", "c", "x"]
# test_text2 = ["y", "a", "b", "c", "y"]
# length = 2
# test_container = []
# find_matches_of_length(test_text1, test_text2, length, test_container)
# print(test_container  == [])

# test_text1 = ["x", "a", "b", "c", "x"]
# test_text2 = ["y", "a", "b", "c", "y"]
# length = 3
# test_container = []
# find_matches_of_length(test_text1, test_text2, length, test_container)
# print(test_container == [['a', 'b', "c"]])


def find_all_sections(text1, text2, matches):
	"""
	Input: 
		text1 - a list of strings 
		text2 - a list of strings 
		matches - a list of strings to collect found matches
	Output: 
		no return value
		starting from the longest possible length, the function checks 
		if such long identical substrings exist in <text1> and <text2>
		if yes, it appends it to <mathes>
		the length of the searched substrings gradually decreases
		until it reaches the <WORD_INTEVAL>

	"""
	length = min(len(text1), len(text2))
	while length >= WORD_INTEVAL:
		find_matches_of_length(text1, text2, length, matches)
		length -= 1

# # tests
# length_7 = ["a", "b", "c", "d", "e", "f", "g"]
# length_4 = ["a", "b", "c", "d"]
# length_3 = ["a", "b", "c"]

# test_text1 = ["x"] +  length_7 + ["x"] + length_4 + ["x"]
# test_text2 = ["y"] +  length_4 + ["y"] + length_7 + ["y"]
# test_container = []
# find_all_sections(test_text1, test_text2, test_container)
# print(test_container == [length_7, length_4])

# test_text1 = length_7 + ["x"] + length_4
# test_text2 = length_4 + ["y"] + length_7
# test_container = []
# find_all_sections(test_text1, test_text2, test_container)
# print(test_container == [length_7, length_4])

# test_text1 = length_7 
# test_text2 = length_4 
# test_container = []
# find_all_sections(test_text1, test_text2, test_container)
# print(test_container == [length_4])

# test_text1 = length_7 
# test_text2 = length_3 
# test_container = []
# find_all_sections(test_text1, test_text2, test_container)
# print(test_container == [])

# test_text1 = ["x", "y"] + length_4 
# test_text2 = length_4 + ["x", "y", "a", "b"] 
# find_all_sections(test_text1, test_text2, test_container)
# print(test_container == [['x', 'y', 'a', 'b'], ['a', 'b', 'c', 'd']])

def get_file_text(filename):
	"""
	Inputs:
		filename - name of file to read
	Output:
		Returns a list of strings from the file <filename>. Only
		alphanumeric characters are returned in lower case
		
		If the file does not exist or is not readable, then the
		behavior of this function is undefined.
	"""
	
	# get the list from the file
	with open(filename) as file_object:
		text_raw = file_object.read()
	
	# process text
	text_lower = text_raw.lower()
	text_split = text_lower.split()
	# leave only alphanumeric chars
	for i in range(len(text_split)):
		text_split[i] = "".join(char for char in text_split[i] if char.isalnum())
	text = text_split
	
	return text


#print(get_file_text("textfile1.txt")) 

def handle_results(matches, outfile):
	"""
	Input: 
		matches - a list of strings of found identical sections
		outfile - name of the file to append
	Output: 
		no return vaule
		the function prints out the 5 longest identical sections 
		(if there in any) and saves them to a file
	"""
	
	print("-----------------")
	
	# if no maches do not even open the file
	if len(matches) == 0:
		print("There are no significant matches between the two texts.")
		print("Not any {count} consecutive words of the two texts agree."
			.format(count = WORD_INTEVAL))
		return
	
	# if there are matches, print the 5 longest and write all to output file
	output_file = open(outfile, "a")
	if len(matches) > 0 and len(matches) <= 5:
		print("There are {amount} significant matches between the two texts."
			.format(amount = len(matches)))
		print("These are the following. \n")
		
		# print and write matches one by one
		for i in range(len(matches)):
			match_line = str(i+1) + ": " + " ".join(matches[i]) + "\n"
			print(match_line)
			output_file.write(match_line)
	if len(matches) > 5:
		print("There are {amount} significant matches between the two texts."
			.format(amount = len(matches)))
		print("The 5 longest are the following. \n")
		
		# print and write matches one by one
		for i in range(5):
			match_line = str(i+1) + ": " + " ".join(matches[i]) + "\n"
			print(match_line)
			output_file.write(match_line)	
	print("All the matches are written to {outfile_name}"
		.format(outfile_name = outfile))
	output_file.close()

def check_plagiarism(filename1, filename2):
	"""
	Input: 
		filename1 - file containing text
		filename2 - file containing text
	Output: 
		no return vaule
		the function reads the two texts
		finds identical sections of the two texts
		prints out the 5 longest of these sections
		writes all identical sections to a file
	"""

	outfile = "matching_sections.txt"
	print("-----------------")
	print("Looking for identical sections of the texts {text1} and {text2}"
		.format(text1 = filename1, text2 = filename2))
	
	text1 = get_file_text(filename1)
	text2 = get_file_text(filename2)

	matches = []
	find_all_sections(text1, text2, matches)
	handle_results(matches, outfile)		

check_plagiarism("textfile1.txt", "textfile3.txt")
# check_plagiarism("textfile1.txt", "textfile2.txt")
# check_plagiarism("text1original.txt", "text2original.txt")
# check_plagiarism("text1original.txt", "text1rewritten.txt")
