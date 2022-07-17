def read_words(file_name):
    """ Reads in a file.

        1. Open and read the given file into a variable using the File read()
           function
        2. Split the string to lowercase words
        3. Strip all words from anything non alphanumeric 
        4. Adds the trimmed words to a set 
        5. Print the set of words
        6. Return the set of words

    Args:
        file_name: the name of the file to be read

    Returns:
        set: lower case words of the given file.
    """
    with open(file_name, 'r') as file:
        content = file.read().lower()
        words = content.split()
        word_set = set()
        for word in words: 
            word_set.add( ''.join(c for c in word if c.isalnum()) )
        print(word_set)
    return word_set


def read_file_into_dictionary(file_name):
    """ Reads in a file and stores each line as a value in a dictionary

        1. Open the given file
        2. Read the file line by line and add each line to a dictionary
        3. Return the dictionary

    Args:
        file_name: the name of the file to be read

    Returns:
        list: a list where each element is a line in the file.
    """
    with open(file_name, 'r') as file:
        content = {}
        current_line = file.readline()
        counter = 1
        while current_line:
            content[counter] = current_line
            current_line = file.readline()
            counter += 1
    return content

def write_words_to_file(file_words, output_filename):
    """ Writes the words of a set of words to a file.

        Use the File write() function to write words 
            from a set of words into different lines 
            of a file with the name from output_filename

    Args:
        file_words: lower case words to write to the file
        output_filename: the name of the file to be written to
    """
    with open(output_filename, 'w') as output_file:
        for word in file_words: 
            output_file.write(word + "\n")

def read_odd_numbered_lines(file_name):
    """ Reads in the even numbered lines of a file

        1. Open and read the given file into a variable
        2. Read the file line-by-line and add the odd-numbered lines to a list
        3. Return the list

    Args:
        file_name: the name of the file to be read

    Returns:
        list: a list of the odd-numbered lines of the file
    """
    with open(file_name, 'r') as file:
        content = []
        current_line = file.readline()
        counter = 1
        while current_line:
            if counter % 2 == 1:
                content.append(current_line)
            current_line = file.readline()
            counter += 1
    return content

def write_last_line_backwards(file_name, output_filename):
    """ Reads a file and writes the words of the last line in reverse order

        1. Open and read the given file into a variable
        2. Read the file line-by-line and store the lines in a list 
        3. Split the last line into words
        4. Write the words of the last line into the output file one word a line

    Args:
        file_name: the name of the file to be read
        output_filename: the name of the file to write to

    """
    content = ''
    with open(file_name, 'r') as file:
        content = file.read()
    lines = content.split('\n')
    last_line_words = lines[-1].split()
    with open(output_filename, 'w') as output_file:
        for i in range(len(last_line_words)):
            output_file.write(last_line_words[len(last_line_words) - i - 1] + "\n")

'''
Here are some sample commands to help you run/test your implementations.
Feel free to uncomment/modify/add to them as you wish.
'''

def main():
    file_contents = read_words("sampletext.txt")
    print(read_file_into_dictionary("sampletext.txt"))
    write_words_to_file(file_contents, "out_file.txt")
    print(read_odd_numbered_lines("sampletext.txt"))
    write_last_line_backwards("sampletext.txt", "last_words_back.txt")

if __name__ == "__main__":
    main()
