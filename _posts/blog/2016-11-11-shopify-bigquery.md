---
author: chipoglesby
date: 2016-11-11 09:30:00
excerpt: A simple shell script that uploads data from Shopify's API into Google BigQuery
layout: post
published: true
slug: shopify-bigquery
title: Importing Shopify data into Google BigQuery
categories:
- Coding
- Automation
tags:
- BigQuery
---

Lately I've been using the command line more and more at work. Normally when I
work with API's for data that needs to be imported to BigQuery, I'll use Google
Apps Script. I thought that working with the
[Shopify API](https://help.shopify.com/api/reference/order) would be a fun way
of experimenting with doing this through the command line.

Calling the API is as simple as doing a `curl` statement with your parameters
included. When I was working through this solution to begin with, I knew that
creating a json file that was formatted in BigQuery's new line delimited format
might be an issue. Luckily, there's an open source solution called
[`JQ`](https://stedolan.github.io/jq/) on Github that you can use. `JQ` is like
sed for JSON data and makes parsing JSON super easy. With a simple `-c`
statement, you can easily create a new line delimited json file. From there you
can traverse through your code to find the items you need, using a command
like `'.results[]'`.

From there you can set up a cronjob that calls the api every minute and gets
the most recent updated file. For me since BigQuery is append only, I just
called the API with an `updated_at` parameter and append everything to the
dataset.

Also, the Shopify feed is 483 different nested and repeated key:value pairs in
the JSON feed. That means you'll end up with 483 columns in your table. I took
me a while to hand code the entire JSON format for the data, but I would hate
for someone to have to do that again, so I'm sharing it with you.

The example code below is designed to run every minute. If the file will be
written with the current iso8601 timestamp such as `2016-11-11T09:30:00Z.json`.
 Each time the script runs, if the file size is greater than zero, it sends a
  copy to Google Cloud Storage and then uploads the results to Google BigQuery.
   If the file size is equal to zero, then the script will stop.

<script src="http://gist-it.appspot.com/https://github.com/chipoglesby/shopifyToBigQuery/blob/master/shopify.sh"></script>

If you want to use the code, you can find the code here for
[importing shopify data into Google BigQuery](https://github.com/chipoglesby/shopifyToBigQuery).

If you want to use this code yourself, you need to make sure that you have the
[Google Cloud SDK](https://cloud.google.com/sdk/) on your local system or
run your code on a small
[Google Compute Engine Instance](https://cloud.google.com/compute/).
