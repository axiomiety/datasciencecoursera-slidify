---
title       : Fun with Slidify
subtitle    : R and slidify, the dynamic duo
author      : Pierre
job         : 2018-10-28
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
output: ioslides_presentation
---

## Data

Singpapore:
https://data.gov.sg/dataset/weekly-infectious-disease-bulletin-cases

Seasonality of Hand, Fout Mouth Disease


```r
setwd("c:/shared/datasciencecoursera-slidify/deck/")
data <- read.csv("weekly-infectious-disease-bulletin-cases.csv")
library(dplyr)
library(tidyr)
hfmd <- data  %>%
        filter(disease == 'Hand, Foot Mouth Disease') %>%
        select(epi_week, no._of_cases) %>%
        separate(epi_week, c('year','week'), sep='-')
```

--- .class #id 

## Slide 2

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png)


