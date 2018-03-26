---
title: "Analyze Your Google Location History: Time & Distance"
author: chipoglesby
comments: true
date: "2018-03-25"
layout: post
slug: analyzing-google-location-historyIII
excerpt: Let's analyze our time and distance data from our Google Location History
published: false
categories:
- analysis
- R
tags:
- Google
- R
- analysis
---

This is part three in my series. You can find
[part one here]((2018/03/2018-analyzing-google-location-historyII/) and
[part two here](2018/03/2018-analyzing-google-location-historyII/).

In my last post, I did an exploratory data analysis of my Google location
history.

One of things that I wanted to calculate and measure is the difference between
different coordinates. For example, how far is it between
`48.1265044, 11.6593258` and `40.555608, -105.098397`? It turns out that
answering that question is a bit harder than I originally guessed. As you know
the earth isn't flat (some people would have you believe otherwise) so measuring
the distance between two points when using latitude and longitude will have to
be done using the [Haversine Formula](https://www.movable-type.co.uk/scripts/latlong.html).

I'm not going to pretend to understand the trigonometry that goes into
calculating this, so the best way that I can explain it is measuring
"[as the crow flies](https://en.wikipedia.org/wiki/As_the_crow_flies)."

Okay, so how do we convert that to something usable in `SQL`? Well, it turns out
that [Felipe Hoffa has a solution for this on Stackoverflow](https://stackoverflow.com/a/42068683).

```
SELECT
  lat,
  lon,
  name,
  (111.045 *
   DEGREES(ACOS(COS(RADIANS(40.73943)) *
   COS(RADIANS(lat)) *
   COS(RADIANS(-73.99585) -
   RADIANS(lon)) +
   SIN(RADIANS(40.73943)) *
   SIN(RADIANS(lat))))) AS distance
FROM
  [bigquery-public-data:noaa_gsod.stations]
HAVING
  distance > 0
ORDER BY
  distance
LIMIT
  4
```

While this is good for calculating a fixed point, I want to calculate the
distance between each previous point. For this, I'll use `LAG()` and `OVER()`
and then rewrite the
[Haversine Formula](http://www.plumislandmedia.net/mysql/haversine-mysql-nearest-loc/) to
properly calculate the distance (I think). I also changed `111.045` to `69.0` to
convert kilometers to miles.

Here's my example:
<script src="http://gist-it.appspot.com/github/chipoglesby/locationHistory/blob/master/code/haversineExample.sql"></script>

Since there are `1,770,882` observations, I have no freaking clue how long it
would take `R` to run through something like this, with BigQuery, the query
is done in `13.3` seconds. That's blazing fast!

Now that we have calculated distances between observations, let's import it into
`R` and do some analysis.

1. How many miles did I travel between 2011 and 2018?
  * 654,572.32 miles. *Is that even possible?*
1. How many miles did I travel by type?

|activityType    |  distance|       n|
|:---------------|---------:|-------:|
|NA              | 333929.56| 1065401|
|still           | 213682.44|  546932|
|in vehicle      |  55706.42|   33148|
|tilting         |  32686.28|   65019|
|unknown         |  10505.78|   35268|
|on foot         |   6513.16|   15490|
|on bicycle      |   1268.23|     866|
|exiting vehicle |    280.45|     963|

Judging by the distance and the count of observations lets dive
deeper into `NA` and `still` which comprise the largest number of observations.

Originally I thought the discrepancy could be from the GPS in my phone trying
to locate itself by triangulation. It could be that Google's algorithm wasn't
able to properly figure out what I was doing. Here's an example from one night
during one hour:

|activityType |  n| distance|
|:------------|--:|--------:|
|in vehicle   |  6|     6.25|
|tilting      |  5|     1.38|
|NA           | 16|     0.94|
|unknown      |  8|     0.46|
|still        | 16|     0.19|
|on foot      |  2|     0.05|

Other questions:
1. What was the most popular activity by hour of day?
2. How did my movements change over time?
3. What days of the week were most popular for activities?

## Time is of the essence
I'm also intrigued by the idea of "time" with all of this information.
I think that it's fascinating that Google is able to harness this information
to do things like:

* Tell you when to leave for work and arrive on time based on traffic patterns
* Tell you the most popular visited times for restaurants.
* Tell you your average commute times at any given time.
* Suggest what you should listen to based on your current location.

Additionally, I've used some simple `CASE` statements to augment the provided
information to give us seasons based on dates and part of day based on hour.

Let's look at some of that information:
