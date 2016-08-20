---
author: chipoglesby
date: 2016-08-21 00:00:00
excerpt: Learning to communicate clearly with others is one of most important skills to have.
layout: post
published: true
slug: analyst-communication
title: 'Skills For Analysts: Learning to Communicate'
categories:
- Coding
tags:
- learning
- BigQuery
---

I am by no means a master at the majority of the work that I do. Each day I strive to learn something new from  books or blog posts or stackoverflow or even on Twitter.

Recently I asked on slack how many people actually have their code memorized, because I personally reuse a lot of the code that I use on a daily basis. That could include:

1. Bash for processing files using sed, awk, pearl, etc.
2. R code for processing data and creating reports in markdown.
3. SQL code for running queries in Google BigQuery (which I love!!!)

I read a blog post recently about the merits of crunching code in SQL vs brining it into R and doing your analysis there. Both have their merits, but I really wanted to teach myself how to do something new.

Recently we made some SEO changes on our website. We've been recording our data from Webmaster Tools in Google BigQuery for over a year now, so we've got lots of rich data.

I simply wanted to create a table that showed a 'before' and 'after' of what we're seeing with the data. Normally I would do this in R, but I knew that it had to be possible to be done in SQL, but I ***literally had no idea of how to even Google something like this!*** I started off with something like "comparing two date ranges in SQL" but that lead me nowhere.

I knew that my end goal was a table like this:

| time | impressions | clicks | ctr | average position |
|:-----|:-----|:-----|:-----|:-----|
| before | 100 | 10 | 10% | 3.4 |
| after | 200 | 156 | 78% | 1.2 |

I had no idea how to express this idea that I had in my head. I showed a coworker who suggested using subqueries so I looked around on stackoverflow for a while, but I still couldn't find the solution that I was looking for.

I ran a query and did a join, but that spit out the data that I needed in columns instead of rows. It was tough because I could do this so easily in R with dplyr. On the drive home I realized what I wanted to do was actually a union with data from the same table. Why couldn't I think of this earlier?

The code may look something like this:

````
SELECT*
FROM (
  SELECT "before" TYPE, SUM(impressions) impressions
  FROM [dataset.table] GROUP BY TYPE),
  (SELECT "after" TYPE, SUM(impressions) impressions
  FROM [dataset.table] GROUP BY TYPE)
ORDER BY
  type DESC;
````

Knowing how to communicate your ideas and express yourself clearly goes such a long way at work. It helps you think clearly and it helps you with coding and problem solving. It also goes even further with your talking with executives or non-technical people. Sometimes the work that we do is hard to grasp. Lowering the barrier of entry when explaining complex issues to people really helps.
