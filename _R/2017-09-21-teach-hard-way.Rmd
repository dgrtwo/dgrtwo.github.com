---
layout: post
title: "Don't teach students the hard way first"
description: 'Discussion of a particular teaching approach that I believe is a mistake.'
output: word_document
date: 2017-09-21 10:00:00 -0400
category: r
tags: [r, education]
comments: true
---

Imagine you were going to a party in an unfamiliar area, and asked the host for directions to their house. It takes you thirty minutes to get there, on a path that takes you on a long winding road with slow traffic. As the party ends, the host tells you "You can take the highway on your way back, it'll take you only ten minutes. I just wanted to show you how much easier the highway is."

Wouldn't you be annoyed? And yet this kind of attitude is strangely common in programming education.

I was recently talking to a friend who works with R and whose opinions I greatly respect. He was teaching some sessions to people in his company who hadn't used R before, where he largely followed my [philosophy on teaching the tidyverse to beginners](http://varianceexplained.org/r/teach-tidyverse/). I agreed with his approach, until he said something far too familiar to me:

> "I teach them dplyr's `group_by`/`summarize` in the second lesson, but I teach them loops first just to show them how much easier dplyr is."

I talk to people about teaching a lot, and that phrase keeps popping up: **"I teach them X just to show them how much easier Y is"**. It's a trap- a trap I've fallen into before when teaching, and one that I'd like to warn others against.

### Students don't share your nostalgia

First, why do some people make this choice? I think because when we teach a class, we accidentally bring in all of our own history and context.

For instance, I started programming with Basic and Perl in high school, then Java in college, then got really into Python, then got even more into R. Along the way I built up habits in each language that had to be painfully undone afterwards. I worked in an object-oriented style in Python, then switched to thinking in data frames and functional operations. I wrote too many loops when I started R, then I grew accustomed to the apply family of functions. Along the way there were thousands of little frustrations and little epiphanies, tragedies and triumphs in microcosm.

But when I'm teaching someone how to use R... **they don't care about any of that.** They weren't there! They didn't make my mistakes, they don't need to be talked out of them. Going back to the party host, perhaps the highway was built only last year, and maybe the host had to talk his friends, stuck in their habits, into taking the highway by explaining how much faster it is. But that doesn't make any difference to the guest, who has never taken either route.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/ucfagls">@ucfagls</a> I think ppl teach base stuff preferentially because it’s what they still use or they’re reliving their own <a href="https://twitter.com/hashtag/rstats?src=hash">#rstats</a> “journey” <a href="https://twitter.com/drob">@drob</a></p>&mdash; Jenny Bryan (@JennyBryan) <a href="https://twitter.com/JennyBryan/status/556218754485321729">January 16, 2015</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

It's true that I learned a lot about programming in the path I described above. I learned how to debug, how to compare programming paradigms, and when to switch from one approach to another. I think some teachers hope that by walking students through this "journey", we can impart some of that experience. But it doesn't work: feeding students two possible solutions in a row is nothing like the experience of them comparing solutions for themselves, and doesn't grant them any of the same skills. Besides which, students will face plenty of choices and challenges as they continue their programming career, without us having to invent artificial ones.

Students should absolutely learn multiple approaches (there's usually advantages to each one). But **not in this order**, from hardest to easiest, and not because it happened to be the order we learned it ourselves.

### Bandwidth and trust

There are two reasons I recommend against teaching a harder approach first. One is educational bandwidth, and one is trust.

One of the most common mistakes teachers make (especially inexperienced ones) is to think they can teach more material than they can.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">.<a href="https://twitter.com/minebocek">@minebocek</a> talks philosophy of Data Carpentry.<br><br>Highlight: don&#39;t take on too much material. Rushing discourages student questions <a href="https://twitter.com/hashtag/UseR2017?src=hash">#UseR2017</a> <a href="https://t.co/txAcSd3ND3">pic.twitter.com/txAcSd3ND3</a></p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/882933155119976449">July 6, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

This comes down to what I sometimes call **educational bandwidth**: the total amount of information you can communicate to students is limited, especially since you need to spend time reinforcing and revisiting each concept. It's not just about the amount of time you have in the lesson, either. Learning new ideas is hard work: think of the headache you can get at the end of a one-day workshop. This means you should make sure every idea you get across is valuable. If you teach them a method they'll never have to use, you're wasting time and energy.

The other reason is **trust**. Think of the imaginary host who gave poor directions before giving better ones. Wouldn't it be unpleasant to be tricked like that? When a student goes through the hard work of learning a new method, telling them "just kidding, you didn't need to learn that" is obnoxious, and hurts their trust in you as a teacher.

In some cases there's a tradeoff between bandwidth and trust. For instance, [as I've described before](http://varianceexplained.org/r/teach-tidyverse/), I teach dplyr and the `%>%` operator before explaining what a function is, or even how to do a variable assignment. This conserves bandwidth (it gets students doing powerful things quickly) but it's a minor violation of their trust (I'm hiding details of how R actually works). But there's no tradeoff in teaching a hard method before an easier one.

### Exceptions

Is there any situation where you might want to show students the hard way first? Yes: one exception is **if the hard solution is something the student would have been tempted to do themselves**.

One good example is in [R for Data Science](http://r4ds.had.co.nz/), by Hadley Wickham and Garrett Grolemund. [Chapter 19.2](http://r4ds.had.co.nz/functions.html#when-should-you-write-a-function) describes "When should you write a function", and gives an example of rescaling several columns by copying and pasting code:

```r
df$a <- (df$a - min(df$a, na.rm = TRUE)) / 
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$b <- (df$b - min(df$b, na.rm = TRUE)) / 
  (max(df$b, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$c <- (df$c - min(df$c, na.rm = TRUE)) / 
  (max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))
df$d <- (df$d - min(df$d, na.rm = TRUE)) / 
  (max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))
```

By showing them what this approach looks like (and even including an intentional typo in the second line, to show how copying and pasting code is prone to error), the book guides them towards the several steps involved in writing a function.

```r
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
```

This educational approach makes sense because copying and pasting code is a habit beginners would fall into naturally, *especially* if they've never programmed before. It doesn't take up any educational bandwidth because students already know how to do it, and it's upfront about it's approach (when I teach this way, I usually use the words "you might be tempted to...").

However, teaching a loop (or `split()`/`lapply()`, or `aggregate`, or `tapply`) isn't something beginners would do accidentally, and it's therefore not something you need to be talking.

In conclusion: **teaching programming is hard, don't make it harder.** Next time you're teaching a course, or workshop, or writing a tutorial, or just helping a colleague getting set up in R, try teaching them your preferred method first, instead of meandering through subpar solutions. I think you'll find that it's worth it.
