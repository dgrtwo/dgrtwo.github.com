---
layout: page
title: "Workflow for Creating Pages"
description: ""
category: r
tags: [knitr, r, reproducibility]
---



I use [knitr](http://yihui.name/knitr/) and [jekyll](http://jekyllrb.com/) to produce these reproducible R pages. Here are the steps:

- Set up [jekyll-bootstrap](http://jekyllbootstrap.com/), optionally with a GitHub repository.

- Set up a folder called `_R` to contain your .Rmd files that will be compiled.

- Put the following script into `knitpages.R`. When run, this will regenerate pages in the `pages` directory from any newer files in the `_R` directory:

{% highlight r %}
#!/usr/bin/Rscript --vanilla

# compiles all .Rmd files in _R directory into .md files in Pages directory,
# if the input file is older than the output file.

# run ./knitpages.R to update all knitr files that need to be updated.

KnitPost <- function(input, outfile, base.url="/") {
    # this function is a modified version of an example here:
    # http://jfisher-usgs.github.com/r/2012/07/03/knitr-jekyll/
    require(knitr);
    opts_knit$set(base.url = base.url)
    fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
    opts_chunk$set(fig.path = fig.path)
    opts_chunk$set(fig.cap = "center")
    render_jekyll()
    knit(input, outfile, envir = parent.frame())
}

for (infile in list.files("_R", pattern="*.Rmd", full.names=TRUE)) {
    outfile = paste0("pages/", sub(".Rmd$", ".md", basename(infile)))

    # knit only if the input file is the last one modified
    if (!file.exists(outfile) |
        file.info(infile)$mtime > file.info(outfile)$mtime) {
        KnitPost(infile, outfile)
    }
}
{% endhighlight %}

- Create a `.Rmd` file in the `_R` directory, such as `_R/example.Rmd`. Run the command

       ./knitpages.R

(To-do: have the script be run as part of the Jekyll updating process).

- Visit your page at [http://localhost:4000/pages/example.html](http://localhost:4000/pages/example.html).

- If you like, deploy it using git:

       git add .
       git commit -m "Updated Rmd page"
       git push -u origin master

------------

Now, some R code just for fun:


{% highlight r %}
summary(cars)
{% endhighlight %}



{% highlight text %}
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
{% endhighlight %}



{% highlight r %}
plot(cars)
{% endhighlight %}

![center](/figs/workflow/plot_cars.png) 


