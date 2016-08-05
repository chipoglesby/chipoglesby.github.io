---
author: chipoglesby
comments: true
date: 2016-06-03 19:59:50+00:00
excerpt: How I import Google Analytics data into BigQuery using Google Apps Script.
layout: post
slug: analytics-bigquery
title: How to send your Google Analytics data to BigQuery with Apps Script
wordpress_id: 28306
categories:
- Coding
tags:
- BigQuery
- Google
- google analytics
- google apps script
---

_Background_: Recently at work I've been leading a team that will be building a new data warehouse in [Google BigQuery](https://cloud.google.com/bigquery/). Part of the decision to move to BigQuery was the amount of information that we deal with on a daily basis and our ability to access it quickly. Given all of the channels that have robust API's, we wanted to standardize how we collect, analyze, report and present our data.

When I am working with Google Analytics, I use RStudio and [Artem Kelvtsov's RGA package.](https://github.com/artemklevtsov/RGA) Recently though we've begun to do more in-depth analysis that can sometimes return sample data and in these situations we want to be as accurate as possible. I've been able to sidestep a lot of these issues by uploading my Google Analytics data to BigQuery using Google Apps Script.

In the world of Big Data, I consider Google Apps Script (GAS) the lonely forgotten child. Instead of building a Python app that sits on Google App Engine (also a free option), I can easily write a function in GAS, apply a timer and go on my merry way. GAS is a free, easy to use option inside of Google Drive that will let you do pretty much anything you can dream of. We've used it to make everything from custom url builders to form collectors and even simple reporting tools in Google Sheets.

The Github Gist below should serve as a starting point if you want to import your Google Analytics data into BigQuery. You should note that you will not get the same information as what you would get with [Google Analytics premium](https://support.google.com/analytics/answer/3437618?hl=en).

In this script, you'll need to set the following items for your own project:

  1. Project ID for Google Cloud
  2. Dataset ID for Google Cloud
  3. Table ID for Google Cloud
  4. Your Google Analytics ID which you will find under "View Settings." It will be called View ID and you should make sure that ga: is prepended to your ID.

This script in particular is triggered to run every 24 hours and will only pull the information from the previous day. You can change your metrics and dimensions as needed to suit your own reporting needs. In the example I've provided, for an ecommerce site, this will give you a good start on most of your basic reporting needs. Sometimes you will run up against dimensions and metrics that cannot be queried together and for those instances, you'll have to write a different script.

One thing you will notice is this line: 'date': responseData.rows[i][0].replace(/(^[0-9]{4})([0-9]{2})([0-9]{2})/g,"$1-$2-$3T00:00:00Z"), Google Analytics by default prints the date as "20160601" instead of an iso8601 timestamp option. This regex will reformat the date so that you can import it as a timestamp into BigQuery. It does set the time to 00:00:00, but for me that isn't as important.

Once you've got your information into BigQuery, you can use [Mark Edmondson's BigQueryR package](https://github.com/MarkEdmondson1234/bigQueryR) to do your analysis in R.

One thing worth mentioning is that you'll need the following items:

  1. A Google Analytics account that's receiving live data.
  2. A Google Drive account with Apps Script enabled.
  3. A Google Cloud Account with billing enabled and one active project.
  4. This script also assumes that you already have a dataset and table set up for your Google Analytics data. If not, you should either create one by hand or you'll need to write a GAS that creates the table for you and add it to the logic of your own script.
