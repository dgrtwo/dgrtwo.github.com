---
layout: page
title: "Data Analysis and Visualization Using R (WS1014)"
description: "Data Analysis and Visualization Using R Course Website"
category: r
tags: [r, lesson]
---

Welcome to Wintersession 1014, **Data Analysis and Visualization Using R**. The course takes place on **Mon/Wed/Fri 1/26-30, from 1:30-3 PM, in McCosh 10.** Please make sure to complete the following *before* coming to lecture:

* Bring a **fully charged laptop**,
* **Install the latest version of R** (3.1.2), which can be done [here](http://lib.stat.cmu.edu/R/CRAN/). If you already have R installed, make sure your version is the newest one (3.1.2), and if it's not, upgrade!
* **Install RStudio**, which can be found [here](http://www.rstudio.com/). *Make sure you can open the application,* and have it ready at the start of the session.

Course Evaluation
----------------

* [Course Evaluation](https://docs.google.com/forms/d/1H7xHmuouSTkyh-8CAbRWxsKCeH9PlQAjKAOn8h5JrbU/viewform?usp=send_form): Completely anonymous; takes 2-4 minutes. **Please take it!**

R Live Feed
----------------
Ended up a few lines behind? Want to check that your spelling of the last line was correct? No problem: these pages contain the live contents of the files that are being written and executed on the screen. They're synced by Dropbox and may take a few seconds to get up to date.
 
* [Lesson 1: Variables and Data Structures (Monday)](https://www.dropbox.com/s/iguarzrdlr4hvqm/WS1014_Lesson1.R?dl=1):
* [Lesson 2: Visualizing Data Using ggplot2 (Wednesday)](https://www.dropbox.com/s/uildugxebs4p7l6/WS1014_Lesson2.txt?dl=0)
* [Lesson 3: Exploratory Data Analysis Using dplyr](https://www.dropbox.com/s/qfc3hae5c1m38xb/WS1014_Lesson3.txt?dl=0)

Important Links
---------------

* [Piazza](http://piazza.com/princeton/other/wintersession1014): Use this (requires registration) to ask questions with our co-instructor, Dima Gorenshteyn, during the session
* [Attendance](http://goo.gl/forms/ydbLyuoOyz): Please enter your netID, along with the "codeword" given, at the start of each session
* [R Error Message Cheat Sheet](/courses/errors): contains some common R error messages. If you get an error while running a line that you expect to work (perhaps because you saw it on the screen), check these examples before you go to the Google docs. (In particular, check your spelling and capitalization carefully).
* [My online course](/RData/) A free online course I developed that includes videos and code transcripts for the material covered in this workshop and more
* [Resources for future learning](/RData/resources/) A page of additional resources for learning R

Relevant Code
---------------

**Lecture 3**: We'll be studying a set of United Nations voting data that can be found here:

* Anton Strezhnev; Erik Voeten, 2013, "United Nations General Assembly Voting Data", <a href="http://hdl.handle.net/1902.1/12379">hdl:1902.1/12379</a> UNF:5:s7mORKL1ZZ6/P3AR5Fokkw== Erik Voeten [Distributor] V7 [Version]

You can download it using the following line of code:

    load(url("http://varianceexplained.org/courses/WS1015/files/undata-213.RData"))

Note that the codebook with the description of the data can be found [here](http://thedata.harvard.edu/dvn/dv/Voeten/faces/study/StudyPage.xhtml?globalId=hdl:1902.1/12379).
