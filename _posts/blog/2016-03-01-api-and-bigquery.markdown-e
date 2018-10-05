---
author: chipoglesby
comments: true
date: 2016-03-01 05:25:40+00:00
excerpt: In this post, we'll look at how to use Google Apps Script to query an API, parse the results and upload the information to BigQuery.
layout: post
slug: api-and-bigquery
title: 'How to: Query an API and send the results to Google BigQuery with Apps Script'
wordpress_id: 28288
categories:
- Coding
tags:
- BigQuery
- google apps script
---

Recently we started exploring [Google's BigQuery](https://cloud.google.com/bigquery/) at work as an option for a data warehouse. My favorite aspect of BigQuery [is speed](https://www.youtube.com/watch?v=LSLU8Gxt-rc)! It can query 30 terrabytes in under six minutes. Good luck doing that with SQL Server.

BigQuery is also favorable because of the R package [bigrquery](https://github.com/rstats-db/bigrquery). It makes importing and querying data very easy.

Google also offers [Cloud Dataflow](https://cloud.google.com/dataflow/), which can be used as an ETL (extract, transform & load) function, but I'm not that familiar with Java, so I turned to something that I could whip up a bit more quickly: [Google Apps Script](https://developers.google.com/apps-script/).

The script embedded below is pretty simple. In this example I'm using the [CallRail API](http://apidocs.callrail.com/) to pull in information, parse it and write it to BigQuery.

This script is set up to pull in all of the pages and then it loops through each page, pulls out all of the call information, pushes it to an empty array and repeats the process until it's done. It took about five minutes for the script to run for me to run through 6,000 rows of data.

Since Google Apps Script is web-based, you can set up time based triggers to run at any given time. I've modified my own script a bit and set it to run every morning between midnight and one am, pull yesterday's information and append it to the BigQuery table.

If you decide to run this, here's what you'll need:




  1. Your own Google Cloud Project with the BigQuery API enabled


  2. You'll need billing enabled for your project


  3. You'll need to create your own table and set the schema prior to loading data. You can do that with [Apps Script](https://developers.google.com/apps-script/advanced/bigquery) as well.


  4. In your Apps Script project, you'll also need to enable the BigQuery API under Resources > Advanced Google Services.


  5. Follow the directions below and replace the 'xxx' with your own information.


  6. This script can be used to query other API's and you'll have to figure that our yourself.

<script src="https://gist.github.com/chipoglesby/a9c821eec94fb72ba40a.js"></script>

If you see any way that this script can be improved, please feel free to fork the gist and share your new version with me!
