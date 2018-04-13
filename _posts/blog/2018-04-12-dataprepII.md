---
title: "Text Analysis: Part II More Adventures in Cleaning Data"
author: chipoglesby
comments: true
date: "2018-04-12"
layout: post
slug: getting-and-cleaning-dataII
excerpt: Round two of preparing unstructured text data for analysis.
published: true
categories:
- R
- coding
tags:
- R
- coding
- Frasier
---

In my [previous post](http://www.chipoglesby.com/2018/04/getting-and-cleaning-data/)
 we took a look at a couple of different ways to parse unstructured text from
the internet and prepare it for analysis in R using `tidytext`.

Yesterday evening I took a look at the `subtools` package in `R`. It looked like
a promising tool that lets you format and analyze subtitles.

Here's a raw example of the subtitle information from season one, episode one:
```
1
00:00:08,842 --> 00:00:11,220
Listen to yourself, Bob!

2
00:00:11,221 --> 00:00:15,284
You follow her to work, you eavesdrop on her calls, you open her mail

3
00:00:15,285 --> 00:00:18,994
The minute you started doing these things, the relationship was over!

4
00:00:19,574 --> 00:00:20,720
Thank you for your call.

5
00:00:23,487 --> 00:00:25,282
Roz, I think we have time for one more?
```
Which is a lot different than yesterday's example:
```
Frasier: Listen to yourself, Bob!  You follow her to work, you eavesdrop on her
calls, you open her mail.  The minute you started doing these things, the
relationship was over! Thank you for your call. Roz, I think we have time for
one more?
```
`subtools` does a great job of parsing data into a data frame with a result like:

|ID |Timecode.in  |Timecode.out |Text                                                                  | season| episode_num| speakingTime|
|:--|:------------|:------------|:---------------------------------------------------------------------|------:|-----------:|------------:|
|1  |00:00:08.842 |00:00:11.220 |listen to yourself, bob                                               |      1|           1|     2.75e-05|
|2  |00:00:11.221 |00:00:15.284 |you follow her to work, you eavesdrop on her calls, you open her mail |      1|           1|     4.70e-05|
|3  |00:00:15.285 |00:00:18.994 |the minute you started doing these things, the relationship was over  |      1|           1|     4.29e-05|
|4  |00:00:19.574 |00:00:20.720 |thank you for your call                                               |      1|           1|     1.33e-05|
|5  |00:00:23.487 |00:00:25.282 |roz, i think we have time for one more                                |      1|           1|     2.08e-05|
|6  |00:00:25.283 |00:00:26.571 |yes, dr crane                                                         |      1|           1|     1.49e-05|

I manually added the `speakingTime` column and I've reached out to the author
of the package to see if this might be usable in some format, but currently I don't think
I'll be able to use it.

If I just wanted to do a sentiment and text analysis on the words alone and not
include any character information, then the subtitle information would be all I
need.

The goal though, is to replicate yesterday's example of the visualization from
'The Office'.

After downloading the data from the internet and getting it in `R`
I thought of creating a key and attempting to join the to data frames together.
I would take a string like:

`Hello Russel. This is Dr. Frasier Crane; I'm listening.`

making it:

`hellorussellthisisdrfrasiercraneimlistening`.

This worked for some of the data, but not all. Once the episode and subtitle
datasets were combined, I was left with a dataframe of ~315,000 observations.
This was mainly created from cartesian products since I was only joining on
the "key" I created. Most of those cartesian products were from single word
lines such as what, yes, thank you, hello, oh and no for example.

In theory, I should have been able to use the key to get the season and episode
from the subtitle information to give me a bit more metadata.

Since I couldn't join on key, season and episode, I had to go back to the
drawing board. What else can I do?

Going back to `bash` I realized that I already the season and episode
information conviently stored as the name of each text file. `0101.txt` will
give me season 1, episode one, so let's set something up in bash.

Here's what I've come up with:

```
seasonShow=$(echo "${filename##*/}" | sed "s/.txt//g")
sed "s/.*/&\,\"$seasonShow\"/" >> ../data/csv/lines.csv
```
This is going to do two things. `seasonShow` will get the filename with `sed`
and the second sed command will add to the output of each line as a new column
for my pseudo csv file.

Later on in `R`, I'll uses dplyr's mutate to create columns based on that
new information:

```
episodes %<>%
mutate(season = as.integer(substr(seasonEpisode, 0, 2)),
       episode = as.integer(substr(seasonEpisode, 3, 4)))
```

Now we're getting closer to a product that we can finally start to analyze.
There's still more text clean up that needs to be done, but I'm feeling pretty
good so far!

I've been working on a couple of examples because I just can't keep my hands off
of the data.

Here's an example of spoken lines between men and women (all characters) in the
show throughout the seasons.

![](https://storage.googleapis.com/www.chipoglesby.com/wp-content/uploads/2018/04/sexes.png)

If you're interested, here's the counts of characters that were not `NA`. I used
the `gender` package to create this information. There was also some manual
tweaking that needs to be done. Once the text has been cleaned, we should
see a minimal number of `NA's`.

| Gender | Unique Character Count |
|:---|:---|
| Female | 247 |
| Male   | 285 |

The counts are pretty close, so there's not an imbalance of male to female
characters. There is a rise in women's dialogue towards the end of the show,
which *could* be attributed to Fraiser's love interest with Julia Wilcox in
seasons 10 and 11 or his desire to settle down.

Analyzing Frasier:
[Part One](/2018/04/getting-and-cleaning-data/)
[Part Two](/2018/04/getting-and-cleaning-dataII/
