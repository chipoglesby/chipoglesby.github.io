---
title: "Why I version control all of my analysis and data science work"
author: "chipoglesby"
date: '2016-12-18'
excerpt: Explaining the pedantic reasons why I use version control even when I work alone.
layout: post
published: yes
slug: version-control-everything
categories:

- Coding

tags:

- R
- github
- version control
- Bigquery
---

Earlier this year I took the steps to get our small team set up on
[Github](https://github.com/grouppublishing). We don't have have a large team
of engineers or data scientists yet, but I think it's important to lay the
ground work now. Sometimes it seems like our world is split into two types of
people: Those who know/love git and use it daily and those who don't.

Unlike a large open-source project, I mainly use Github for myself right now.
Each analysis that I do uses
[Github Flow](https://guides.github.com/introduction/flow/) and gets it's own
private repository. I find this much better than putting all of my work into one
repo, like what [538 does](https://github.com/fivethirtyeight/data).

## How

Just like with any open-source project, every time I work on a project, I'll
start out by creating issues of all of the work that I want to do. I'll create
forks to work on those specific issues, then I'll create pull requests to close
those issues out. This helps me keep track of changes that I make and gives me
some digital 'breadcrumbs' for what I was thinking when I was going through this
process. I've resolved not to commit directly to the master branch unless I'm
fixing something very small like a typo, which should have been caught while
doing a pull request.

For data, it depends on how often the data are changing. Here's my thinking:

1. If the data are
[larger than 100 mb](https://help.github.com/articles/working-with-large-files/)
it will be kept in cloud storage. Github has limits on how large uploaded files
are.
2. If the data are constantly changing, it stays in our data warehouse
(***We love BigQuery!!***). I'll use
[`bigrquery`](https://github.com/rstats-db/bigrquery). The data may be given a
specific dataset and table for long term storage.

Before I begin my analysis, I'll figure these things out and then make notes of
them in my `README` file.

## Why

First and foremost, I want to be as precise as possible. Versioning my work lets
me walk back through my code in the future to see what I did and what I was
thinking at the time. I'll admit that I'm getting better with my `commit`
messages. I've worked really hard from being lazy and just using
`updating files` to being more precise about what changed.

Second, I want my work to be reproducible. I never know who will
need to rerun my analysis in the future and I want it to be as easy on me or
them as possible. I should take this even further and package everything up
in a docker file so that in the future you have the same version of `R` and
packages, but I'll come back to that at another point in time.

Third, it teaches you discipline and process, something that everyone could use
more of. Is it pedantic and tedious? **OF COURSE** But it works and it works
well. This is one reason why companies like Starbucks are successful. You can
go to any store and get the same cup of coffee 99.99% of the time.
