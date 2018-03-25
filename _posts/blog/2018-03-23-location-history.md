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
- R
- analysis
---

I've been using Google's Timeline feature to track my locations since 2011
when it was called Google Latitude. When I first signed up, I thought it was an
interesting way to share your location with family and friends, but I pretty much
forgot about it until recently. I decided that it might be a good time to take
the information that Google has been gathering for the past seven years and
start a new project to see what I could learn about myself.

The first issue that I ran into is the size of the `GeoJSON` file that Google
let's you export. My exported file was around 400 MB once it was unzipped, and I don't really
want to load the entire file into `R` to work with, so I thought this would be
a great use case for Google's Cloud Platform. I could easily store the file in
Cloud Storage and then load the data into Google BigQuery's data warehouse to
analyze with `R`.

Writing `SQL` is similar to the `dplyr` package in `R`. I also get the added benefit of offloading
all of the processing power to Google BigQuery which I can run for free since I have the
[free tier of GCP](https://cloud.google.com/free/).

Today I will share the `bash` scripr that I've written to automate extracting, uploading and storing the information.

Let's take a look at the script:

<script src="https://gist-it.appspot.com/github/chipoglesby/locationHistory/blob/master/uploadToBigQuery.sh"></script>

The script above is going to do a few things for us. It will:

1. Unzip the file that we exported from Google. [Read More about the process here.](https://productforums.google.com/forum/#!topic/maps/v8iaQF_Y0fw)
2. The script will use `JQ` to parse the JSON file and save it as a newline delimited file, which is BigQuery's format for using `JSON`.
3. It will upload the file to Google Cloud Storage for long-term storage. This part uses the `gsutil` feature of the Google Cloud SDK to load the data into a storage bucket. The flag `-mq` makes the process quiet and let's you upload multiple files in parallel.
4. Finally the script upload the file from cloud storage into BigQuery for analyzing. For `BQ`, I'm using two flags: `--source_format=NEWLINE_DELIMITED_JSON` and `--autodetect`. The autodetect feature will attempt to get the schema from the JSON file and set the field names for you, which I find super helpful, especially when you have a lot of key value pairs. The other flag just identifies which type of file you're uploading. In this case it's a newline delimited file which we created in step two.

This script is written for a Mac, but could easily be rewritten for other
machines. It also uses the [Google Cloud SDK](https://cloud.google.com/sdk/), so I'm going to assume you already
have that set up on your machine locally.

In the next post, we'll dive into the data and take an initial look at things through
an exploratory data analysis using `R`.

Check out part II of [How to analyze your Google location history here.](http://www.chipoglesby.com/2018/03/2018-analyzing-google-location-historyII/)
