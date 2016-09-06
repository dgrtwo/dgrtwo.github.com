---
layout: post
title: "Tidying computational biology models with biobroom: a case study in tidy analysis"
description: "An example of tidying Bioconductor model objects, such as from the limma package, with the biobroom package."
output: html_document
date: 2016-09-06 11:45:00 -0500
category: r
tags: [r, statistics, education]
comments: true
---





**Previously in this series:**

* [Cleaning and visualizing genomic data: a case study in tidy analysis](http://varianceexplained.org/r/tidy-genomics/)
* [Modeling gene expression with broom: a case study in tidy analysis](http://varianceexplained.org/r/tidy-genomics-broom/)

In previous posts, I've examined the benefits of the tidy data framework in cleaning, visualizing, and modeling in exploratory data analysis on a molecular biology experiment. We're using [Brauer et al 2008](http://www.molbiolcell.org/content/19/1/352.abstract) as our case study, which explores the effects of nutrient starvation on gene expression in yeast.

From the posts so far, one might get the impression that I think data must be tidy at *every* stage of an analysis. Not true! That would be an absurd and unnecessary constraint. Lots of mathematical operations are faster on matrices, such as singular value decomposition or linear regression. Jeff Leek [rightfully points this out](http://simplystatistics.org/2016/02/17/non-tidy-data/) as an issue with my [previous modeling gene expression post](http://varianceexplained.org/r/tidy-genomics-broom/), where he remarks that the [limma package](https://bioconductor.org/packages/release/bioc/html/limma.html) is both faster and takes more statistical considerations (pooling variances among genes) into account.

Isn't it contradictory to do these kinds of operations in a tidy analysis? Not at all. My general recommendation is laid out as follows:

![](http://varianceexplained.org/images/broom_slides/broom_slides.001.jpg)

As long as you're in that **Models** "cloud", you can store your data in whatever way is computationally and practically easiest. However:

* *Before* you model, you should use tidy tools to clean, process and wrangle your data (as shown in previous posts)
* *After* you've performed your modeling, you should turn the model into a tidy output for interpretation, visualization, and communication

This requires a new and important tool in our series on tidy bioinformatics analysis: the [biobroom package](http://bioconductor.org/packages/release/bioc/html/biobroom.html), written and maintained by my former colleagues, particularly Andy Bass and John Storey. In this post I'll show how to use the limma and biobroom packages in combination to continue a tidy analysis, and consider when and how to use non-tidy data in an analysis.

### Setup

Here's the code to catch up with our previous posts:


{% highlight r %}
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

url <- "http://varianceexplained.org/files/Brauer2008_DataSet1.tds"

nutrient_names <- c(G = "Glucose", L = "Leucine", P = "Phosphate",
                    S = "Sulfate", N = "Ammonia", U = "Uracil")

cleaned_data <- read_delim(url, delim = "\t") %>%
  separate(NAME, c("name", "BP", "MF", "systematic_name", "number"), sep = "\\|\\|") %>%
  mutate_each(funs(trimws), name:systematic_name) %>%
  select(-number, -GID, -YORF, -GWEIGHT) %>%
  gather(sample, expression, G0.05:U0.3) %>%
  separate(sample, c("nutrient", "rate"), sep = 1, convert = TRUE) %>%
  mutate(nutrient = plyr::revalue(nutrient, nutrient_names)) %>%
  filter(!is.na(expression), systematic_name != "") %>%
  group_by(systematic_name, nutrient) %>%
  filter(n() == 6) %>%
  ungroup()
{% endhighlight %}

In our last analysis, we performed linear models using broom and the built-in `lm` function:


{% highlight r %}
library(broom)

linear_models <- cleaned_data %>%
  group_by(name, systematic_name, nutrient) %>%
  do(tidy(lm(expression ~ rate, .)))
{% endhighlight %}

The above approach is useful and flexible. But [as Jeff notes](http://simplystatistics.org/2016/02/17/non-tidy-data/), it's not how a computational biologist would typically run a gene expression analysis, for two reasons.

* **Performing thousands of linear regressions with separate `lm` calls is slow**. It takes about a minute on my computer. There are computational shortcuts we can take when all of our data is in the form of a gene-by-sample matrix.
* **We're not taking statistical advantage of the shared information.** Modern bioinformatics approaches often "share power" across genes, by pooling variance estimates. The approach in the [limma package](http://nar.oxfordjournals.org/content/early/2015/01/20/nar.gkv007.long) is one notable example for microarray data, and RNA-Seq tools like edgeR and DESeq2 take a similar approach in their negative binomial models.

We'd like to take advantage of the sophisticated biological modeling tools in Bioconductor. We're thus going to convert our data into a non-tidy format (a gene by sample matrix), and run it through limma to create a linear model for each gene. Then when we want to visualize, compare, or otherwise manipulate our models, we'll tidy the model output using biobroom.

### Limma

Most gene expression packages in Bioconductor expect data to be in a matrix with one row per gene and one column per sample. In [the last post](http://varianceexplained.org/r/tidy-genomics-broom) we fit one model for each gene and nutrient combination. So let's set it up that way using reshape2's `acast()`.[^spread]


{% highlight r %}
library(reshape2)
exprs <- acast(cleaned_data, systematic_name + nutrient ~ rate,
               value.var = "expression")

head(exprs)
{% endhighlight %}



{% highlight text %}
##                  0.05   0.1  0.15   0.2  0.25  0.3
## Q0017_Ammonia    0.18  0.73  0.05 -0.14 -0.06 0.24
## Q0017_Glucose   -0.21 -0.26 -0.17  0.00  0.10 0.10
## Q0017_Leucine    0.46  0.05  0.42  0.35  0.36 0.09
## Q0017_Phosphate -0.24 -0.35 -0.45 -0.24 -0.35 0.11
## Q0017_Sulfate    2.44  0.64  0.21  0.40 -0.07 0.31
## Q0017_Uracil     1.88  0.03  0.15  0.04  0.14 0.32
{% endhighlight %}

We then need to extract the experiment design, which in this case is just the growth rate:


{% highlight r %}
rate <- as.numeric(colnames(exprs))
rate
{% endhighlight %}



{% highlight text %}
## [1] 0.05 0.10 0.15 0.20 0.25 0.30
{% endhighlight %}

[limma](https://bioconductor.org/packages/release/bioc/html/limma.html) ("linear modeling of microarrays") is one of the most popular Bioconductor packages for performing linear-model based differential expression analyses on microarray data. With the data in this matrix form, we're ready to use it:


{% highlight r %}
library(limma)

fit <- lmFit(exprs, model.matrix(~rate))
eb <- eBayes(fit)
{% endhighlight %}

This performs a linear regression for each gene. This operation is both faster and more statistically sophisticated than our original use of `lm` for each gene.

So now we've performed our regression. What output do we get?


{% highlight r %}
class(eb)
{% endhighlight %}



{% highlight text %}
## [1] "MArrayLM"
## attr(,"package")
## [1] "limma"
{% endhighlight %}



{% highlight r %}
summary(eb)
{% endhighlight %}



{% highlight text %}
##                  Length Class  Mode     
## coefficients     65074  -none- numeric  
## rank                 1  -none- numeric  
## assign               2  -none- numeric  
## qr                   5  qr     list     
## df.residual      32537  -none- numeric  
## sigma            32537  -none- numeric  
## cov.coefficients     4  -none- numeric  
## stdev.unscaled   65074  -none- numeric  
## pivot                2  -none- numeric  
## Amean            32537  -none- numeric  
## method               1  -none- character
## design              12  -none- numeric  
## df.prior             1  -none- numeric  
## s2.prior             1  -none- numeric  
## var.prior            2  -none- numeric  
## proportion           1  -none- numeric  
## s2.post          32537  -none- numeric  
## t                65074  -none- numeric  
## df.total         32537  -none- numeric  
## p.value          65074  -none- numeric  
## lods             65074  -none- numeric  
## F                32537  -none- numeric  
## F.p.value        32537  -none- numeric
{% endhighlight %}

That's a lot of outputs, and many of them are matrices of varying shapes. If you want to work with this using tidy tools (and if you've been listening, you hopefully do), we need to tidy it:


{% highlight r %}
library(biobroom)
tidy(eb, intercept = TRUE)
{% endhighlight %}



{% highlight text %}
## # A tibble: 65,074 x 6
##               gene        term   estimate statistic     p.value        lod
##              <chr>       <chr>      <dbl>     <dbl>       <dbl>      <dbl>
## 1    Q0017_Ammonia (Intercept)  0.3926667  1.591294 0.155459427 -6.3498508
## 2    Q0017_Glucose (Intercept) -0.3533333 -3.172498 0.015599597 -4.0295194
## 3    Q0017_Leucine (Intercept)  0.3873333  2.339366 0.051800996 -5.2780422
## 4  Q0017_Phosphate (Intercept) -0.4493333 -2.732529 0.029158254 -4.6871409
## 5    Q0017_Sulfate (Intercept)  1.9140000  3.937061 0.005595522 -2.9298317
## 6     Q0017_Uracil (Intercept)  1.1846667  2.476906 0.042315927 -5.0718352
## 7    Q0045_Ammonia (Intercept) -1.5060000 -5.842285 0.000629533 -0.5396668
## 8    Q0045_Glucose (Intercept) -0.8513333 -5.235045 0.001195959 -1.2455443
## 9    Q0045_Leucine (Intercept) -0.4440000 -1.807071 0.113591371 -6.0543398
## 10 Q0045_Phosphate (Intercept) -0.7546667 -4.488406 0.002819261 -2.1846537
## # ... with 65,064 more rows
{% endhighlight %}

Notice that this is now in one-row-per-coefficient-per-gene form, much like the output of broom's `tidy()` on linear models.

Like broom, biobroom always returns a table[^tbl_df] without rownames that we can feed into standard tidy tools like dplyr and ggplot2. (Note that unlike broom, biobroom requires an `intercept = TRUE` argument to leave the intercept term, simply because in many genomic datasets- though not ours- the intercept term is almost meaningless). biobroom can also tidy model objects from other tools like edgeR or DESeq2, always giving a consistent format similar to this one.

Now all we've got to do split the systematic name and nutrient back up. tidyr's `separate()` can do this:


{% highlight r %}
td <- tidy(eb, intercept = TRUE) %>%
  separate(gene, c("systematic_name", "nutrient"), sep = "_")

td
{% endhighlight %}



{% highlight text %}
## # A tibble: 65,074 x 7
##    systematic_name  nutrient        term   estimate statistic     p.value
## *            <chr>     <chr>       <chr>      <dbl>     <dbl>       <dbl>
## 1            Q0017   Ammonia (Intercept)  0.3926667  1.591294 0.155459427
## 2            Q0017   Glucose (Intercept) -0.3533333 -3.172498 0.015599597
## 3            Q0017   Leucine (Intercept)  0.3873333  2.339366 0.051800996
## 4            Q0017 Phosphate (Intercept) -0.4493333 -2.732529 0.029158254
## 5            Q0017   Sulfate (Intercept)  1.9140000  3.937061 0.005595522
## 6            Q0017    Uracil (Intercept)  1.1846667  2.476906 0.042315927
## 7            Q0045   Ammonia (Intercept) -1.5060000 -5.842285 0.000629533
## 8            Q0045   Glucose (Intercept) -0.8513333 -5.235045 0.001195959
## 9            Q0045   Leucine (Intercept) -0.4440000 -1.807071 0.113591371
## 10           Q0045 Phosphate (Intercept) -0.7546667 -4.488406 0.002819261
## # ... with 65,064 more rows, and 1 more variables: lod <dbl>
{% endhighlight %}

### Analyzing a tidied model

We can now use the tidy approaches to visualization and interpretation that were explored in previous posts. We could create a [p-value histogram](http://varianceexplained.org/interpreting-pvalue-histogram)


{% highlight r %}
ggplot(td, aes(p.value)) +
  geom_histogram() +
  facet_grid(term ~ nutrient, scales = "free_y")
{% endhighlight %}

![center](/figs/2016-09-06-tidy-genomics-biobroom/pvalue_plot-1.png)

Or make a volcano plot, comparing statistical significance to effect size (here let's say just on the slope terms):


{% highlight r %}
td %>%
  filter(term == "rate") %>%
  ggplot(aes(estimate, p.value)) +
  geom_point() +
  facet_wrap(~ nutrient, scales = "free") +
  scale_y_log10() 
{% endhighlight %}

![center](/figs/2016-09-06-tidy-genomics-biobroom/volcano_plot-1.png)

We could easily perform for multiple hypothesis testing within each group, and filter for significant (say, FDR < 1%) changes:


{% highlight r %}
td_filtered <- td %>%
  group_by(term, nutrient) %>%
  mutate(fdr = p.adjust(p.value, method = "fdr")) %>%
  ungroup() %>%
  filter(fdr < .01)
{% endhighlight %}

Or finding the top few significant changes in each group using dplyr's `top_n`:


{% highlight r %}
top_3 <- td_filtered %>%
  filter(term == "rate") %>%
  group_by(nutrient) %>%
  top_n(3, abs(estimate))

top_3
{% endhighlight %}



{% highlight text %}
## Source: local data frame [18 x 8]
## Groups: nutrient [6]
## 
##    systematic_name  nutrient  term  estimate  statistic      p.value
##              <chr>     <chr> <chr>     <dbl>      <dbl>        <dbl>
## 1          YAL061W   Sulfate  rate -13.40000 -15.374369 1.159000e-06
## 2          YBR054W Phosphate  rate -23.80571 -12.675600 4.306351e-06
## 3          YBR072W    Uracil  rate -27.01143 -11.870314 6.702423e-06
## 4          YBR116C    Uracil  rate -25.12000  -9.931703 2.199911e-05
## 5          YBR294W Phosphate  rate  24.56571   9.953214 2.168703e-05
## 6          YFL014W   Leucine  rate -18.92000  -6.884237 2.318928e-04
## 7          YHR096C   Ammonia  rate -23.71429 -20.700901 1.496359e-07
## 8          YHR096C   Glucose  rate -20.31429  -7.890506 9.816693e-05
## 9          YHR096C   Leucine  rate -23.18286  -6.324890 3.904599e-04
## 10         YHR096C Phosphate  rate -26.12000 -25.405139 3.616210e-08
## 11         YHR137W   Glucose  rate -21.45143  -9.798727 2.404524e-05
## 12         YIL160C   Sulfate  rate -13.50286 -16.838241 6.214232e-07
## 13         YIL169C   Ammonia  rate -24.99429  -8.439007 6.375875e-05
## 14         YLR327C   Leucine  rate -18.43429 -17.547502 4.679809e-07
## 15         YLR327C    Uracil  rate -28.13714  -7.434840 1.432175e-04
## 16         YMR303C   Glucose  rate -22.60000  -6.101140 4.856028e-04
## 17         YOL155C   Ammonia  rate -28.13714 -11.530132 8.147212e-06
## 18         YPL223C   Sulfate  rate -18.42857 -12.883494 3.857832e-06
## # ... with 2 more variables: lod <dbl>, fdr <dbl>
{% endhighlight %}

We could join this with our original data, which would let us visualize the trends for only the most significant genes:


{% highlight r %}
top_3 %>%
  rename(significant_nutrient = nutrient) %>%
  inner_join(cleaned_data, by = "systematic_name") %>%
  mutate(highlight = nutrient == significant_nutrient) %>%
  ggplot(aes(rate, expression, color = nutrient)) +
  geom_point() +
  geom_smooth(aes(lty = !highlight), method = "lm", se = FALSE, show.legend = FALSE) +
  facet_wrap(significant_nutrient ~ systematic_name, ncol = 3, scales = "free_y")
{% endhighlight %}

![center](/figs/2016-09-06-tidy-genomics-biobroom/top_3_plot-1.png)

In short, you can once again use the suite of "tidy tools" that we've found powerful in genomic analyses.

### Conclusion: Data is wrangled for you, not you for the data

There's a classic proverb of computer science from [Abelman & Sussman](https://mitpress.mit.edu/sicp/full-text/sicp/book/node3.html): **"Programs must be written for people to read, and only incidentally for machines to execute."** I'd say this is even more true for data it is for code. Data scientists need to be very comfortable engaging with their data, not fighting with the representation.

I agree with a lot in [Jeff's "Non-tidy data" post](http://simplystatistics.org/2016/02/17/non-tidy-data/), but there's one specific statement I disagree with:

> ...you might not use tidy data because many functions require a different, also very clean and useful data format, and you don’t want to have to constantly be switching back and forth.

I'd counter that switching is a small cost, because switching can be automated. Note that in the above analysis, reshaping the data required only two lines of code and two functions (`acast()` and `tidy()`). In contrast, there's no way to automate critical thinking. Any challenge in plotting, filtering, or merging your data will get directly in the way of answering scientific questions.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/jtleek">@jtleek</a> <a href="https://twitter.com/mark_scheuerell">@mark_scheuerell</a> <a href="https://twitter.com/hadleywickham">@hadleywickham</a> solution is put energy into tidying first. Otherwise, you will pay off energy 10x in plot/manip</p>&mdash; David Robinson (@drob) <a href="https://twitter.com/drob/status/698246351415476224">February 12, 2016</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

It's thus the job of tool developers to make these "switches" as easy as possible. broom and biobroom play a role in this, as do reshape2 and tidyr. Jeff lists natural language as a type of data that's best left un-tidy, but since that post Julia Silge and have I developed the [tidytext](https://github.com/juliasilge/tidytext) package, and we've found it useful for performing text analyses using ggplot2 and dplyr ([see here for examples](http://tidytextmining.com/)).

Other examples of operations that are better performed on matrices include correlations and distance calculations, and for those purposes I'm currently working on the [widyr](http://github.com/dgrtwo/widyr) package, which wraps these operations to allow a tidy input and tidy output (for example, see [this application of the `pairwise_cor` function](http://varianceexplained.org/r/seven-fav-packages/)).

![](http://varianceexplained.org/images/widyr.jpg)

### Next time: gene set enrichment analysis

(**Programming note**: this was [originally](http://varianceexplained.org/r/tidy-genomics-broom/) my plan for *this* post, but I decided to preempt it for biobroom!)

These per-gene models can still be difficult to interpret biologically if you're not familiar with the functions of specific genes. What we really want is a way to summarize the results into "genes involved in this biological process changed their expression." This is where annotations of gene sets become useful.


{% highlight r %}
gene_sets <- distinct(cleaned_data, systematic_name, BP, MF)

td %>%
  inner_join(gene_sets) %>%
  filter(BP == "leucine biosynthesis", term == "(Intercept)") %>%
  mutate(nutrient = reorder(nutrient, estimate, median)) %>%
  ggplot(aes(nutrient, estimate)) +
  geom_boxplot() +
  geom_point() +
  geom_text(aes(label = systematic_name), vjust = 1, hjust = 1) +
  xlab("Limiting nutrient") +
  ylab("Intercept (expression at low concentration)") +
  ggtitle("Genes involved in leucine biosynthesis")
{% endhighlight %}

![center](/figs/2016-09-06-tidy-genomics-biobroom/unnamed-chunk-5-1.png)

Notice how clear it is that these genes respond to leucine starvation in particular. This can be applied to gene sets containing dozens or even hundreds of genes while still making the general trend apparent. Furthermore, we could use these summaries to look at many gene sets at once, and even use statistical tests to discover new gene sets that respond to starvation.

Thus, in my next post in this series, we’ll apply our “tidy modeling” approach to a new problem. Instead of testing whether each gene responds to starvation in an interesting way, we’ll test functional groups of genes (a general method called [gene set analysis](http://www.nature.com/nrg/journal/v17/n6/full/nrg.2016.29.html)) in order to develop higher-level biological insights. And we’ll do it with these same set of tidy tools we’ve been using so far.

[^spread]: We could have used tidyr's `spread` function, but `acast` actually saves us a few steps by giving us a matrix with rownames, rather than a data frame, right away.
[^tbl_df]: Note that by default biobroom returns a `tbl_df` rather than a `data.frame`. This is because tidy genomic output is usually many thousands of rows, so printing it is usually not practical. The class it returns can be set (to be a tbl_df, data.frame, or data.table) through the `biobroom.return` global option.
