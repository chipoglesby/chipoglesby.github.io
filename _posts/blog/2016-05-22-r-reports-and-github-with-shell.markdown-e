---
author: chipoglesby
comments: true
date: 2016-05-22 06:00:37+00:00
excerpt: In this post, I'll share how I use a shell script to automate some of my Github Flow work.
layout: post
slug: r-reports-and-github-with-shell
title: Automating reports in R and version control with a shell script
wordpress_id: 28300
categories:
- Coding
tags:
- automation
- data
---

Working as a data scientist at my job, I get to come up with interesting ways of trying to automate parts of my job that could be tedious. The majority of my work is done in R with Rstudio and I use version control with Github.

Until recently learning about [Github Flow](https://guides.github.com/introduction/flow/), I usually just make commits to my repos on the master branch (**_YIKES!_**). It seemed easy enough at the time, but when I started going back through to try to find an old version of something, I had a hard time finding it.

There are normally two main things that I push to my Github repo

  1. Commits that I make to my code for improvements and tweaking.
  2. Markdown based analysis reports that I knit together.

I put much more thought into the first set of commits than I do for reports. When I'm making improvements or changes to my R code, I'll create a new working branch, commit changes, go to Github and painstakingly create a pull request for myself with the changes that I'm planning to make. It's kind of like planning to be on a team, but I'm really just working by myself.

For the second set of commits for an analysis, I want to automate the heck out of those! Who wants to create a tedious pull request each week when running reports? Not me!

So here's the process that I went through to create the shell script.

I started with an idea of how I wanted to each pull request for new reports to look. They would need to say something along the line of "Running reports for 05-21-16."

That's simple enough. I could set a variable like **reportDate=$(date +%m-%d-%y-reports)**. It took me a while to figure out how to print the date the want I wanted in terminal. Not too hard, just figuring out what to ask Google.

I knew that I would want to to use the report date variable over again, which is why it's set as reportDate. Now I can create a new branch to match with
**git branch $reportDate**
**git checkout $reportDate.**

I would then use rscript to automatically fetch the data and create the necessary reports for individuals, _I'll have more on this interesting process later_. The script would then add and commit files with a specific message like: "**Running weekly reports for $(date +%m-%d-%y)**", using the date feature again, then it pushes the commit to Github. You can test this in your terminal by running echo **Running weekly reports for $(date +%m-%d-%y)**

The script then uses [hub to automatically issue a pull request](https://github.com/github/hub). The script will then checkout the master branch, merge the two branches with a message and push it back to Github, automatically closing the pull request. Finally I delete the local and remote branches from my system and remove unnecessary local files.

If I were working on a team I probably wouldn't recommend this and for an individual, it's probably overkill, but it helps me keep track of things in case I need to find old markdown files for someone.

My plans for next week are to build a system that uses [Github hooks to automatically deploy these files and build a static reporting site with Jekyll](https://jekyllrb.com/docs/deployment-methods/#jekyll-hook). That removes one more step of the process and creates a site that will serve as a simple archive for these reports.

The shell script can also be set up on a cron job to run automatically, removing the need for me to intervene and if it's running on the cloud, my local machine doesn't have to be active for it to happen.

What are your thoughts? How could this be improved?
