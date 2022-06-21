-- Strings, arrays, and rows

SELECT string_to_array('Hello world', ' ');

SELECT unnest(string_to_array('Hello world', ' '));
