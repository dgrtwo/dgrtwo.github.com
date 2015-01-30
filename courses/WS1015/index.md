---
layout: page
title: "Intermediate Data Science Using R (WS1015)"
description: "Intermediate Data Science Using R Course Website"
category: r
tags: [r, lesson]
---

Welcome to Wintersession 1015, **Intermediate Data Science Using R**. The course takes place from **1/26-30, 11AM-12PM, in McCosh 4**.

Please make sure to complete the following *before* coming to lecture:

* Bring a **fully charged laptop**,
* **Install the latest version of R** (3.1.2), which can be done [here](http://lib.stat.cmu.edu/R/CRAN/). If you already have R installed, make sure your version is **at least 3.1.2**.
* **Install RStudio**, which can be found [here](http://www.rstudio.com/). *Make sure you can open the application,* and have it ready at the start of the session.

Course Evaluation
----------------

* [Course Evaluation](https://docs.google.com/forms/d/1aq9LmPZYnSymkpLOWXCJpA3C0b7cKnEHUPhArzQzXds/viewform?usp=send_form): Completely anonymous; takes 2-4 minutes. **Please take it!**

R Live Feed
---------------
Ended up a few lines behind? Want to check that your spelling of the last line was correct? No problem: these pages contain the live contents of the file that's being written and executed on the screen. They are synced by Dropbox and may take a few seconds to get up to date. They'll be left up after the class as a record of the code used.

* [Lecture 1: Tidy Data Manipulation I (Monday)](https://www.dropbox.com/s/gjz5j61jpldktpy/WS1015_Lesson1.R?dl=1)
* [Lecture 2: Tidy Data Manipulation II (Wednesday)](https://www.dropbox.com/s/p16kvtdfx8ob69y/WS1015_Lesson2.txt?dl=0)
* [Lecture 3: Tidy Data Manipulation III (Thursday)](https://www.dropbox.com/s/l5nbmxdv2ujp6e8/WS1015_Lesson3.txt?dl=0)
* **Lecture 4: Reproducible Research Using knitr (Friday)**:
  * [code](https://www.dropbox.com/s/zfrm4rwy9msz64t/WS1015_Lesson4.Rmd?dl=0)
  * [html output](https://www.dropbox.com/s/90r0nydzo8ksn68/WS1015_Lesson4.html?dl=0)
  * [pdf output](https://www.dropbox.com/s/9xt6040ehrq2lpz/WS1015_Lesson4.pdf?dl=0)
* [Lecture 5: Web scraping with rvest](https://www.dropbox.com/s/b3mzvrd78t8xl9a/WS1015_Lecture_5.txt?dl=0)

R Lecture Notes
---------------

These notes go over the code and figures used in the lectures. Note that they're written to guide my lectures rather than to learn from by themselves. (There is also no guarantee that these notes will be available for all lectures).

* [Lecture 1 Notes](notes/WS1015_Lecture_1.pdf)

Syllabus
---------------

**NOTE: Due to the blizzard, Tuesday's lecture was canceled. The second lecture will instead be given Wednesday; I am still working on scheduling the remaining classes.**

While you're encouraged to attend every session, you may be able to skip a session that you're particularly familiar with. Similarly, if you have friends that are interested in one topic, but not others, they should feel free to visit just that one session (I won't tell if you don't).

* **Monday: Tidy Data Manipulation I**: In this class we'll teach the [dplyr](http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html) package for filtering, merging, and manipulating data with concise syntax. This serves as an introduction to the powerful and popular ["tidy data" framework](http://vita.had.co.nz/papers/tidy-data.pdf).
* **Wednesday: Tidy Data Manipulation II**: How do you turn messy data tidy, and how do you keep it that way? We'll learn to use the [tidyr](https://github.com/hadley/tidyr) package to manipulate the structure of data so it can be analyzed using dplyr and plotted using ggplot2. We'll also learn to use the [broom](https://github.com/dgrtwo/broom) package, which takes many kinds of statistical model objects and turns them into tidy data frames that can be manipulated within this framework.
* **TBA: Reproducible Research**: Suppose you've just finished your manuscript, presentation, or homework assignment based on an R analysis. But then you change your R code in a way that **slightly** changes your results- and now you have to go back and replace all of your text, your tables, and your figures- what a hassle! The [knitr](http://yihui.name/knitr/) package solves this, by integrating your code into the same document as your report. [R Markdown](http://rmarkdown.rstudio.com/), meanwhile, lets you format these reports into HTML, PDFs, Word documents, or presentations. You'll have the option of displaying your R code in the document right next to the results (useful for assignments and tutorials) or hiding it (useful for manuscripts and presentations).
* **TBA: Package Development**: Once you've developed some statistical methods in R, you might want to share your code with the larger community. The most powerful way you can share it is as an R package (just like the ones we've learned this week). We'll go over the steps of creating an R package from scratch. You'll start with a basic skeleton using the [devtools](https://github.com/hadley/devtools) package, document your code with [Roxygen2](http://cran.r-project.org/web/packages/roxygen2/index.html), and write unit tests with [testthat](http://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf). We'll then show how to publish your code on GitHub, and go over how one would submit it to CRAN (the official R package network).
* **TBA: Web Scraping**: Not all data that you want to analyze and visualize comes in neat tab-delimited files- some might be on web pages, in the form of tables and text. We'll learn how to use the [rvest](https://github.com/hadley/rvest) package to download and parse ("scrape") this content so it can be analyzed in R, using examples like the [Internet Movie Database](http://www.imdb.com/) (IMDb).

Other Links
----------------

* [Attendance](http://goo.gl/forms/CHR8BUfrZq): Please enter your netID, along with the "codeword" given, at the start of each session
* [R Error Message Cheat Sheet](/courses/errors/): contains some common R error messages. If you get an error while running a line that you expect to work (perhaps because you saw it on the screen), check these examples before you go to the Google docs. (In particular, check your spelling and capitalization carefully).
* [Data Wrangling Cheat Sheet](http://www.rstudio.com/wp-content/uploads/2015/01/data-wrangling-cheatsheet.pdf): this sheet, handed out in Lecture 1, is a great summary of dplyr and tidyr operations.
* [Resources for future learning](/RData/resources/) A page of additional resources for learning R

Relevant Code
---------------

**Lecture 1/2**: We'll be studying a set of United Nations voting data that can be found here:

* Anton Strezhnev; Erik Voeten, 2013, "United Nations General Assembly Voting Data", <a href="http://hdl.handle.net/1902.1/12379">hdl:1902.1/12379</a> UNF:5:s7mORKL1ZZ6/P3AR5Fokkw== Erik Voeten [Distributor] V7 [Version]

You can download it using the following line of code:

    load(url("http://varianceexplained.org/courses/WS1015/files/undata-213.RData"))

And load the descriptions dataset with:

    load(url("http://varianceexplained.org/courses/WS1015/files/descriptions-213.RData"))
