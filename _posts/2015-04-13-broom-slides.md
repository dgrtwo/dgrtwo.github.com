---
layout: post
title: "Slides from my talk on the broom package"
description: "Slides and some highlights from my talk on the broom package at UP-STAT 2015."
date: 2015-04-13 12:00:00 -0400
output: html_document
og_image: http://varianceexplained.org/images/broom_slides/broom_slides.002.jpg
category: r
tags: [r, statistics, tidy, broom]
comments: true
---

This weekend I gave a presentation on my [broom package](http://github.com/dgrtwo/broom) for tidying model objects (see my introduction [here](http://varianceexplained.org/r/broom-intro/)) at the [UP-STAT 2015](http://www.up-stat.org/ConferenceInformation/Program) conference at SUNY Geneseo. I'm sharing the slides [here](/files/broom_presentation.pdf), along with some highlights below.

I first explained how broom fits with other tidy tools such as [dplyr](http://github.com/hadley/dplyr), [tidyr](http://github.com/hadley/tidyr) and [ggplot2](http://github.com/hadley/ggplot2) as part of an exploratory data analysis workflow:

![Exploratory data analysis](/images/broom_slides/broom_slides.001.jpg)

I explored the many small ways that a linear regression object is "messy", which typify the obstacles of using tidy tools with model objects:

![how linear models are "messy"](/images/broom_slides/broom_slides.002.jpg)

And I showed how broom made the process easy:

![broom's tidy method](/images/broom_slides/broom_slides.003.jpg)

I gave an overview of the many kinds of objects broom can tidy:

![broom objects table](/images/broom_slides/broom_slides.004.jpg)

I also touched on one of the more powerful analyses that broom can enable: namely, combining many models so that they can be compared and contrasted.

![combining models](/images/broom_slides/broom_slides.005.jpg)

Enjoy the slides!
