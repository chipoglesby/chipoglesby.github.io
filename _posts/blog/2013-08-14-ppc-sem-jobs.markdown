---
author: chipoglesby
comments: true
date: 2013-08-14 03:08:29+00:00
excerpt: Visualizing jobs from indeed.com using Indeed's API and importXML with Google
  Spreadsheets.
layout: post
slug: ppc-sem-jobs
title: What state has the most PPC & SEM job listings?
wordpress_id: 27887
categories:
- Journalism
tags:
- data
- visualization
---

I've been on the job hunt for a new PPC/SEM position recently. After filling out dozens of applications I decided to see if I could visualize the locations of the jobs I've been applying for.

I signed up for an indeed API account and used the [IMPORTXML function in Google Spreadsheets](https://support.google.com/drive/table/25273?page=table.cs&ctx=tooltip&rd=1) to come up with the following visualizations.

The first visualization shows job listing density by state. I first created a pivot table and did a count unique of Job Titles, but I realized there were a lot of overlapping titles. I then realized that the XML from the API returns a unique job key for each listing so I used that instead.[![PPC jobs by State](http://www.chipoglesby.com/wp-content/uploads/2013/08/jobsstate.png)](http://www.chipoglesby.com/wp-content/uploads/2013/08/jobsstate.png)

Of 300 jobs posted between May and August of this year; 76 jobs were listed in California, 35 in New York, 22 in Illinois and 20 in Texas.

Top cities included by number of lisitings: New York City - 25, Chicago - 11 and San Diego - 10.

The XML from the API also returns a longitude and latitude for each post so I visualized each job key across cities. It's interesting to see that there are some states in the US with no job listings for PPC or SEM roles. I wonder why?

[![PPC jobs by location](http://www.chipoglesby.com/wp-content/uploads/2013/08/jobslocation1.png)](http://www.chipoglesby.com/wp-content/uploads/2013/08/jobslocation1.png)
