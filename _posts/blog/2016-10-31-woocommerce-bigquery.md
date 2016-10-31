---
author: chipoglesby
date: 2016-10-31 00:00:00
excerpt: A simple tutorial to use a shell script to upload data from a Woocommerce API and push it to Google Bigquery.
layout: post
published: true
slug: woocommerce-bigquery
title: 'Upload Your Woocommerce data to Google BigQuery with a Shell Script'
categories:
- Coding
tags:
- BigQuery
---
Here's a good way to upload data from an ecommerce store's API using hourly updates. Here's what I did.

You can easily run this code on a linux based machine or Google Compute Engine using an hourly `crontab`.

For the two files below, I created a folder for them to both go into.
The first script uses `jq`, a command line processor. Since Google BigQuery only accepts new-line delimited JSON files, you can use `<a href="https://stedolan.github.io/jq/">jq</a>` and set the -c flag to convert the results to that format.

<script src="https://gist.github.com/chipoglesby/415996b66e5bec76d29e3934b97ef75c.js"></script>

You'll need to update the `xxxx` information with your own data.

This JSON file below is the actual schema you'll use in your BigQuery table.

<script src="https://gist.github.com/chipoglesby/91b7e1515ed1268cd75e8ae7f9ec9949.js"></script>
