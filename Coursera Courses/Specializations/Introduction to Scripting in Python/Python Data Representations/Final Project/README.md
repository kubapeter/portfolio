# Final Project: Plagiarism Detector


# The original project: File Differences

## Problem 1: Finding the first difference between two lines

>First, you will write a function called `singleline_diff` that takes two single line strings. You may assume that both strings are always a single line and do not contain any newline characters. The function should return the index of the first character that differs between the two lines.  If the lines are the same, the function should return the constant `IDENTICAL`, which is already defined to be `−1` in the provided template file.
>
>If the lines are different lengths, but the entire shorter line matches the beginning of the longer line, then the first difference is located at the index that is one past the last character in the shorter line. In other words, no character after the end of the shorter line is defined to be different than whatever character exists in the longer line at that location.
>Here is the signature of the s`singleline_diff` function:
```python
def singleline_diff(line1, line2):
    """
    Inputs:
      line1 - first single line string
      line2 - second single line string
    Output:
      Returns the index where the first difference between 
      line1 and line2 occurs.

      Returns IDENTICAL if the two lines are the same.
    """
```
## Problem 2: Presenting the differences between two lines in a nicely formatted way

>Next, you will write a function called `singleline_diff_format` that takes two single line strings and the index of the first difference and will generate a formatted string that will allow a user to clearly see where the first difference between two lines is located. A user is likely going to want to see where the difference is in the context of the lines, not just see a number. Your function will return a three line string that looks as follows:
```
abcd
==^
abef
```
>The format of these three lines is:
>1. The complete first line.
>2. A separator line that consists of repeated equal signs ("=") up until the first difference. A "^" symbol indicates the position of the first difference.
>3. The complete second line.
>
>If either line contains a newline or carriage return character ("\n" or "\r") then the function returns an empty string (since the lines are not single lines and the output format will not make sense to a person reading it).
>
>If the index is not a valid index that could indicate the position of the first difference of the two input lines, the function should also return an empty string (again because the output would not make sense otherwise).  It must therefore be between 0 and the length of the shorter line. Note that you do not need to check whether the index actually identifies the correct location of the first difference, as that should have been computed correctly prior to calling this function.
>
>Here is the signature of the `singleline_diff_format` function:
