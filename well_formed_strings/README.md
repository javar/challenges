Well-Formed Strings

A string of characters like "({12}[34(56){67}])" is said to be well-formed
if every opening bracket (square, curly, or parentheses) has a matching
close AND the closing bracket comes in the opposite order of the opening.*

* Valid: "({12}[34(56){67}])"
* Invalid "({12)"
* Invalid ""

Write a validator that can determine the well-formed-ness of an input string.