---
title: "Can R and ggvis help solve Serial's murder?"
description: "Creating an interactive visualization of the podcast Serial's infamous 'call log,' using ggvis."
layout: post
category: r
tags: [r, ggvis]
comments: true
---

Like much of America, I followed season one of Sarah Koenig's true-crime podcast [Serial](http://serialpodcast.org/) with an interest that bordered on obsession. Serial tells the story of the Baltimore 1999 murder of high-schooler Hae Min Lee, and of state prisoner Adnan Syed, who was convicted of the crime but to this day maintains his innocence. One especially gripping episode of the podcast was [Ep 5: Route Talk](http://serialpodcast.org/season-one/5/route-talk), where Sarah and her producer Dana physically retrace the path Adnan allegedly took that day, all while comparing the prosecution's timeline (built from the testimony of Jay, their eyewitness) to the [call log](http://serialpodcast.org/posts/2014/10/maps-and-logs) from Adnan's phone. 

It struck me that while most of the podcast makes great treadmill listening, the discussions of the call log are best understood visually. Each of the calls from Adnan's phone comes with a time, a duration, and a cell tower that it "pinged", which gives an approximate idea of where in Baltimore the call originated. All that is hard to keep straight when you're hearing it described on a podcast. Even with a copy of the map and call log on hand, though, the timeline takes great effort to understand: it weaves information across longitude, latitude, time, towers, and people. This makes it the kind of problem best tackled not with a static visualization, but with an interactive timeline. I decided to give it a shot with the young but powerful [ggvis](https://github.com/rstudio/ggvis) package, creating [this interactive visualization](https://dgrtwo.shinyapps.io/serialApp/).

Thanks to some useful packages and resources, the visualization was straightforward to make. Someone had already transformed the Serial map and call log information [from the official site](http://serialpodcast.org/posts/2014/10/maps-and-logs) into CSV format, and posted it in a [GitHub repository](https://github.com/thmcmahon/serial_podcast_data). After reading it in, I used [dplyr](https://github.com/hadley/dplyr) to clean and merge it into a format that could be visualized. I combined it with map shape files of Baltimore City and County downloaded from the [Maryland State Data Center](http://www.mdp.state.md.us/MSDC/Zipcode_map/2012/zip12idx.shtml), processing them with [rgdal](http://cran.r-project.org/web/packages/rgdal/index.html) and my own [broom](https://github.com/dgrtwo/broom) package (you can find the processing code [here](https://github.com/dgrtwo/serial-ggvis/blob/master/serial-preprocessing.Rmd)).

The data naturally lend themselves to visualization as a timeline (two dimensions: time and person called) and a map (two dimensions: longitude and latitude). The real puzzle of the visualization is how to *connect* the two visualizations so that they can be understood and interpreted in parallel. This is where ggvis's interactivity- specifically the [linked brush](https://github.com/rstudio/ggvis/blob/master/demo/rmarkdown/linked_brush.Rmd)- is invaluable. By dragging and selecting calls on the timeline, the user can see which cell towers were "pinged" by those calls.

<a href="https://dgrtwo.shinyapps.io/serialApp/">
    <img alt="ggvis visualization" src="https://www.dropbox.com/s/wl98vs2fmli36xj/shiny_example.png?dl=1" width = "350px"/>
</a>

While the first season of Serial ended last week, interest in the case [continues unabated](http://www.reddit.com/r/serialpodcast/). Statisticians are [already tackling Serial's mysteries from the perspective of Bayesian reasoning](http://fivethirtyeight.com/features/the-superfans-using-stats-to-get-to-the-bottom-of-serial/), but I like to think that the data science and visualization community has something important to contribute as well- and the development of great R tools like ggvis and Shiny make that easy. There's a lot that can be added to visualizations like these (for instance, annotation of key events on the timeline, both those in Jay's testimony and those corroborated by other witnesses), and I've shared the project [on GitHub](https://github.com/dgrtwo/serial-ggvis) in the hope that others use it as inspiration.

-----------

You can find the data pre-processing code [here](https://github.com/dgrtwo/serial-ggvis/blob/master/serial-preprocessing.Rmd) and the code for the Shiny app [here](https://github.com/dgrtwo/serial-ggvis/tree/master/serialApp) (with most of the interesting ggvis code in [server.R](https://github.com/dgrtwo/serial-ggvis/blob/master/serialApp/server.R)).
