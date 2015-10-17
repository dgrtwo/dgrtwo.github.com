---
layout: page
title: "Machine Learning and Computational Journalism"
description: "Machine Learning and Computational Journalism webpage for the Transparency Series at Columbia."
category: r
tags: [r, lesson]
---

Welcome to the webpage for Machine Learning and Computational Journalism.

[Live feed of the on-screen code is here](http://bit.ly/UNvotescode).

Links
----------------

* [R Error Message Cheat Sheet](/courses/errors/): contains some common R error messages. If you get an error while running a line that you expect to work (perhaps because you saw it on the screen), you can check these examples. (In particular, check your spelling and capitalization carefully).
* [Data Wrangling Cheat Sheet](http://www.rstudio.com/wp-content/uploads/2015/01/data-wrangling-cheatsheet.pdf): this sheet is a great summary of dplyr and tidyr operations, two packages used today.
* [Resources for future learning](/RData/resources/) A page of additional resources for learning R

Relevant Code
---------------

We'll be studying a set of United Nations voting data that can be found here:

* Anton Strezhnev; Erik Voeten, 2013, "United Nations General Assembly Voting Data", <a href="http://hdl.handle.net/1902.1/12379">hdl:1902.1/12379</a> UNF:5:s7mORKL1ZZ6/P3AR5Fokkw== Erik Voeten [Distributor] V7 [Version]

You can download it using the following line of code:

    load("http://bit.ly/UNvotes")
