---
layout: page
title: "Tidy data analysis in R with dplyr, ggplot2, and broom"
description: "Tidy data tutorial for UP-STAT 2016."
category: r
tags: [r, lesson]
---

Welcome to the webpage for the UP-STAT 2016 Tutorial: **Tidy data analysis in R with dplyr, ggplot2, and broom**.

Setup
----------------

You'll need to install:

* **Install the latest version of R** (3.2.4), which can be done [here](http://lib.stat.cmu.edu/R/CRAN/). If you already have R installed, make sure your version is at least 3.2.0: if it's not, upgrade!
* **Install RStudio**, which can be found [here](http://www.rstudio.com/).

You'll need to install several R packages, which you can do in R with:

    install.packages(c("ggplot2", "dplyr", "tidyr", "broom"))

Links
----------------

* [Live Code Feed](https://www.dropbox.com/s/14wyykcgpd3cvrs/upstat-code.txt?dl=0)
* [R Error Message Cheat Sheet](/courses/errors): contains some common R error messages. If you get an error while running a line that you expect to work (perhaps because you saw it on the screen), you can check these examples. (In particular, check your spelling and capitalization carefully).
* [Data Wrangling Cheat Sheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf): this sheet is a great summary of dplyr and tidyr operations, two packages used today.

Other Resources
----------------
* [Resources for future learning](/RData/resources/) A page of additional resources for learning R

Relevant Code
---------------

We'll be studying a set of United Nations voting data that can be found here:

* Anton Strezhnev; Erik Voeten, 2013, "United Nations General Assembly Voting Data", <a href="http://hdl.handle.net/1902.1/12379">hdl:1902.1/12379</a> UNF:5:s7mORKL1ZZ6/P3AR5Fokkw== Erik Voeten [Distributor] V7 [Version]

You can download it using the following line of code:

    load(url("http://varianceexplained.org/courses/upstat/RawVotingdata.RData"))
