---
author: chipoglesby
comments: true
date: 2015-02-10 04:51:40+00:00
excerpt: Sometimes there is no easy answer to a problem. Let's take a look at why.
layout: post
slug: hard-vs-harder
title: Doing things the hard way vs the harder way
wordpress_id: 28170
categories:
- sidenote
tags:
- semantics
---

It's always easy to think of things in terms of extremities:



	
  * Light vs Dark

	
  * High vs Low

	
  * Soft vs Firm

	
  * Easy vs Hard


But sometimes we don't have these extremes. Sometimes things might be difficult vs more difficult or hard vs harder. Let me give you a thought experiment:

The thought experiment summary:

	
  1. You have a business name and city/state but no address

	
  2. You have locations but no physical corrdinates

	
  3. You need to know the distance between the business and location

	
  4. There are thousands of these combinations

	
  5. You need to categorize them by the distance between each.

	
  6. In aggregate you need to show how the categories perform collectively across hundreds of businesses.


**_BEGIN_**
You run a successful PPC campaign for your clients and you want to answer a simple question: "How far can I extend my location radius before it becomes useless? Five miles? 10 miles? 20 miles? Depending on how you have your locations set up, this could be easy to answer. Let's assume that you have a mixture of cities, zip codes and radius targeting.

That may look something like:



	
  * Asheville, NC

	
  * 28803

	
  * 10 miles around 35.538932,-82.5654054


First you'll want to decide what program you want to tackle this with. Your two main options are R or Google Spreadsheets. Each has it's advantages, but let's look at a spreadsheet for right now. To start with, you'll have a spreadsheet with two columns: 1. Business Name 2. City and State. Your goal is to figure out how to get the physical address of this business and paste it into a third column on the spreadsheet.

You have three options:

	
  1. Look up the web address of each business, go to their website and look for their contact information, copy and paste. It could be on any page, anywhere on site.

	
  2. Look at the business listing on the search engine result page, copy and paste.

	
  3. Write a small script that will query an API and return a possibly correct result (if there's not more than one business, think grocery stores.)


In this experiment, you don't know what the address is. The number of businesses is also so large that you probably don't want to do it by hand or pay an intern to do it for you. What do you do?

If you choose option three, you'll soon realize that it's more daunting that you originally thought. The easiest option is to use the Google Maps Javascript API, but that [won't return a business' physical location](https://developers.google.com/maps/faq#geocoder_queryformat). You could possibly use a third-party service API like Yelp for example, if that business exists in their database.

You could also write a web scraper to look for business listings under organic search results, but those queries are sometimes changed with the inclusion of Google's Knowledge Graph.

After you get the proper address of each business listing. You'll then need to go into Google Adwords either manually or programatically via the API (that you have to register for) and using the GEO_PERFORMANCE_REPORT to pull the Region and Most Specific Location along with all of the data you need to make your decision.

Following this, you'll need use the Google Map's Javascript API to get directions and return a driving distance between the most specific location and the business address. *Remember, the most specific location is not an exact location.

Once you've done all of this, you'll need a fourth column that tells you if this distance falls within these parameters:



	
  * Less than five miles away

	
  * Between five and ten miles

	
  * Between 10 and 20 miles

	
  * Between 21 and 30 miles

	
  * Between 31 and 40 miles

	
  * Between 41 and 50 miles

	
  * More than 50 miles


Then you'll be able to finally aggregate all of your account data together to decide what the best use of location targeting would be.

To throw a wrench in things, your boss comes back to you and tells you that it would be great to know the breakdown of products with these results.

Other things to consider:

	
  1. You also need this to be reproducible so it can be done on a monthly and yearly basis.

	
  2. You also need this to be updated as new businesses are added to your list at any point in time.


So, how do you tackle this? Do you do it the hard way or the harder way?
