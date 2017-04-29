---
title: "The Code Behind My Colorado Rent Analysis"
author: "chipoglesby"
date: '2017-04-29'
excerpt: Examining ways you might automate reporting for analysis.
layout: post
published: true
slug:
categories:

- Coding

tags:

- R

---

Recently I finished up a small project that where I was [analyzing annual rent
prices in Colorado](http://www.chipoglesby.com/coloradoRent/).

I got the idea to start investigating open data in Colorado from the app
building event, [Go Code Colorado](http://gocode.colorado.gov/).

## Automating Charts
With most analysis projects, you would always want to start out by doing an
[exploratory data analysis](https://en.wikipedia.org/wiki/Exploratory_data_analysis)
of your information. One huge pet peeve that I have is doing things manually so
I thought this would be a good opportunity to explore how I might begin visualizing
rent changes over time with some simple `R` code.

<script src="http://gist-it.appspot.com/https://github.com/chipoglesby/coloradoRent/blob/master/code/plots/plots.R"></script>

This piece of code is pretty straight forward. Here I'm using a very simple
`for` loop to get each unique Colorado subregion, Fort Collins/Loveland for
example. Within the `for` loop, I've using `dplyr` and `ggplot2` to build a simple
line chart of rent with a `grepl` `filter` for the specific `i` subregion like:
`filter(grepl(paste(i, sep =""), subregion, fixed = TRUE))`.

That code would produce a chart like this for each subregion:

![Fort Collins/Loveland Rent Prices 1996 - 2015](https://raw.githubusercontent.com/chipoglesby/coloradoRent/master/images/fortcollinsloveland.png)

## Automating Reports
The next piece of the puzzle was to figure out how I might automate a short analysis
using the "structured" or "templated" data I had available.

At first, I wanted to know for each subregion, which apartment type saw the 
largest increase in rent prices over time.

For that I can just measure the percent change using the formula:
```
delta = round(sum(
max(averagerent[year == max(year)]) -
min(averagerent[year == min(year)])) / 
min(averagerent[year == min(year)]) * 100, 2)
```

After finding these metrics, I was able to come up with an algorithm to describe
the changes in rent prices across all sub regions of Colorado. Using a basic
`R markdown` template, I was able to create a very simple, repeatable report.

<script src="http://gist-it.appspot.com/https://github.com/chipoglesby/coloradoRent/blob/master/rmd/subregionAnalysis.Rmd"></script>

This code is another `for` loop that will create all of the analyses for me.
<script src="http://gist-it.appspot.com/https://github.com/chipoglesby/coloradoRent/blob/master/code/subregionAnalysis.R"></script>

If you wanted to extend the logic on a project like this further, you could.

## Issues

One of the things that you'll immediately see is that on the surface it doesn't
allow much customization of the reports, but I've been spending some time 
thinking through how you might solve that. I haven't come up with the perfect
solution yet, but I've been working on some ideas.

## Inception

Originally I came up with this idea when I read about the work [Narrative 
Science](http://chicagoinno.streetwise.co/2014/06/06/after-generating-baseball-articles-from-box-scores-narrative-science-now-tells-a-much-bigger-story/)
was doing with Natural Language Generation and creating stories from box scores.

This was before I knew about Narrative Science but at the time I realized that 
descriptive statistics like Google Analytics and reports that we write for 
businesses could be written and complied in the same fashion.

I've been working on my own idea for something like this that we could use at my
office to quickly supply reports and analyses without a lot of man hours 
involved using static sites or something more dynamic like a shiny app.

This project is as close as I've come to sharing that vision.
