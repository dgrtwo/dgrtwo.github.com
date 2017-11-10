---
layout: post
title: 'Announcing "Introduction to the Tidyverse", my new DataCamp course'
description: 'Introducing my new DataCamp course that teaches ggplot2 and dplyr, and how they relate.'
output: html_document
date: 2017-11-09 14:00:00 -0400
category: r
tags: [r, education]
comments: true
---

For the last few years I've been encouraging a particular approach to R education, [teaching the dplyr and ggplot2 packages first](http://varianceexplained.org/r/teach-tidyverse/) and introducing real datasets early on. This week I'm excited to announce the next step: the release of [Introduction to the Tidyverse](https://www.datacamp.com/courses/introduction-to-the-tidyverse), my new interactive course on the DataCamp platform.

![](https://www.dropbox.com/s/rcug1awxycext2x/Screenshot%202017-11-09%2011.00.06.png?dl=1)

The course is an introduction to the dplyr and ggplot2 packages through an analysis of the [Gapminder dataset](https://github.com/jennybc/gapminder), enabling students to explore and visualize country statistics over time. It's designed so that people can take it even if they have no previous experience in R, or if they've learned some ([like in DataCamp's free introduction](https://www.datacamp.com/courses/free-introduction-to-r)) but aren't familiar with dplyr, ggplot2, or how they fit together.

I've published two DataCamp courses before, [Exploratory Data Analysis: Case Study](https://www.datacamp.com/courses/exploratory-data-analysis-in-r-case-study) (which makes a great followup to this new one) and [Foundations of Probability](https://www.datacamp.com/courses/foundations-of-probability-in-r). But I'm particularly excited about this one because the topic is so important to me. Here I'll share a bit of my thinking behind the course and we made the decisions we did.

### How "Intro to the Tidyverse" started

In early July I was at the useR 2017 conference in Brussels (where I gave a talk on [R's growth as seen in Stack Overflow data](https://channel9.msdn.com/events/useR-international-R-User-conferences/useR-International-R-User-2017-Conference/We-R-What-We-Ask-The-Landscape-of-R-Users-on-Stack-Overflow?term=stack%20overflow)). A lot of the attendees were experienced teachers, and a common theme in my conversations was about whether it made sense to teach tidyverse packages like dplyr and ggplot2 before teaching base R syntax.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">.<a href="https://twitter.com/minebocek?ref_src=twsrc%5Etfw">@minebocek</a> agrees: teach tidyverse to beginners first <a href="https://twitter.com/hashtag/UseR2017?src=hash&amp;ref_src=twsrc%5Etfw">#UseR2017</a> <a href="https://t.co/vxjCjNrDz0">pic.twitter.com/vxjCjNrDz0</a></p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/882602611244900352?ref_src=twsrc%5Etfw">July 5, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

These conversations encouraged me to publish [Teach the tidyverse to beginners](http://varianceexplained.org/r/teach-tidyverse/) that week. But the most notable conversations I had were with [Chester Ismay](http://ismayc.github.io/), who had recently joined DataCamp as a Curriculum Lead, and with the rest of their content team (like Nick Carchedi and Richie Cotton). Chester and I have a lot of alignment in our teaching philosophies, and we realized the DataCamp platform offers a great opportunity to try a tidyverse-first course at a large scale.

The months since have been an exciting process of planning, writing, and executing the course. I enjoyed building my first two DataCamp courses, but this was a particularly thrilling experience, because I grew to realize I'd been planning this course for a while, almost subconsciously. In early October I filmed the video in NYC, and it was released almost four months to the day after Chester and I first had the idea.

### The curriculum

I realized while I was writing [the "teach tidyverse first" post](http://varianceexplained.org/r/teach-tidyverse/) that while I had taught R to beginners with dplyr/ggplot2 about a dozen times in my career (a mix of graduate courses, seminars, and workshops), I hadn't shared my curriculum in any standardized way.[^course] This means the conversation has always been a bit abstract. What exactly do I mean by teaching dplyr first, and when do other programming concepts get introduced along the way?

We put a lot of thought into the ordering of topics. DataCamp courses are divided into four chapters, each containing several videos and about 10-15 exercises.

1. **Data Wrangling**. Learn to do three things with a table: filter for particular observations, arrange the observations in a desired order, and mutate to add or change a column. You'll see how each of these steps lets you answer questions about your data.

2. **Data Visualization**. Learn the essential skill of data visualization, using the ggplot2 package. Visualization and maniuplation are often intertwined, so you'll see how the dplyr and ggplot2 packages work closely together to create informative graphs.

3. **Grouping and summarizing**. We may be interested in aggregations of the data, such as the average life expectancy of all countries within each year. Here you'll learn to use the group by and summarize verbs, which collapse large datasets into manageable summaries.

4. **Types of visualizations**. Learn to create line plots, bar plots, histograms, and boxplots. You'll see how each plot needs different kinds of data manipulation to prepare for it, and understand the different roles of each of these plot types in data analysis.

This ordering is certainly not the only way to teach R. But I like how it achieves a particular set of goals.

* **It not only introduces dplyr and ggplot2, but show how they work together.** This is the reason we alternated chapters in a dplyr-ggplot2-dplyr-ggplot2 order, to appreciate how filtering, grouping, and summarizing data can feed directly into visualizations. This is one distinction between this course and the existing (excellent) [dplyr](https://www.datacamp.com/courses/dplyr-data-manipulation-r-tutorial) and [ggplot2](https://www.datacamp.com/courses/data-visualization-with-ggplot2-1) courses on DataCamp.
* **Get students doing powerful things quickly**. This is a major theme of my [tidyverse-first post](http://varianceexplained.org/r/teach-tidyverse/) and a sort of obsession of mine. The first exercise in the course introduces the gapminder dataset, discussing the data before writing a single line of code. And the last chapter in particular teaches students to create four different types of graphs, and shows how once you understand the grammar of graphics you can make a variety of visualizations.
* **Teach an approach that scales to real projects.** There are hundreds of important topics students don't learn in the course, ranging from matrices to lists to loops. But the particular skills they do learn aren't toy examples or bad habits that need to be unlearned. I do use the functions and graphs taught in the course every day, and Julia Silge and I [wrote a book](http://tidytextmining.com/) using very similar principles.
* **Beginners don't need any previous experience in R, or even in programming**. We don't assume someone's familiar even with the basics in advance, even fundamentals such as variable assignment (assignment is introduced at the start of chapter 2; until then exploration is done interactively). It doesn't hurt to have a course like [Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) under one's belt first, but it's not mandatory.

Incidentally, the course derives a lot of inspiration from the excellent book [R for Data Science](http://r4ds.had.co.nz/) (R4DS), by Hadley Wickham and Garrett Grolemund. Most notably R4DS [also uses the gapminder dataset to teach dplyr](http://r4ds.had.co.nz/transform.html) (thanks to Jenny Bryan's R package it's a bit of a modern classic).[^order] I think the two resources complement each other: some people prefer learning from videos and interactive exercises than from books, and vice versa. Books have an advantage of having space to go deeper (for instance, we don't teach [select](http://r4ds.had.co.nz/transform.html#select-columns-with-select), [grouped mutates](http://r4ds.had.co.nz/transform.html#grouped-mutates-and-filters), or [statistical transformations](http://r4ds.had.co.nz/data-visualisation.html#statistical-transformations)), while courses are useful for having a built-in self-evaluation mechanism. Be sure to check out [this page](https://www.tidyverse.org/learn/) for more resources on learning tidyverse tools.

### What's next

I'm excited about developing my fourth DataCamp course with Chester (continuing my probability curriculum). And I'm particularly interested in seeing how the course is received, and whether people who complete this course continue to succeed in their data science journey.

I have a lot of opinions about R education, but not a lot of data about it, and I'm considering this an experiment to see how the tidyverse-first approach works in a large-scale interactive course. I'm looking forward both to the explicit data that DataCamp can collect, and to hear feedback from students and other instructors. So I hope to hear what you think!

[^course]: The [last online course](http://varianceexplained.org/RData/) I've recorded for beginners, which I recorded in 2014, takes a very different philosophy than I use now, especially in the first chapter.
[^order]: One of the differences is that we introduce the first dplyr operations before introducing ggplot2 (because it's difficult to visualize gapminder data without filtering it first, while R4DS uses a different dataset to teach ggplot2).
