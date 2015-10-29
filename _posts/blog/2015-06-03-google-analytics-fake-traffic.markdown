---
author: chipoglesby
comments: true
date: 2015-06-03 05:46:06+00:00
excerpt: YAY! My traffic has increased 50 bajillion percent over last month. Wait,
  what do you mean 50% of it might be FAKE? NOOO!
layout: post
slug: google-analytics-fake-traffic
title: 'Google Analytics & ''Fake Traffic'': Garbage In, Garbage Out?'
wordpress_id: 28218
categories:
- Sidenote
tags:
- analytics
---

![analytics](http://www.chipoglesby.com/wp-content/uploads/2015/06/analytics.png)I was finally excited to start blogging again after a long hiatus.
After publishing a few recent articles, I decided to check my Google Analytics account. To my surprise more than 43% of my traffic is what I would consider to be 'fake traffic'.

Jeff Sauer originally brought this to my attention in his article: [Is Google Analytics Newest Data Quality Issue the Most Challenging?](http://www.jeffalytics.com/google-analytics-data-quality-issue/)


<blockquote>If a source of traffic has extreme metrics like 100% bounce rate or 0% bounce rate, it is usually non-human traffic. The same goes for 100% new visitor rates or 1.00 average page views. Humans don’t behave this way en masse, but these numbers are possible when computers visit your website.</blockquote>


Now, originally I was excited to see my traffic grow and I thought surely it was from all of the amazing content I've been writing. I was wrong. For sites that average less than 1,000 users per month, this can be a big problem!

I work mainly in verticals for nonprofits, automotive, publishing and e-commerce. None of these verticals are immune to this problem. For sites that average more than 10,000 users per month, you would never notice this traffic, it's just a blip on the radar. It does however raise bounce rate since most of this 'fake traffic' is 100% bounce.

Below is a screenshot of what this fake traffic might look like.

![analytics2](http://www.chipoglesby.com/wp-content/uploads/2015/06/analytics2-1024x408.png)


## How to fix this problem in Google Analytics


Ask three people how to solve this and you'll always get a different answer.

**Option one:** Create a new view and add a filter that excludes traffic that does not equal your sites url. If you have multiple domains, you can use a regular expression to quickly choose all. It's always a best practice according to Google to have one view in Google Analytics that has no filter attached. It's up to you.

**Option two:** If you have hundreds of Google Analytics accounts, you can write a short python script that will automatically create a filter that excludes hostnames that do not match a given hostname. I won't go into the particulars of exactly how to do this, but I will share the code later. This option is best if you have a very large number of accounts that you have access to. Again, it's not a best practice to have filters attached to your only view. Again, it's up to you.

**Option three:** This is probably the easiest option. You can create an advanced segment in Google Analytics, labeled 'Fake Traffic'. You can set it to exclude traffic to the hostnames that do not contain your hostname. If you need help, [I've created one for you here](https://www.google.com/analytics/web/template?uid=103oTUNPSgW35YUjCeCfOQ). Just replace the hostname with your websites url.



## Wrap-up


Right now this is not a problem. One day it very well could be a problem. It wouldn't be hard to build a webscraper that pulls in the UA-ID and sets the hostname as your url. Once that happens, we'll have a much more difficult time distinguishing real traffic from this 'fake traffic'.
