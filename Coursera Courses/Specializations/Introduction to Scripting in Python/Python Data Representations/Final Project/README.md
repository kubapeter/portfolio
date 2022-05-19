# Final Project: Plagiarism Detector


# The original project: File Differences

## Problem 1: Finding the first difference between two lines

>First, you will write a function called `singleline_diff` that takes two single line strings. You may assume that both strings are always a single line and do not contain any newline characters. The function should return the index of the first character that differs between the two lines.  If the lines are the same, the function should return the constant `IDENTICAL`, which is already defined to be `−1` in the provided template file.
>
>If the lines are different lengths, but the entire shorter line matches the beginning of the longer line, then the first difference is located at the index that is one past the last character in the shorter line. In other words, no character after the end of the shorter line is defined to be different than whatever character exists in the longer line at that location.
