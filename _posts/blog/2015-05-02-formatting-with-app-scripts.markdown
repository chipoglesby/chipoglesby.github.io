---
author: chipoglesby
comments: true
date: 2015-05-02 02:30:10+00:00
excerpt: Formatting your Google Sheets using Google App Scripts.
layout: post
slug: formatting-with-app-scripts
title: Format Your Google Spreadsheet Using App Scripts
wordpress_id: 28185
categories:
- Adwords
tags:
- App Scripts
---

In a follow up to yesterday's post about [how to pull Youtube Trueview metrics through the Adwords API](http://www.chipoglesby.com/2015/04/youtube-adwords-api/), this post will show you how to automatically format your spreadsheet for a more beautiful report.



This script will go in the Google Spreadsheet that you created yesterday in the Script Editor. You can access that by going to Tools > Script Editor. When you start Script Editor for the first time, you'll want to choose 'blank script' and give your project a name, something that will make sense to you in the future. You'll also need to authorize your script the first time.

You can erase the information in the Code.gs and replace it with the gist above. This app script code will do a few things. First, it will create a menu item that will allow you to click and automatically format your spreadsheet. It will also rename your spreadsheet columns to reflect the actual metric names in the Trueview columns of Adwords.
