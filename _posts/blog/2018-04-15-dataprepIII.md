---
title: "Text Analysis: Part III More Adventures in Cleaning Data"
author: chipoglesby
comments: true
date: "2018-04-15"
layout: post
slug: getting-and-cleaning-dataIII
excerpt: Round three of preparing unstructured text data for analysis.
published: true
categories:
- R
- coding
tags:
- R
- coding
- Frasier
---

In my [previous post](http://www.chipoglesby.com/2018/04/getting-and-cleaning-dataII/)
we looked an unsuccessful way of trying to join data from subtitles and the
transcripts.

We also took a peak at counts of lines between men and women across all eleven
seasons.

Since then, I've been able to use `rvest` to scrape data from IMDB and Wikipedia
and aded them to the subtitles and transcripts data frames. Adding the character
names by season and episode from IMDB was particularly helpful in removing
duplicates.

I did hear back from the creator of the `subtools` package and he gave me a
really interesting idea.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Hi! Not sure I understand the question. You can do what you want with the timecode. It&#39;s a precious information for time series analysis</p>&mdash; Francois Keck (@FrancoisKeck) <a href="https://twitter.com/FrancoisKeck/status/984678472126812161?ref_src=twsrc%5Etfw">April 13, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

When I mutate the original air date with the time code out, I was able to
a new variable that would let me perform a time-series analysis using sentiment
data.

Let's take a look at the data I'll use for this portion of the analysis:

|id |timeCodeOut |text | season | episode|title |directedBy |writtenBy |originalAirDate | viewershipInMillions| imdbVotes| imdbRatings|
|:--|:------------|:-----------------------------------------------------------------------|------:|-------:|:---------------------|:-------------|:--------------------------|:---------------|--------------------:|---------:|-----------:|
|90 |00:06:03.729 |for once you'll face the consequences of hanging up on callers | 1| 7|Call Me Irresponsible |James Burrows |Anne Flett & Chuck Ranberg |1993-10-28 | 27| 439| 7.9|
|91 |00:06:06.091 |what consequences | 1| 7|Call Me Irresponsible |James Burrows |Anne Flett & Chuck Ranberg |1993-10-28 | 27| 439| 7.9|
|92 |00:06:10.108 |l'm marco's girlfriend.. excuse me, ex-girlfriend, thanks to you. | 1| 7|Call Me Irresponsible |James Burrows |Anne Flett & Chuck Ranberg |1993-10-28 | 27| 439| 7.9|
|93 |00:06:12.639 |the marco who didn't want to commit | 1| 7|Call Me Irresponsible |James Burrows |Anne Flett & Chuck Ranberg |1993-10-28 | 27| 439| 7.9|
|94 |00:06:17.502 |you damned radio shrinks you couldn't just tell him to stick with it! | 1| 7|Call Me Irresponsible |James Burrows |Anne Flett & Chuck Ranberg |1993-10-28 | 27| 439| 7.9|

We'll perform a sentiment analysis using the `tidytext` package. After the
analysis, we'll use this data for the next step:

The `Bing` lexicon looks all of the words in each line, unnests them and then
assigns them a binary value of positive or negative like the example below:

|word         |sentiment |lexicon |dateTimeOut         |
|:------------|:---------|:-------|:-------------------|
|loud         |negative  |bing    |1993-10-28 00:00:42 |
|missed       |negative  |bing    |1993-10-28 00:06:48 |
|cry          |negative  |bing    |1993-10-28 00:07:06 |
|damn         |negative  |bing    |1993-10-28 00:00:45 |
|fault        |negative  |bing    |1993-10-28 00:07:23 |
|terrifically |positive  |bing    |1993-10-28 00:07:28 |
|attractive   |positive  |bing    |1993-10-28 00:07:28 |
|madly        |negative  |bing    |1993-10-28 00:08:23 |
|love         |positive  |bing    |1993-10-28 00:08:23 |

After creating the `dateTimeOut` variable, we can then create another variable
for each minute of the show and take the mean polarity of the entire minute.

Here's the `R` code for reference:
```
tidyFrasier %>% 
  filter(season == 1,
         episode == 7) %>% 
  inner_join(bing) %>%
  arrange(season, episode, id) %>%
  mutate(minute = as.numeric(minute(dateTimeOut)),
         sentiment = as.factor(sentiment),
         episode = as.factor(episode)) %>%
  group_by(season,
           episode,
           minute) %>%
  count(sentiment) %>%
  spread(sentiment,
         n,
         fill = 0) %>%
  mutate(polarity = positive - negative)
```

| season|episode | minute| negative| positive| polarity|
|------:|:-------|------:|--------:|--------:|--------:|
|      1|7       |      0|        4|        0|       -4|
|      1|7       |      1|        2|        1|       -1|
|      1|7       |      2|        4|        1|       -3|
|      1|7       |      3|        4|        1|       -3|
|      1|7       |      4|        4|        1|       -3|
|      1|7       |      5|        3|        3|        0|
|      1|7       |      6|        4|        0|       -4|
|      1|7       |      7|        2|        2|        0|
|      1|7       |      8|        3|        8|        5|
|      1|7       |      9|        5|        1|       -4|
|      1|7       |     10|        0|        4|        4|
|      1|7       |     12|        2|        2|        0|
|      1|7       |     13|        1|        2|        1|
|      1|7       |     14|        4|        1|       -3|
|      1|7       |     15|        1|        1|        0|
|      1|7       |     16|        3|        4|        1|
|      1|7       |     17|        1|        2|        1|
|      1|7       |     18|        0|        3|        3|
|      1|7       |     19|        5|        3|       -2|
|      1|7       |     20|        3|        4|        1|
|      1|7       |     21|        2|        1|       -1|
|      1|7       |     22|        0|        3|        3|

Now we can plot the data giving us this chart for this particular episode:
![](https://storage.googleapis.com/www.chipoglesby.com/wp-content/uploads/2018/04/polarityEpisodeSeven.png)

There's more that you can do with this data, but we'll take a look at that later.

In the next post we'll dive in the transcript data and take a deeper look there.

Analyzing Frasier:

1. [Part One](/2018/04/getting-and-cleaning-data/)
2. [Part Two](/2018/04/getting-and-cleaning-dataII/)
3. [Part Three](/2018/04/getting-and-cleaning-dataIII/)
