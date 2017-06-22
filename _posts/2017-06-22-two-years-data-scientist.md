---
layout: post
title: "Two years as a Data Scientist at Stack Overflow"
description: "Looking back at my second year at the first job I've had outside academia."
date: 2017-06-22 15:00:00 -0400
category: r
tags: [r, statistics, work, education]
comments: true
---

Last Friday marked my two year anniversary working as a data scientist at Stack Overflow. At the end of my first year [I wrote a blog post about my experience](http://varianceexplained.org/r/year_data_scientist/), both to share some of what I'd learned and as a form of self-reflection. 

After another year, I'd like to revisit the topic. While my first post focused mostly on the transition from my PhD to an industry position, here I'll be sharing what has changed for me in my job in the last year, and what I hope the next year will bring.

### Hiring a Second Data Scientist

In [last year's blog post](http://varianceexplained.org/r/year_data_scientist/), I noted how difficult it could be to be the only data scientist on a team:

> Most of my current statistical education has to be self-driven, and I need to be very cautious about my work: if I use an inappropriate statistical assumption in a report, it’s unlikely anyone else will point it out.

This continued to be a challenge, and fortunately in December we hired our second data scientist, Julia Silge.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I have some very exciting news! I am joining the data team at <a href="https://twitter.com/StackOverflow">@StackOverflow</a>. ✨📊✨📊✨</p>&mdash; Julia Silge (@juliasilge) <a href="https://twitter.com/juliasilge/status/808671275597971456">December 13, 2016</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

We started hiring for the position in September, and there were a lot of terrific candidates I got to meet and review during the application and review process. But I was particularly excited to welcome Julia to the team because we'd been working together during the course of the year, ever since [we met and created the tidytext package at the 2016 rOpenSci unconference](https://juliasilge.com/blog/i-went-to-ropensci/).

Julia, like me, works on analysis and visualization rather than building and productionizing features, and having a second person in that role has made our team much more productive. This is not just because Julia is an exceptional colleague, but because the two of us can now collaborate on statistical analyses or split them up to give each more focus. I did enjoy being the first data scientist at the company, but I'm glad I'm no longer the only one. Julia's also a skilled writer and communicator, which was essential in achieving the next goal.


### Company blog posts

In last year's post, I shared some of the work that I'd done to explore the landscape of software developers, and set a goal for the following year (emphasis is new):

> I’m also just intrinsically pretty interested in learning about and visualizing this kind of information; it’s one of the things that makes this a fun job. **One plan for my second year here is to share more of these analyses publicly.** In a previous post [looked at which technologies were the most polarizing](http://varianceexplained.org/r/polarizing-technologies/), and I’m looking forward to sharing more posts like that soon.

I'm happy to say that we've made this a priority in the last six months. Since December I've gotten the opportunity to write a [number of posts for the Stack Overflow company blog](https://stackoverflow.blog/authors/drobinson/):

* [How Do Software Developers in New York, San Francisco, London and Bangalore Differ?](https://stackoverflow.blog/2016/11/30/how-do-developers-in-new-york-san-francisco-london-and-bangalore-differ/)
* [Developers, Webmasters, and Ninjas: What’s in a Job Title?](https://stackoverflow.blog/2016/12/20/developers-webmasters-and-ninjas-whats-in-a-job-title/)
* [Developers Without Borders: The Global Stack Overflow network](https://stackoverflow.blog/2017/01/30/developers-without-borders-the-global-stack-overflow-network/)
* [How Do Students Use Stack Overflow?](https://stackoverflow.blog/2017/02/15/how-do-students-use-stack-overflow/)
* [Does Anyone Actually Visit Stack Overflow’s Home Page?](https://stackoverflow.blog/2017/03/09/anyone-actually-visit-stack-overflows-home-page/)
* [What Programming Languages Are Used Late at Night?](https://stackoverflow.blog/2017/04/19/programming-languages-used-late-night/)
* [Introducing Stack Overflow Trends](https://stackoverflow.blog/2017/05/09/introducing-stack-overflow-trends/)
* [Exploring the State of Mobile Development with Stack Overflow Trends](https://stackoverflow.blog/2017/05/16/exploring-state-mobile-development-stack-overflow-trends/)
* [Stack Overflow: Helping One Million Developers Exit Vim](https://stackoverflow.blog/2017/05/23/stack-overflow-helping-one-million-developers-exit-vim/)
* [Developers Who Use Spaces Make More Money Than Those Who Use Tabs](https://stackoverflow.blog/2017/06/15/developers-use-spaces-make-money-use-tabs/)

Other members of the team have written data-driven blog posts as well, including:

* [The Changing Landscape of Programming Technologies](https://www.stackoverflowbusiness.com/blog/the-changing-landscape-of-programming-technologies) (Kevin Montrose)
* [Benefits for Developers from San Francisco to Sweden](https://stackoverflow.blog/2017/01/16/benefits-for-developers-from-san-francisco-to-sweden/) (Julia Silge)
* [Women in the 2016 Stack Overflow Survey](https://stackoverflow.blog/2017/01/19/women-in-the-2016-stack-over-survey/) (Julia Silge)
* [What Programming Languages Are Used Most on Weekends?](https://stackoverflow.blog/2017/02/07/what-programming-languages-weekends/) (Julia Silge)
* [Developer Hiring Trends in 2017](https://stackoverflow.blog/2017/03/09/developer-hiring-trends-2017/) (Alyssa Mazzina and Julia Silge)
* [And the Most Realistic Developer in Fiction is...](https://stackoverflow.blog/2017/03/28/realistic-developer-fiction/) (Julia Silge)
* [A Dive Into Stack Overflow Jobs Search](https://medium.com/@aurelien.gasser/a-dive-into-stack-overflow-jobs-search-62bc6e628f83) (Aurélien Gasser)
* [New Kids on the Block: Understanding Developers Entering the Workforce Today](https://stackoverflow.blog/2017/06/12/new-kids-block-understanding-developers-entering-workforce-today/) (Julia Silge)

I've really enjoyed sharing these snapshots of the software developer world, and I'm looking forward to sharing a lot more on the blog this next year.

### Teaching R at Stack Overflow

Last year I mentioned that part of my work has been developing data science architecture, and trying to spread the use of R at the company.

> This also has involved building R tutorials and writing “onboarding” materials... My hope is that as the data team grows and as more engineers learn R, this ecosystem of packages and guides can grow into a true internal data science platform.

At the time, R was used mostly by three of us on the data team (Jason Punyon, Nick Larsen, and me). I'm excited to say it's grown since then, and not just because of my evangelism.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">&quot;I&#39;ve been thinking of switching to R, do you have any opinions on that?&quot; he asked me at lunch, ill-advisedly</p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/836999545838059520">March 1, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Every Friday since last September, I've met with a group of developers to run internal "R sessions", in which we analyze some of our data to develop insights and models. Together we've made discoveries that have led to real projects and features, for both the Data Team and other parts of the engineering department.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Every Friday for six months we&#39;ve been doing internal <a href="https://twitter.com/hashtag/rstats?src=hash">#rstats</a> lessons for <a href="https://twitter.com/StackOverflow">@StackOverflow</a> devs. In the last two sessions we made this! <a href="https://t.co/M4duFAmolC">pic.twitter.com/M4duFAmolC</a></p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/840336041227759621">March 10, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

There are about half a dozen developers who regularly take part, and they all do great work. But I especially appreciate [Ian Allen](https://www.linkedin.com/in/ianallen2) and [Jisoo Shin](https://www.linkedin.com/in/jshin91) for coming up with the idea of these sessions back in September, and for following through in the months since. Ian and Jisoo joined the company last summer, and were interested in learning R to complement their development of product features. Their curiosity, and that of others in the team, has helped prove that data analysis can be a part of every engineer's workflow.

### Writing production code

My relationship to production code (the C# that runs the actual Stack Overflow website) has also changed. In my first year I wrote much more R code than C#, but in the second I've stopped writing C# entirely. (My last commit to production was more than a year ago, and I often go weeks without touching my Windows partition). This wasn't really a conscious decision; it came from a gradual shift in my role on the engineering team. I'd usually rather be analyzing data than shipping features, and focusing entirely on R rather than splitting attention across languages has been helpful for my productivity.

Instead, I work with engineers to implement product changes based on analyses and push models into production. One skill I've had to work on is writing technical specifications, both for data sources that I need to query or models that I'm proposing for production. One developer I'd like to acknowledge specifically [Nick Larsen](https://twitter.com/fody), who works with me on the Data Team. Many of the blog posts I mention above answer questions like "[What tags are visited in New York vs San Francisco](https://stackoverflow.blog/2016/11/30/how-do-developers-in-new-york-san-francisco-london-and-bangalore-differ/)", or ["What tags are visited at what hour of the day"](https://stackoverflow.blog/2017/04/19/programming-languages-used-late-night/), and these wouldn't have been possible without Nick. Until recently, this kind of traffic data was very hard to extract and analyze, but he developed processes that extract and transform the data into more readily queryable tables. This has many important analyses possible besides the blog posts, and I can't appreciate this work enough.

(Nick also recently wrote an awesome post, [How to talk about yourself in a developer interview](https://stackoverflow.blog/2017/04/27/how-to-talk-about-yourself-in-an-interview/?utm_content=buffer74fe2&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer), that's worth checking out).

### Working with other teams

Last year I mentioned that one of my projects was developing targeting algorithms for Job Ads, which match Stack Overflow visitors with jobs they may be interested in (such as, for example, matching people who visit Python and Javascript questions with Python web developer jobs). These are an important part of our business and still make up part of my data science work. But I learned in the last year about a lot of components of the business that data could help more with.

One team that I've worked with that I hadn't in the first year is Display Ads. Display Ads are separate from job ads, and are purchased by companies with developer-focused products and services.

![](https://www.dropbox.com/s/tifcvrbe5jqroc0/adtypes.png?dl=1)

For example, I've been excited to work closer with [Steve Feldman](https://twitter.com/stevvve) on the Display Ad Operations team. If you're wondering why I'm not ashamed to work on *ads*, please read Steve's [blog post on how we sell display ads at Stack Overflow](https://stackoverflow.blog/2016/10/26/why-stack-overflow-doesnt-care-about-ad-blockers/)- he explains it better than I could. We've worked on several new methods for display ad targeting and evaluation, and I think there's a lot of potential for data to have a postive impact for the company.

### Changes in the rest of my career

There've been other changes in my second year out of academia. In my first year, I attended only one conference ([NYR 2016](http://www.rstats.nyc/2016)) but I've since had more of a chance to travel, including to [useR and JSM 2017](http://varianceexplained.org/r/user-jsm-conferences/), PLOTCON, rstudio::conf 2017, and [NYR 2017](http://varianceexplained.org/r/nyr-conference/). I spoke at a few of these, about my [broom package](https://www.youtube.com/watch?v=eM3Ha0kTAz4), about [gganimate](https://www.youtube.com/watch?v=9Y7Y1s4-VdA) and about [the history of R as seen by Stack Overflow](https://www.youtube.com/watch?v=WEwFckGPRzU).

Julia and I wrote and published an O'Reilly book, Text Mining with R (now [available on Amazon](https://www.amazon.com/Text-Mining-R-Tidy-Approach/dp/1491981652) and [free online here](http://tidytextmining.com/)). I also self-published an e-book, [Introduction to Empirical Bayes: Examples from Baseball Statistics](http://varianceexplained.org/r/empirical-bayes-book/), based on a [series of blog posts](http://varianceexplained.org/r/simulation-bayes-baseball/). I really enjoyed the experience of turning blog posts into a larger narrative, and I'd like to continue doing so this next year.

There are some goals I didn't achieve. I've had a longstanding interest in getting R into production (and we've idly investigated some approaches like Microsoft R Server), but as of now we're still productionizing models by rewriting them in C#. And there are many teams at Stack Overflow that I'd like to give better support to- prioritizing the Data Team's time has been a challenge, though having a second data scientist has helped greatly. But I'm still happy with how my work has gone, and excited about the future.

In any case, this made the whole year worthwhile:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Easily my favorite thing to come out of the Trump Twitter analysis was <a href="https://twitter.com/nypost">@nypost</a> calling <a href="https://twitter.com/StackOverflow">@StackOverflow</a> &quot;a Q&amp;A site for egghead programmers&quot; <a href="https://t.co/0xrYkM2OOU">pic.twitter.com/0xrYkM2OOU</a></p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/794592545821130752">November 4, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
