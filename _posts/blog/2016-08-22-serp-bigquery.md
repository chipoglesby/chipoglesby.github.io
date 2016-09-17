---
author: chipoglesby
date: 2016-08-22 00:00:00
excerpt: A sql query that can be used in Google BigQuery to help you track your SEO optimization efforts.
layout: post
published: true
slug: serp-bigquery
title: 'Tracking On page SEO Changes with Google BigQuery'
categories:
- Coding
tags:
- BigQuery
---

If you are importing your data from Google Webmaster Tools via API into Google BigQuery, this script will help you visualize your SERP changes over time using dashboards or other sources.

The script will created a table using unions that compares a before and after along with the following metrics:

Impressions

* Clicks
* CTR
* Average Position
* Count of Queries
* Date

I think the best part of the script is the actual `Where` statement of the query. One thing that you’ll have to overcome is hardcoding the dates into the query. Since dates are moving targets, you can’t simply say 28 days prior to yesterday, because each day the query is ran, the date moves forward by one day. To get around that, I’ve hard coded an example date into the sql query and calculated the number of dates between that day and today. Each day the after part of the query will increment by +1 day, while the before part of the query increments by -1 date. Kind of cool, right?

If you have any feedback about how this can be improved, please let me know. Here’s the full example of the query:

<script src="https://gist.github.com/chipoglesby/983b9ecbf749e03ca54977a3bba37cd3.js"></script>
