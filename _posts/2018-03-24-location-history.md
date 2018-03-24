---
title: "Analyze Your Google Location History: Exploring Data"
author: chipoglesby
comments: true
date: "2018-03-24"
layout: post
slug: 2018-analyzing-google-location-historyII
excerpt: Let's analyze our Google Location History Data
published: false
categories:
- analysis
- R
tags:
- Google
- R
- analysis
---

In our [previous post](2018/03/2018-analyzing-google-location-historyI/), we
took the data that we exported from Google Maps Timeline processed it and
uploaded it to Google BigQuery for analysis.

Today we are going to do an exploratory data analysis of the information.

<script src="http://gist-it.appspot.com/github/chipoglesby/locationHistory/blob/master/data/locationExample.json"></script>

The example above is an example of the `JSON` information that we get from Google.
I should mention that I'm not an expert in GPS information, so I've tried to do
some research on all of this. If you find something wrong, you can [open a pull request](https://github.com/chipoglesby/chipoglesby.github.io/pulls) and help
me fix it.

As you can see from the file above we have a lot of rich metadata here that
we can use.

| Value | Meaning |
| :---| :--- |
| Heading | [The direction the device is traveling. ](https://transitiva.com/heading-in-gps-explained/) |
| activity.type | Here, activity could refer to multiple values. My guess is that Google is using some machine learning magic to infer what the user is potentially doing. There are many possible values. |
| activity.confidence | Here, Google is assigning a confidence interval to your activity type. The values go from low to high, 0 - 100. |
| activity.timestampMs | This is the timestamp in milliseconds for the recorded activity. |
| verticalAccuracy| This could refer to the accuracy of the verical location of the device. |
| velocity | This could refer to the speed of the device at capture time. It's probably infered based on other data points. |
| accuracy | Accuracy is Google's estimate of how accurate the data is. An accuracy of less than 800 is high and more than 5000 is low. |
| longitudeE7 | This is the longitudinal value of the observation. |
| latitudeE7 | This is the latitudinal value of the observation. |
| altitude | This could refer to the altitude of the device. I'm assuming it's measured from sealevel. |
| timestampMs | This is the timestamp in milliseconds that the observation was recorded. |

For the main values that we'll be working with: `timestampMs`, `longitudeE7` and
`latitudeE7`, these values are not in great "human readable" format, but
BigQuery can help us fix that!

In BigQuery, we can convert this `timestampMs` `1486800415000` to
`2017-02-11 08:06:55.000 UTC` using `MSEC_TO_TIMESTAMP(<value>)`. We can also
easily convert `latitudeE7` and `longitudeE7` by dividing by `1e7`. So
`481265044/1e7` becomes 48.1265044 and `116593258/1e7` is 11.6593258 giving us
the coordinates `48.1265044, 11.6593258` which is `48°07'35.4"N 11°39'33.6"E`.

If you want to read more about latitude and longitude, check out [Understanding Latitude and Longitude](http://www.learner.org/jnorth/tm/LongitudeIntro.html).
