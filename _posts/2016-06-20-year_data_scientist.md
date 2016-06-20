---
layout: post
title: "One year as a Data Scientist at Stack Overflow"
description: "Looking back at a year at my new job, and the transition from academia to industry."
date: 2016-06-20 14:00:00 -0400
category: r
tags: [r, statistics, work, education]
comments: true
---

One day in January 2013 I found myself wasting time on the internet.

This wasn't a good idea: I was as busy as anyone 2.5 years into their PhD. I had to finish a presentation on some yeast genetics research, I was months behind on a paper with an NYU collaborator and even farther behind on some leftover undergraduate research. I was also busy in my personal life- I had returned from a trip to Israel, and had just taken up Brazilian Jiu-Jitsu and jogging.

But this one day I was wasting time by answering [a stranger's question about the beta distribution](http://stats.stackexchange.com/questions/47771/what-is-the-intuition-behind-beta-distribution). The question was on Cross Validated, the statistics sister site of developer Q&A site Stack Overflow. I'd been an active answerer on Stack Overflow for about a year at the time, and a less frequent answerer on Cross Validated: it was certainly my *favorite* way to waste time.

At the time I had the somewhat cute idea to explain the beta distribution in terms of baseball statistics- an answer that would later turn into [this post](http://varianceexplained.org/statistics/beta_distribution_and_baseball/) and [this series](http://varianceexplained.org/r/beta_binomial_baseball/).

![](https://www.dropbox.com/s/sb8mrl9flnirr8a/Screenshot%202016-06-17%2014.07.12.png?dl=1)

I did a lot in my PhD that I am proud of, and I did a lot more that was forgettable or unimportant. But in terms of the effect on my career, that answer is the work that I'm happiest about.

### One year at Stack Overflow

Last Thursday (June 16th) marks my one-year anniversary of working at Stack Overflow as a Data Scientist.

I'd finished my PhD about a month before I joined, and my move to a tech company was a pretty big change for me. As of only a few months earlier, I'd been planning to stay in academic research, particularly in the field of computational biology. I'd started applying for postdoctoral fellowships, and hadn't even considered applying to "industry" jobs.

What changed my mind? It started in January 2015, when Jason Punyon found my (then two-year-old) post about the beta distribution:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Why I love working at <a href="https://twitter.com/StackExchange">@StackExchange</a> reason #14785: We get awesome answers to questions like this one: <a href="http://t.co/NkgvYHMEAy">http://t.co/NkgvYHMEAy</a> Thanks <a href="https://twitter.com/drob">@drob</a></p>&mdash; JSONP (@JasonPunyon) <a href="https://twitter.com/JasonPunyon/status/552846973762813954">January 7, 2015</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/drob">@drob</a> P.S. I know we aren&#39;t as exciting as finishing your PhD but if you want an interview here at Stack you can have one :)</p>&mdash; JSONP (@JasonPunyon) <a href="https://twitter.com/JasonPunyon/status/552877562234679297">January 7, 2015</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

At the time I was pretty certain I was entering academia, but I didn't want to pass up the chance to check out the Stack Exchange offices and meet some of the people behind the product. It took basically one visit to the office for me to change my mind, and a few weeks and interviews later I was offered the position and signed.

### Some things I've been working on

People know what web developers do, but what does a data scientist do? ([I'm not the only person who gets asked that](http://www.wsj.com/articles/what-data-scientists-do-all-day-at-work-1457921541)).

The following aren't the only projects I'm working on, but they may give a sense of what I've been up to.

#### Designing, developing and testing machine learning features

The most prominent example of where machine learning is used in our product is [Providence; our system for matching users to jobs they'll be interested in](https://kevinmontrose.com/2015/02/04/providence-matching-people-to-jobs/). (For example, if you visit mostly Python and Javascript questions on Stack Overflow, you'll end up getting Python web development jobs as advertisements). I work with engineers on the Data team ([Kevin Montrose](https://kevinmontrose.com/), [Jason Punyon](http://jasonpunyon.com/), and [Nick Larsen](http://stackoverflow.com/users/178082/nick-larsen)) to design, improve and implement these machine learning algorithms. ([Here's some more about the architecture of the system, built before I joined](http://jasonpunyon.com/blog/2015/02/10/providence-architecture-and-performance/)). For example, we've worked to get the balance right between jobs that are close to a user geographically and jobs that are well-matched in terms of technology, and ensuring that users get a variety of jobs rather than seeing the same ones over and over.

A lot of this process involves designing and analyzing A/B tests, particularly about changing our targeting algorithms, ad design, and other factors to improve clickthrough rate (CTR). This process is more statistically interesting than I'd expected, in some cases letting me find new uses for methods I'd used to analyze biological experiments, and in other cases encouraging me to learn new statistical tools. In fact, much of my [series on applying Bayesian methods to baseball batting statistics](http://varianceexplained.org/r/beta_binomial_baseball/) is actually a thinly-veiled version of methods I've used to analyze CTR across ad campaigns.

#### Learning cool things

I'm not an academic scientist any more, but that doesn't mean I'm not interested in drawing conclusions from data. Stack Overflow has a birds-eye view of the software development ecosystem- millions of questions, users, and daily visitors. What can we learn from all that data?

For starters, by looking at how tags are used together, we can find natural clusters of technologies[^clustercode]:

![](http://varianceexplained.org/images/network1.png)

This lets us automatically categorize frameworks and packages into the higher-level languages and clusters they belong to, all without manual annotation.

But it really shows us only how tags co-appear on specific programming questions, not how they're used in the same projects (for example, C# and SQL Server may not always appear on the same questions, but they're often used as part of the same technology stack). For that, I might look at another source of data, Stack Overflow Careers profiles, and see which technologies tend to be used by the same developers:

![](http://varianceexplained.org/images/network2.jpeg)

I like how this divides the tags not just by strict categories, but by "technology ecosystems." This kind of understanding isn't limited to programming technologies. The Stack Exchange network contains a vast range of Q&A sites. By looking at which communities tend to have the same active members, we can similarly create a network of how our sites are interrelated:

![](http://varianceexplained.org/images/network3.png)

(Not everything I do is networks, just some of the examples that are more interesting at a glance).

Why spend time on analyses like these? Sometimes they can contribute directly to product features. For example, understanding clusters of technologies quantitatively lets us improve our model of [developer types](https://kevinmontrose.com/2015/01/27/providence-machine-learning-at-stack-exchange/) that drives the Providence targeting. Other insights can be valuable from a business perspective. I've worked a bit with the sales, marketing, and community teams to interpret their data and help make decisions.

But I'm also just intrinsically pretty interested in learning about and visualizing this kind of information; it's one of the things that makes this a fun job. One plan for my second year here is to share more of these analyses publicly. In a previous post [I looked at which technologies were the most polarizing](http://varianceexplained.org/r/polarizing-technologies/), and I'm looking forward to sharing more posts like that soon.

#### Developing data science architecture (internal R packages)

I like using R to learn interesting things about our data, but my longer term goal is to make it easy for any of our engineers to do so. When I joined I was the first person at the company who used R, but it's been spreading in the year since. R is just a *really great way* to engage with data directly and to answer interesting questions. (It makes me sad when brilliant software engineers open up Excel to make a line graph!)

Towards this goal, I've been focusing on building reliable tools and frameworks that people can apply to a variety of problems, rather than "one-off" analysis scripts. (There's an [awesome post by Jeff Magnusson at StitchFix](http://multithreaded.stitchfix.com/blog/2016/03/16/engineers-shouldnt-write-etl/) about some of these general challenges). My approach has been building **internal R packages**, similar to [AirBnb's strategy](https://medium.com/airbnb-engineering/using-r-packages-and-education-to-scale-data-science-at-airbnb-906faa58e12d#.nd6f8ay5i) (though our data team is quite a bit younger and smaller than theirs). These internal packages can query databases and parsing our internal APIs, including making various security and infrastructure issues invisible to the user.

This also has involved building R tutorials and writing "onboarding" materials. As an example, [I've made public a tutorial](http://rpubs.com/dgrtwo/190325) that introduces the internal **sqlstackr** package for querying our databases.[^ifyouwork] This doubles as a general dplyr/tidyr/ggplot2 introduction, which I find more useful than linking a developer to a general dplyr tutorial (since this is data my colleagues are sure to be interested in!) My hope is that as the data team grows and as more engineers learn R, this ecosystem of packages and guides can grow into a true internal data science platform.

### Academics and industry

There's a popular definition of data scientists:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Data Scientist (n.): Person who is better at statistics than any software engineer and better at software engineering than any statistician.</p>&mdash; (((Josh Wills))) (@josh_wills) <a href="https://twitter.com/josh_wills/status/198093512149958656">May 3, 2012</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

This version is framed positively, but it's worth noting that the inverse is also true: in grad school I knew less about statistics than others in [my lab](http://www.genomine.org/), and in my new job I know less about software engineering than my colleagues. So how has the transition been?

#### Knowing more about statistics

There are plenty of [dramatic articles about how "programmers need to learn statistics"](https://zedshaw.com/archive/programmers-need-to-learn-statistics-or-i-will-kill-them-all/). It's true that I have more statistical experience and training than my coworkers (also the first with a PhD in any topic). But it hasn't felt like an obstacle in my work.

For one thing, I've noticed this gap is closing in a lot of important areas. The developers I've met who interpret A/B testing are already aware of the dangers of p-hacking and multiple hypothesis testing, as well as the importance of effect sizes and confidence intervals. The data team in particular had already worked to spread good practices. The gaps that took more getting used to were more along the lines of "using Poisson rather than linear regression" or "know when to use a log scale".

More importantly, I've found that developers have been more than willing to listen and learn when I brought up statistical issues, and I feel like my working relationships so far have built up mutual trust. This is one case in which my experience really hasn't reflected the ["Programmers Need To Learn Statistics"](https://zedshaw.com/archive/programmers-need-to-learn-statistics-or-i-will-kill-them-all/) article, which painted developers as overconfident zealots. It's possible we're an unusually functional engineering department in this regard (I've heard worse stories from other companies!), but it's also possible that the attitude of the software development industry has changed in the last six years, with the importance of statistics being more widely recognized.

One aspect of graduate school I miss is learning about statistics from others. I was surrounded by people much more knowledgeable than myself, and in lab meetings and seminars I got exposed to a lot of useful statistical theory and methods. I also could count on others to catch if I made a mistake. Most of my current statistical education has to be self-driven, and I need to be very cautious about my work: if I use an inappropriate statistical assumption in a report, it's unlikely anyone else will point it out.

#### Knowing less about software engineering

I've long cared about programming practices, and I've been using GitHub and contributing to open source Python and R projects for years, but working for a tech company did represent something of a shift. I'm a lifetime Mac user, and in the last few years have worked entirely in R. Stack Overflow is built on Microsoft technologies, particularly C#, ASP.NET, and SQL Server, and before I joined nobody at the company had ever used R. I'm [not attached to a particular side of a language war](http://varianceexplained.org/r/polarizing-technologies/), but I was certainly nervous about what the change would mean for me.

This also turned out not to be much of an obstacle, especially I've found that I can contribute a lot to the company entirely from within R on a Mac. I owe a lot to the developers of [RSQLServer](https://github.com/imanuelcostigan/RSQLServer) and the [jTDS driver](http://jtds.sourceforge.net/index.html); thanks to them I can easily query our databases from RStudio. I have a Parallels window with Visual Studio open at all times, but I find most days I don't even need to use it. I do push code to production sometimes (usually related to ad targeting experiments), but it hasn't been a source of friction. There's many areas of software engineering that I know *much* less about than my colleagues, including front-end web design and site reliability engineering, but like in any company I end up pretty insulated from those concerns.

### Other changes

**Leaving biology research**. This was probably the change I was most nervous about. For eight years (including most of my undergraduate degree), my research had been focused on biology. It took spending a few months working on other problems to realize that, honestly, **I had never been that passionate about biological questions.**

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/daattali">@daattali</a> <a href="https://twitter.com/JennyBryan">@JennyBryan</a> <a href="https://twitter.com/noamross">@noamross</a> <a href="https://twitter.com/hspter">@hspter</a><br><br>Me: I had the weirdest, longest dream I cared about RNA<br><br>Wife: That wasn&#39;t a dream it was a PhD</p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/721145102404554752">April 16, 2016</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

Biology presents a lot of interesting computational and statistical problems, and there's a lot of exciting work going on in bioinformatics. But when I finished a biological analysis, I'd end up with results (say, a hundred genes that changed expression in response to a stimulus) that I didn't have the knowledge or interest to interpret myself. (Even after years of working with the yeast genome as a whole, I can recognize only a handful of genes by name). In contrast, I've been a longtime user of Stack Overflow, and I have a general interest in the state of the software developer ecosystem, so I see a result like the above networks, I can tell whether it makes sense immediately. It feels *different* to work on data that I'm actually interested in.

**Writing**: This is an advantage I'd underestimated. I did a lot of writing in my degree, mostly for journal articles and my dissertation, and the truth is that writing that kind of formal language can feel *pretty stilted*. In the last year most of my writing has been for internal reports, for documentation, or for blog posts, where I get to write informally and conversationally (try comparing the language of [my dissertation](http://arks.princeton.edu/ark:/88435/dsp01hd76s238c) to any of the posts on this blog). I've had some leftover research I'm trying to get published, and for this reason it's *very hard* to get back into the mindset of writing for a journal article.

### The people I work with

I have a weird sense of humor, and many of my tweets involve a fictional "Dev" that serves as a comedic foil, either to mock engineering culture or to mock my own inexperience in it.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Me: You can&#39;t just add two p-values together.<br><br>Dev: The hell I can&#39;t:<br><br>newPval = pval1 + pval2;<br><br>Me: But-<br><br>Dev: Is all statistics this easy</p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/714879071725993986">March 29, 2016</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Me [smugly]: So you see, when you use the right correction, the p-value is .023, not .02<br><br>Dev: Are you the guy who broke the build yesterday</p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/719567168099057664">April 11, 2016</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

In case it's not obvious, every one of these tweets is a blatant lie. First, not one of these exchanges happened. But more importantly, they're not remotely representative of developers I've worked with. The smart, competent, caring people at this company are one of my favorite parts of working here.

There are many worth listing (certainly all the members of the Data and Ad Server teams), but I'm going to name just a few as examples. [Jason Punyon](http://jasonpunyon.com/) is the developer who originally discovered my post on the beta distribution. Jason's an excellent engineer, and after six years here he's built up a tremendous amount of useful product knowledge. One aspect that really impresses me is the way he combines caring about the data with caring about our users.

A few months ago I ran an experiment that showed there was a substantial benefit to displaying a salary range on job ads (more about that in future posts), and shared the results within the company. I was happy just to share some of the conclusions I'd learned. But Jason took the results and turned them into action, starting a push for all employers (including ourselves) to provide salary information on listings. He did that because he takes data seriously, as something that guides his choices and that should guide the decisions of the company. He also cares about developers, as users of our product and as people, and thinks they deserve to know salary information up front. I'm proud to work with him.

There are a lot of people outside the engineering department I'm impressed with, and I'm especially glad to work with the [Community Team](http://meta.stackexchange.com/questions/99338/who-are-the-community-team-and-what-do-they-do). For instance, [Taryn Pratt](https://blog.stackoverflow.com/2015/06/pivoting-into-a-new-career-please-welcome-taryn-pratt-bluefooted-community-manager/) (aka [bluefeet](http://stackoverflow.com/users/426671/bluefeet)) joined the team a few months before I started. I contributed to the Stack Overflow community before I worked here, but *nothing* compared to Taryn's contributions. She'd been an active answerer and moderator for years, including answering >3500 questions and casting >22,000 helpful flags (!!).

While Taryn's not a developer here, she's got excellent technical experience and skills (true of most Community Managers). And she commits these skills (especially SQL) to helping the Stack Overflow community. In that context she recently started learning R, so she could apply statistical, data-driven methods to analyze and understand patterns in Q&A activity. With the help of her and other people on the team I'm really excited to see what data science can contribute to the community.

### My advice to graduate students: create public artifacts

Some time after I was hired, I learned a bit more of the story behind Jason's tweet, and that the internal conversation about reaching out to me had started on a whim. 

![](https://www.dropbox.com/s/q0d0rih1qusmccg/Screenshot%202016-06-16%2011.52.43.png?dl=1)

I feel really lucky to have the job I have now, and seeing that made me feel even luckier. The circumstances of my hiring were probably too much of a freak accident to extract any advice from. But if I were to try to give advice to people still in graduate school, here's what I'd come up with: **public work is not a waste of time.** 

When I was in graduate school I cared most about getting papers published; in my understanding that was the mark of a successful degree, and the only thing that would matter for my career. I ended up publishing roughly the median number for a PhD in my field (you can find them [here](http://varianceexplained.org/about/)). I'm glad I did so, but honestly it would be hard to point to a way my life would be different if I had published fewer or even none of them. But I do know for sure my life would be different if I hadn't posted about the beta distribution, and even more different if I hadn't started answering on Stack Overflow at all.

Journal articles are one way of creating public work, but far from the only one: they're slow to review, and they need to be "perfect" before they're submitted. I think there's a dangerous attitude that they're the *only* way to make work public, and that therefore a lot of good work in academia languishes for years or disappears entirely because it's *not quite a paper* (certainly none of my blog posts would qualify for submission as a journal article). So I'd say that if you have something interesting but it's not quite a paper, write it as a blog post, or a Stack Overflow answer, or an open source project on GitHub. *Just get something out there!*

Like I said at the start, I'm really glad I answered that question about the beta distribution. It gave me the chance to work on a product that's done so much for my programming knowledge and productivity. I get to work with the people who build it, who to this day consistently impress me. And one year in, it's been the best job I could have asked for.

Well, almost the best.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">*Sigh*<br><br>Back to work I guess <a href="https://t.co/rjHmPk3X0V">pic.twitter.com/rjHmPk3X0V</a></p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/718151411687526400">April 7, 2016</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

[^clustercode]: A reproducible version of the code and data used to make this first graph is [here](https://rpubs.com/dgrtwo/technology-clusters) if you'd like to analyze it yourself.
[^ifyouwork]: If you work at Stack Overflow and you want to learn more about getting started with our internal R tools, [be sure to check out this guide](https://docs.google.com/a/stackoverflow.com/document/d/1ZdVfzAZyFIHf072jgVwG2nj9zoVPGdlVb47gyMsdkAE/edit?usp=sharing), which includes links to the other tutorials.
