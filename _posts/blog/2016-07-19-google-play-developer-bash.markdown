---
author: chipoglesby
comments: true
date: 2016-07-19 04:08:11+00:00
excerpt: Since you can't natively upload files from the Google Play Developer Console,
  I've written a shell script to help me automate that on a monthly basis.
layout: post
link: http://www.chipoglesby.com/2016/07/google-play-developer-bash/
slug: google-play-developer-bash
title: Upload your Google Play Developer Reports Using A Shell Script
wordpress_id: 28331
categories:
- Coding
tags:
- bash
- BigQuery
- Google
---

[![Denver Trip 2014](https://c3.staticflickr.com/6/5271/14066190146_4266db8596.jpg)](https://www.flickr.com/photos/chipoglesby/14066190146/)This bash shell script will automatically upload your installation reports for all apps in your Google Play Developer Console. You'll need to replace {YOUR_BUCKET_GOES_HERE} with your own google cloud bucket which you can find in the developer console.

These reports are only available on a monthly basis, so you could set up a cronjob to run on the first of every month to download reports from the previous month.

There are eight overall reports. The most important is probably the overview report. The full list is:




 	
  * overview

 	
  * carrier

 	
  * country

 	
  * device

 	
  * language

 	
  * os_version

 	
  * app_version

 	
  * tablets



These are the following steps for the script:


 	
  1. Create a directory for the month, 201607 for example.

 	
  2. CD (change directory) into the month folder and create directories for the variables in the array.

 	
  3. CD into the new directories and create an upload directory.

 	
  4. Download the current files, trim them and append it to a file in the upload folder.

 	
  5. Using the [gcloud alpha bigquery function](https://cloud.google.com/sdk/gcloud/reference/alpha/bigquery/), upload files to the corresponding dataset and table in Google BigQuery. You'll also need to create a folder with a schema file for all of your uploads.

 	
  6. Change {YOUR_GS_BUCKET} to your GCS bucket and then upload the root folder to your google cloud storage folder.




