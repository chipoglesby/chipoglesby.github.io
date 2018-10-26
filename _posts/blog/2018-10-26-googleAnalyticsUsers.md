---
title: "Questions for Google Analytics: How many users were on my site?"
author: chipoglesby
comments: true
date: "2018-10-26"
layout: post
slug: google-analytics-questions-users
excerpt: If you have Google Analytics data in BigQuery, sometimes its fun just to ask questions.
published: true
categories:
- coding
tags:
- Google Analytics
- BigQuery
---

There are a lot of really neat things that you can do with your Google Analytics
data if you're a Google Analytics Premium customer.

There are also times when you just want to ask your data questions without 
having a full-blown analysis in mind.

Recently I wanted to know "How many users are on my site at any given minute?"

Google Analytics does provide a real-time dashboard that you can monitor during
special events, but since you can't watch it 24/7/365, I thought it would be
fun to run an analysis in BigQuery.

The 
[GA export schema](https://support.google.com/analytics/answer/3437719?hl=en)
doesn't provide you with a timestamp for each hit, so it's something that
we'll need to calculate in our SQL query.

To calculate the timestamp for each hit, we'll use `visitStartTime` and 
`hits.time`. The `visitStartTime` tell us the start time of each users session
and `hits.time` will tell us the number of seconds after the visit start time
when that hit occurs. Our formula will be: `visitStartTime+hits.time/1000`. 
This will convert our output to seconds which we will cast as an `INT64` using
`SAFE_CAST`, we'll then convert that to `TIMESTAMP_SECONDS` and format it to 
minute using `FORMAT_TIMESTAMP('%Y-%m-%dT%H:%M')`.

With this calculation done, we can then do a count distinct of the 
`fullVisitorId`, grouping by the minuteTimestamp. If you want to scan all of 
your partitioned tables in bigQuery, we can simply use a wildcard operator `*`.

For faster results you could also order by `userCount DESC` and limit the 
results to 10.

The full query is below, you'll just need to change the `xxx` values for your 
own table.

```
SELECT
  FORMAT_TIMESTAMP('%Y-%m-%dT%H:%M', 
  TIMESTAMP_SECONDS(SAFE_CAST(visitStartTime+hits.time/1000 AS INT64))) minuteTimestamp,
  COUNT(DISTINCT fullVisitorId) userCount
FROM
  `xxx.xxx.ga_sessions_2018*`,
  UNNEST(hits) hits
GROUP BY
  minuteTimestamp
ORDER BY
  userCount DESC
LIMIT
  10
```

If you want to take this further in `R` you could create a line chart of users
by minute using `tidyverse` and `lubridate` to visualize your results.

**How is this information useful?** This information might be helpful to someone
who is trying to figure out how many users your website could handle at any
minute before it crashes from being overloaded.
