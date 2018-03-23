---
title: "Analyze Your Google Location History: Getting and Loading Data"
author: chipoglesby
comments: true
date: "2018-03-23"
layout: post
slug: 2018-analyzing-google-location-historyI
excerpt: Let's take a look at the Google's Timeline History to see what we can learn
published: true
categories:
- analysis
- R
tags:
- Google
- GPS
---

I've been using Google's Timeline feature to track my locations since 2011
when it was called Google Latitude. When I first signed up, I thought it was an
interesting way to share your location with family and friends, but I pretty much
forgot about it until recently. I decided that it might be a good time to take
the information that Google has been gathering for the past seven years and
start a new project to see what I could learn about myself.

The first issue that I ran into is the size of the `geoJSON` file that google
let's you export. Mine was around 400 MB once it was unzipped, and I don't really
want to load the entire file into `R`  to work with, so I thought this would be
a great use case for Google's Cloud Platform. I could easily store the file in
Cloud Storage and then load the data into Google BigQuery's data warehouse to
analyze with R.

Writing `SQL` is similar to the `dplyr`. I also get the added benefit of offloading
all of the processing power to Google BigQuery which I can run for free since I have
free trial version.

Today in the first part of the post, I'm sharing the `bash` scrip that I've written
to automate extracting, uploading and storing the information.

Let's take a look at the script:
<script src="http://gist-it.appspot.com/https://raw.githubusercontent.com/chipoglesby/locationHistory/master/uploadToBigQuery.sh"></script>

The script above is going to do a few things for us. It will

1. Unzip the CSV file that we exported from google
2. The script will use `JQ` to parse the JSON file and save it as a newline delimited file, which is BigQuery's format for using `JSON`.
3. It will upload the file to Google Cloud Storage for long-term storage.
4. Finally the script upload the file from cloud storage into BigQuery for analyzing.

This script is written for an Mac, but could easily be rewritten for other
machines. It also uses the Google Cloud SDK, so I'm going to assume you already
have that set up on your machine locally.

In the next post, we'll dive into the data and take an initial look at things through
an exploratory data analysis using `R`.
