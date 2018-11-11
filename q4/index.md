---
title       : Building a Data Product
subtitle    : With Shiny
author      : Pierre
job         : 2018-11-11
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
output      : ioslides_presentation
---

## K-Means clustering

When looking at uncategorised data, it can be useful to group similar observations together

K-Means clustering allows us to do just that

But finding the 'right' number of clusters can be a little tricky


## The app (1)

The Shiny app enables the user to select a range of clusters, e.g. between 2 and 5, and run K-Means for each sample size (`2,3,4,5` in that case)

The output will be 2 graphs - one to visualise the clustering when plotting petal length vs petal width:


```
## Error in library(gglpot2): there is no package called 'gglpot2'
```

![plot of chunk kmeans](assets/fig/kmeans-1.png)

## The app (2)

And another showing the total sum of squares within for each value of `k`:

![plot of chunk wss](assets/fig/wss-1.png)

We will be using the `iris` dataset as an example (which happens to be categorised, so we know what the correct number of clusters should be)

## Thanks

<center>
That's all!
</center>
