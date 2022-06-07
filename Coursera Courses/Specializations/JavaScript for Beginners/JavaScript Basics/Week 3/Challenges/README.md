# Challenges 

## [Challenge 17](./challenge17.html)

>For each of these challenges, use the start file and add `<script>` tags at the bottom of the page, just before the closing `</body>` tag, and put your JavaScript between those tags.
>
>Save each challenge as challenge17.html, etc.
>
>For this challenge, write a script that gets the text inside the paragraph with the `id` set to `"copyright"` and use the `color` property to change the color of the text to `green`.

## [Challenge 18](./challenge18.html)

>For this challenge, get all the paragraphs on the page, assign them to a variable, then use that variable in a loop to set the `style.color` property to `green`.

## [Challenge 19](./challenge19.html)

>For this challenge, assign the class of `.red` (which is already defined inside the `style` tags at the top of the page) to the `<h1>` in the header and to the date in the second article.

## [Challenge 20](./challenge20.html)

>For this challenge, change the `src` attribute for the first picture in the first article to:
>
>"http://meadpoint.net/images/xmasajax.jpg"
>
>Also add the class `blue` to all the paragraphs in the second article.

## [Challenge 21](./challenge21.html)

>For this challenge, get all the links, then check to see if one of them is set to go to the wikipedia page on llamas, if it is, set the text of that link to "Llamas are cool!"
>
>_Hint_
>
>Use these document methods and properties: 
>
>`.getElementsByTagName();`
>
>`.getAttribute();`
>
>`.innerHTML = "";`
>
>You will have multiple anchor tags to check and you're looking to see if one of them matches, so that should tell you what logical flow control structures you need.

## [Challenge 6](./challenge06.html)

>Update and save the file again, this time as challenge6.html
>
>Notice in challenge 5, if a user types something other than a number, the console tells us they entered a big number. In this challenge, fix that so that if a user types something other than a number, the console displays a message that says there was an error.

## [Challenge 7](./challenge07.html)

>Update and save the file again, this time as challenge7.html
>
>For this challenge, if the user types a number less than 10, use a loop to print out the numbers from zero to 9 in the console.

## [Challenge 8](./challenge08.html)

>Update and save the file again, this time as challenge8.htm 
>
>For this challenge, if the user types a number less than 10, update the loop from the last challenge so that the console indicates the number the user entered.

## [Challenge 9](./challenge09.html)

>Prompt the user for a color, then have the console report if the user typed a primary color (red, blue, or yellow) or a secondary color (orange, green or purple) or none of these. 
>
>Handle the situation for both uppercase and lowercase letters in the color the user types in. 
>
>_Hint: remember the || means 'or'_

## [Challenge 10](./challenge10.html)

>Write a function called `hello()` that outputs a greeting in the console when the function runs.

## [Challenge 11](./challenge11.html)

>For this challenge, change `hello()` so that it takes a parameter, and when you run the function, you pass in the name of a person and the function outputs the greeting to the console.

## [Challenge 12](./challenge12.html)

>This time, add a prompt requesting the user for their name, and assign the result to a variable.
>
>Then pass that variable into the `hello()` function so that the console greets the person by name.

## [Challenge 13](./challenge13.html)

>For this challenge handle the situation that happens if the user clicks cancel on the prompt, or does not enter text in the prompt. 
>
>If the user does one of those two actions, have the `hello()` function log to the console "You didn't give me your name". Otherwise, have the console log the greeting.
>
>_Hint: What do you get if, in challenge 12, you click cancel or put no text in the prompt?_

## [Challenge 14](./challenge14.html)

>For this challenge, update the `hello()` function so that it returns a value rather than outputs directly to the console. 
>
>I used a variable: `var greeting;` and returned that variable at the end of the function. 
>
>Then outside the function write a call to the console that logs the greeting returned by the function.

## [Challenge 15](./challenge15.html)

>For this challenge, add an array of foods and put 3-5 elements in the array. Then make a new function called `hospitality();` after the `hello();` function. 
>
>The new function will take two parameters, a name and a gift, which will be an array. Have this function run the `hello()` function and output the result to the console. Then have it loop through the gift array and offer a gift to the visitor by name and output that to the console.

## [Challenge 16](./challenge16.html)

>For this challenge, add the function that gets random integers from the functions lecture. 
>
>Update the `hospitality()` function so that, instead of looping through the whole array, randomly picks one element from the array and offers that to the user.

