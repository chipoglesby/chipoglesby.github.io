---
title: "What if newspapers and reporters used Git & Github?"
author: chipoglesby
comments: true
date: "2018-05-20"
layout: post
slug: what-if-newspapers-use-git
excerpt: What if newspapers used a version control system to author, collaborate and publish all of their work? Would that be possible?
published: false
categories:
- Journalism
- coding
tags:
- newspapers
- Journalism
- coding
---

I've been reading more about [`bookdown`](https://bookdown.org/) the past
few days which is a really interesting concept using `R` to publish statistics
books. That led me to think more about how newspapers operate.

I started thinking this morning back to my days at a newspaper and the workflow
that we used to publish our articles. This was in 2010 before most people had
thought about reverse publishing a newspaper, online first and then reflowing
the xml to indesign to be published in print.

That got me thinking. Would it be possible for a newspaper website to work
exclusively using the open collaborative nature of `git` and host it on a site
like [Github](https://github.com)?

Then I started thinking about it. Github has:

 * **Projects:** Which are good for working on daily stories
 * **Issues:** Which the public could use to request coverage of a particular
 topic.
 * **Pull Requests:** Which could be used for building the daily site/issue
 * **Github Pages:** Which can be used for special projects and even hosting a
 static version of the site.

Reporters would be able to create branches for their stories, Editors could use
[review requests](https://blog.github.com/2016-12-07-introducing-review-requests/)
to request changes. Since you can version control almost anything you could host 
data, visualizations, code for analysis and images here as well.

Special projects and exposés could be stored in an individual private repo
and then pushed upstream when being published to ensure others won't get the
scoop that you're working on.

If the size of repo became an issue, you could also house images on Google Cloud
or Amazon buckets, or you could create an organization on
[data.world](https://data.world/) and version control you data files there,
giving the public access to everything you publish.

By using an open-source model like [`Git`](https://git-scm.com/) it may cut down on
the perceived bias in news because it would give people insight to how newspapers
operate. For analyses, it would give experts the chance to weigh in on
visualizations and analyses.

By using Git, you would be able to see the entire change history of an article
from beginning to end.

I have seen some newsrooms do this. [Fivethirtyeight for example publishes
their data and and code behind their graphics on github](https://github.com/fivethirtyeight).
