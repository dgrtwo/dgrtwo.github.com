---
layout: page
title: "Statistical Programming with R Workshop"
description: "Course Website"
category: r
tags: [r, lesson]
---

Welcome to Statistical Programming with R. Please make sure to complete the following *before* coming to lecture:

* Bring a **fully charged laptop**,
* **Install the newest version of R**, which can be done [here](http://lib.stat.cmu.edu/R/CRAN/). Your version should be 3.1: previous versions may lead to unexpected behavior.
* **Install RStudio**, which can be found [here](http://www.rstudio.com/). *Make sure you can open the application,* and have it ready at the start of the session.


Important Links
---------------
* [Course Evaluation](http://goo.gl/forms/bOij6K3bEA) **Please** fill this out after the course- this evaluation is essential to designing future R workshops.
* [R Live Feed](https://dl.dropboxusercontent.com/s/pyes8fk81y9q5dl/10_13_2014_Rlesson2.R?dl=0) Ended up a few lines behind? Want to check that your spelling of the last line was correct? No problem: this page contains the live contents of `session2.R`, the file that's being written and executed on the screen. It is synced by Dropbox and may take a few seconds to get up to date.
* [R Error Message Cheat Sheet](/pages/errors/): contains some common R error messages. If you get an error while running a line that you expect to work (perhaps because you saw it on the screen), check these examples before you go to the Google docs. (In particular, check your spelling and capitalization carefully).
* [My online course](/RData/) A free online course I developed that includes videos and code transcripts for the material covered in this workshop and more
* [Resources for future learning](/RData/resources/) A page of additional resources for learning R

Relevant Code
---------------

We'll be studying a set of United Nations voting data that can be found here:

* Anton Strezhnev; Erik Voeten, 2013, "United Nations General Assembly Voting Data", <a href="http://hdl.handle.net/1902.1/12379">hdl:1902.1/12379</a> UNF:5:s7mORKL1ZZ6/P3AR5Fokkw== Erik Voeten [Distributor] V7 [Version]

You can download it using the following line of code:

    load(url("http://dgrtwo.github.io/files/undata-213.RData"))

And load the descriptions dataset with:

    load(url("http://dgrtwo.github.io/files/descriptions-213.RData"))
