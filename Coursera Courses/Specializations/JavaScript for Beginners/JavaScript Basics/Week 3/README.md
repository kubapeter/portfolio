<a href="../">
  <img src="/img/JavaScript_Basics_logo.avif" width="120" align="right">
</a>

# Week 3 <br> Using JavaScript in the Web Browser

## Learning Objectives
- Identify the DOM and the relationships between elements on a web page.
- Use document methods to access and change the DOM.
- Use element properties to change the DOM.
- Use the inspector in the browser to identify changes and troubleshoot problems.
- Use event listeners and event properties to capture events.
- Modify the DOM based on events captured.
- Use the inspector to identify effects the program has on the web page.
- Recognize and identify variable scope in JavaScript.
- Develop coding best practices to keep score from creating programming errors.
- Capture user events.
- Change the DOM based on user events.
- Employ appropriate logical flow control structures necessary to make the program function properly.
- Use array and variables to manage program data.
- Apply best practices to manage variable scope.
- Identify and fix errors in programs, when they are not running properly.

## Subjects covered
- Document Object Model
- nodes, `.firstChild`, `.nextSibling`, `.childNodes[1]`, `.parentNode`, etc. 
- `.getElementById()`, `.getElementsByTagName()`, `.getElementByClassName()`
- `.querySelector()`, `.querySelectorAll()`
- `.innerHTML`, `.className`, `.setAttribute()`
- Events
- `.createElement()`, `.createTextNode()`, `.appendChild()`, `.removeChild()`
- `.onclick`, `addEventListener()`, `'click'`, `'mouseover'`, `'mouseout'`, `'scroll'`, `'resize'`, `'keydown'`
- `event` object, `.target`. `.preventDefault()`
- Scope
- without `var` the variable is automaticly global
- to avoid global scope
  - wrap into an immediately invoked function expression `( function() {...} () );` or `(function doStuff() {...}) ();`
  - `"use strict";` (it's a "directive") forces to write out `var`
  - `const` does not let reassigning value and `let` blocks the scope of the variable
  - use `const` if possible, and if not, use `let` 
- hoisting

## Coding practice

For week 3 there are 
- [14 challenges](./Challenges)  
- [2 activities](./Activities)  
