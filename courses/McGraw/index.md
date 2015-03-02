---
layout: page
title: "Statistical Computing with R"
description: "Statistical Computing with R Website"
category: r
tags: [r, lesson]
---

Welcome to *Statistical Computing with R*.

Please make sure to complete the following *before* coming to lecture:

* Bring a **fully charged laptop**,
* **Install the latest version of R** (3.1.2), which can be done [here](http://lib.stat.cmu.edu/R/CRAN/). If you already have R installed, make sure your version is the newest one (3.1.2), and if it's not, upgrade!
* **Install RStudio**, which can be found [here](http://www.rstudio.com/). *Make sure you can open the application,* and have it ready at the start of the session.

R Live Feed
----------------
Ended up a few lines behind? Want to check that your spelling of the last line was correct? No problem: these pages contain the live contents of the files that are being written and executed on the screen. They're synced by Dropbox and may take a few seconds to get up to date.

* [Lesson 2: Data Manipulation with dplyr](https://www.dropbox.com/s/402pummzzal7ouo/2015_3_2_Rlesson.txt?dl=0) (Monday, March 2nd)
* [Lesson 2: Data Manipulation with dplyr](https://www.dropbox.com/s/qcsjaoc5hooxnf3/lesson2_022415.txt?dl=0) (Tuesday, February 24th)
* [Lesson 1: Basic R and Visualization](https://www.dropbox.com/s/nlcfg342eh06efu/lesson1_022315.txt?dl=0) (Monday, February 23rd)
* [Lesson 1: Basic R and Visualization](https://www.dropbox.com/s/qehj8y1v0qlec5y/lesson1.txt?dl=0) (Tuesday, February 17th)

Important Links
---------------

* [R Error Message Cheat Sheet](/courses/errors): contains some common R error messages. If you get an error while running a line that you expect to work (perhaps because you saw it on the screen), check these examples before you go to the Google docs. (In particular, check your spelling and capitalization carefully).
* [My online course](/RData/) A free online course I developed that includes videos and code transcripts for the material covered in this workshop and more
* [Resources for future learning](/RData/resources/) A page of additional resources for learning R

Relevant Code
---------------

**Lecture 2 (Monday, March 2)**:

We'll be analyzing a dataset about movie popularity. It can be downloaded with this line of code:

    load(url("http://varianceexplained.org/courses/McGraw/files/movieStats.Rdata"))

**Lecture 1/2**: We'll be studying a set of United Nations voting data that can be found here:

* Anton Strezhnev; Erik Voeten, 2013, "United Nations General Assembly Voting Data", <a href="http://hdl.handle.net/1902.1/12379">hdl:1902.1/12379</a> UNF:5:s7mORKL1ZZ6/P3AR5Fokkw== Erik Voeten [Distributor] V7 [Version]

You can download it using the following line of code:

    load(url("http://varianceexplained.org/courses/WS1015/files/undata-213.RData"))

And load the descriptions dataset with:

    load(url("http://varianceexplained.org/courses/WS1015/files/descriptions-213.RData"))
