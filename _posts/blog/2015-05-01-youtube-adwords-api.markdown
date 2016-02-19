---
author: chipoglesby
comments: true
date: 2015-05-01 02:17:01+00:00
excerpt: A quick and painless way to pull key Trueview metrics through the Adwords
  API.
layout: post
slug: youtube-adwords-api
title: How to pull Youtube Metrics from the Adwords API
wordpress_id: 28182
categories:
- Adwords
tags:
- Adwords scripts
---

I love the integration of Youtube with Google Adwords. Unfortunately you're not currently able to pull all Youtube metrics through the Google Adwords API, but you are able to pull some.

While working in R recently, I was pulling some reports using the Adwords API and the [Budget Performance Report](https://developers.google.com/adwords/api/docs/appendix/reports/budget-performance-report). This is the only time that I've seen any data from Youtube in the Adwords API reports.

In the script below, we're going to query the Budget Performance Report and return the Campaign Name, Impressions, Views, View Rate, Cost Per View, Cost, Converted Clicks and View Through Conversions.

The first thing that you'll notice is that the API will actually return the following names: AssociatedCampaignName, Impressions, Clicks, CTR, Average CPC, Cost, Converted Clicks and View Through Conversions. Don't worry, these metrics are still the same. In tomorrow's post, I'll show you an easy Google App Script code that will automatically change the names for you.

The script:

<script src="https://gist.github.com/chipoglesby/5c1263d6ea2729adbc42.js"></script>

In the script above, you'll want to add your own Google Spreadsheet URL in Google Drive so that you have a place to record all of your metrics. The script will currently create two tabs, one for this month and one for last month. If you want to change the name of the tabs, search and replace any mention of ABC123.

The other important piece that you'll need to change is on line 84: return 'where AssociatedCampaignName CONTAINS ABC_YOUTUBE AND Clicks > 1'. This actually tells the Adwords Script what the name of your Youtube Campaign Is. You'll want to replace ABC_YOUTUBE with your own campaign name. In my current job we use a job order code, so the campaign name will always contain a certain set of characters so we don't have to update the script each month. You might want to consider using something like "Youtube" in your campaign name so that it's easier to find.
