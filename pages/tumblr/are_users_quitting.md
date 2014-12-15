Are High-Reputation Users Quitting Stack Overflow?
========================================================




This is a short analysis on whether the activity of high-reputation users in Stack Overflow has been decreasing over time, both to satisfy my own curiosity and to serve as a potentially useful demonstration of some R packages and techniques, namely

* [data.table](http://cran.r-project.org/web/packages/data.table/index.html)
* [ggplot2](http://docs.ggplot2.org/current/)
* quasipoisson regression

[Here](http://dgrtwo.github.com/pages/tumblr/are_users_quitting.html) you can find a [knitr](http://yihui.name/knitr/) version of this page with the R code included, and [here](http://dgrtwo.github.com/pages/tumblr/are_users_quitting.Rmd) you can download the raw .Rmd file. There is also a version of this question posted at [Meta Stack Overflow](http://meta.stackoverflow.com/questions/252756).

### Introduction

I spend a good amount of time on the programming Q+A site [StackOverflow](http://stackoverflow.com/) (and a smaller amount of time on its statistics sister site, [Cross Validated](http://stats.stackexchange.com/)). Recently [this question on Meta Stack Overflow](http://meta.stackoverflow.com/questions/251758) (the website's discussion forum) caught my attention, raising the question of whether Stack Overflow had become "more negative" recently. It wasn't the first time that I'd heard suggestions of this nature, but due to [recency bias](http://www.skepdic.com/recencybias.html) I'm cautious of turning a complaint ("I don't like X") into trends ("kids these days with their X"). In particular, the fact that people were noticing the [exact same "trend" in September 2008](http://meta.stackexchange.com/questions/9953/could-we-please-be-a-bit-nicer-to-new-users) would appear to confirm that it's not a recent phenomenon.

But [this answer in particular struck me](http://meta.stackoverflow.com/a/251842/712603), as it suggested a simple, specific and testable hypothesis regarding the supposed decline of Stack Overflow: that high-reputation users are starting to quit the site. ("Reputation" is a measure of trust within the Stack Overflow community achieved by receiving upvotes on your questions and answers, so high-reputation users are those who had answered many questions- a mass exodus of such users would indeed be worrisome). As the answer was provided by one of the most prolific answerers on Stack Overflow, it seemed like it deserved consideration.







Luckily, the Stack Exchange network has made an exceptional resource available to data scientists: the [Stack Exchange Data Explorer](https://data.stackexchange.com/), which lets anyone query information about the history of users and posts. So I constructed a dataset of the number of Stack Overflow answers per user per month since January 2012, for all users with reputation >= 20000, using [this query](http://data.stackexchange.com/stackoverflow/query/186926).^[1]. This covers a total of 44693 answers from 2312 users. With this dataset, we can take a look at whether high-reputation users are in fact quitting the site.

### Overall Statistics

First, we can ask: as a whole, are >20K rep users contributing fewer questions than they used to?

![plot of chunk overall_contributions](figure/overall_contributions.jpeg) 


The answer is a definitive *yes*: answers contributed by these high-rep users decreased by about 25% from January 2012 to March 2014. Furthermore, the sharpest decline (of more than 20%) was in the last year.







### Exponential Model

Now we might ask whether this is trend is split across all users equally: is this a general but gradual malaise among all high-reputation users, or is there a special class of "quitters" that could be "blamed" for the decrease? Furthermore, are there many high-rep users that are bucking the trend and are *increasing* their contributions over time? To determine this, I perform a quasipoisson generalized linear model predicting the number of questions/month as exponentially growing or decaying over time.^[2] This gets us a p-value for each user, testing whether there is a trend over time:^[3]

![plot of chunk qpoisson_pvalues](figure/qpoisson_pvalues.jpeg) 





We can control the false discovery rate using our favorite multiple hypothesis testing tool (in my case, the [q-value package](http://www.bioconductor.org/packages/release/bioc/html/qvalue.html)), which gets us a set of 1041 users (47.9% of all high-rep users) that have a statistically significant trend with respect to time, at a false discovery rate of 5%.

Statistical significance only tells us so much. Of those users with a significant trend over time, how many users increased their activity, and how many decreased it? And how quickly did it change in each case?

![plot of chunk increase_decrease](figure/increase_decrease.jpeg) 


Of these 1041 users whose activity was changing over time, 84% were *decreasing* (what we could call "quitters"), and only 16% were *increasing* (what we could call "joiners"). What we see here is the percentage change predicted for each user per month (for example, the mode "quitter" shows a rate of ~5% decline per month). We could also view it as the doubling time/half life. In this plot, positive values represent the number of months required for a "joiner" to double his activity, and negative values represent the number of months for a "quitter" to halve his:

![plot of chunk half_life](figure/half_life.jpeg) 


Now, we've identified a class of statistically significant "quitters" (874 users) and "joiners" (167 users). Do these users account for the trend we saw in our original figure? Well, let's divide the original figure up into categories:

![plot of chunk divided_categories](figure/divided_categories.jpeg) 


This set of users does make up for the overall downward trend. However, it's notable that there's another trend visible among those who didn't fit this model: one that increases activity during 2012, and then decreased their use through 2013 (we could call them the "2013 quitters"). This second trend would account for the fact that the 2013 drop was much sharper than the 2012 drop, and it deserves further study in any future analysis.

### Individual Users

What do the trends of the top users look like? (This is not to "call them out," but rather to see whether the assumptions of our model are appropriate for detecting trends):
    



![plot of chunk plot_top_users](figure/plot_top_users.jpeg) 


Of the top 12 users, 1 was increasing in activity in the last two years, while 8 were decreasing (the others did not show a statistically significant trend). Now, I'm far from a top user, but one might ask how I fit in:

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.jpeg) 


I do in fact have a significant negative trend (q-value = 0.014), but in fact I look a bit more like one of those "2013 quitters" we saw in the Other category. I'm not sure I could explain why through introspection (I'm guessing I just had less time to spend answering questions). But I would be interested in hearing from any former power users whose activity has decreased, and whether it was some perceived issue with Stack Overflow that led to this decline in activity.

- - -

^[1]: Why these choices? First, 20000 is the level designated by Stack Overflow as a "Trusted User", the highest level of privilege granted by reputation. Second, I was testing the hypothesis of a recent exodus in SO high-rep users, so it didn't make sense to look beyond the last two years. Third, this returned 44693 rows, and Stack Exchange Data Explorer returns a maximum of 50000, so I couldn't collect much more with a single query. Finally, I have started answering myself in January 2012, and have about 30K rep, so I was interested in seeing where I fit into the pattern!

^[2]: Why a quasipoisson fit? First, our outcome variable is a count (answers per month), so we certainly don't want to do traditional linear regression (for starters, counts can't go below 0!) But Poisson regression has an issue as well, in that we don't expect the number of answers in a month to be independent. For example, I tend to answer questions in bursts, up to 10 or more in a day, then might go weeks without answering another. A quasipoisson model, in which the variance can be greater than the mean, is one appropriate way to account for this.

^[3]: 3.8% of the trends could not be successfully fit by R's `glm` and were ignored, as were another 2.2% that were equal to 1 (typically indicative of an issue with the test's assumptions). 
