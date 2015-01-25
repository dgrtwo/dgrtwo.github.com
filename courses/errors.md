---
layout: page
title: "R Error Message Cheat Sheet"
description: "A reference for some of the most common and simplest error messages in R."
category: r
tags: [r, lesson]
---

An error shows up in red in your RStudio terminal. Here are some of the most common errors and how to fix them:

    Error: object 'foo' not found

(Where `foo` is any name). You tried to access a variable that doesn't exist. You might have

* misspelled the variable name
* incorrectly capitalized the variable name (R is case sensitive!)
* forgotten to run the line that defines the variable in the first place, or
run into an error on that line.

<!-- end the list -->

    Error: could not find function "foo"
    
(Where `foo` is any name). You tried to use a function (like `foo(bar)`) that doesn't exist. You might have:

* misspelled the function name
* incorrectly capitalized the function name
* forgotten to load the library that provides this function. For example, before you use `as.data.table`, you have to load the `data.table` library with `library("data.table")`.
* accidentally put a variable name before an open parentheses, perhaps meaning to perform multiplication. For instance, writing `foo (bar + 1)` when you mean `foo * (bar + 1)`. R doesn't treat these parentheses as implicit multiplication: it attempts to find a function called `foo` (which doesn't exist).

<!-- end the list -->

    Error: unexpected ')' in...

There is an extra end parenthesis in your line (it's easy to lose track of these once they start getting nested). Count and make sure that you have one close parenthesis for each open parenthesis. (The same goes for `unexpected ']'`, `unexpected '}'` and similar errors).

    Error: unexpected symbol in...

The most common cause of this is forgetting a punctuation mark such as a comma: for example, `foo(bar1 bar2)` instead of `foo(bar1, bar2)`. `Error: unexpected numeric constant` is similar: it just means the value after the missing punctuation is a number (for example, `x 2` instead of `x = 2`).

    +

You might see a `+` sign in the interpreter after you hit return. This means the previous statement is unfinished: it might have an open parenthesis that never closes, an open `"` or `'` that is unmatched, or it could end with an operator like `+` or `-` that expects the line to continue afterwards. Hit the `esc` key to cancel this line, then find the problem with your previous line (count parentheses, and check your quotes) and fix it. 
