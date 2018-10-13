---
title: "Running Google Search Console Scripts in Docker on Google Compute Engine"
author: chipoglesby
comments: true
date: "2018-10-13"
layout: post
slug: what-if-newspapers-use-git
excerpt: Running a Docker image on Google Compute Engine that pulls Google Webmaster Tools data and stores it in BigQuery.
published: true
categories:
- coding
tags:
- coding
---

If you've read my blog before, then you know I'm a Google fan. Google has a
great [free tier](https://cloud.google.com/free/) that you can check out if
you'd like to learn more about how you can use Google Cloud for your data
science projects.

The code for this project are here:

1. [rbaseplus](https://github.com/chipoglesby/rbaseplus)
2. [searchconsole](https://github.com/chipoglesby/searchconsole)

This post will cover the following tools:

1. Google Cloud Build
2. Google Container Registry
3. Google Source Repos
4. Google Service Accounts
5. Docker Images and Containers
6. Google Cloud

Over the past few years I've been using `R` to pull data from Google Webmaster
Tools Search Console and storing the data in Google BigQuery so that it can
be analyzed or visualized at a later data.

Normally I would run the script locally with a cronjob on my computer. Recently
I've been working more with Docker images to make some of my data analysis
more reproducible.

I thought that it would be a great opportunity to take a task like this and
automate it in the cloud.

What I'll present is how to setup the project and run it in the cloud so you can
do the same thing.

To begin with you'll need a working knowledge of `R` and Docker. If you don't,
go read up on them and come back when you're ready. You'll also need to have
your Google Cloud project ready. There's a
[free tier](https://cloud.google.com/free/) that's great for this.

Right now the code for this project has been mirrored on Github. We'll begin
with a base image of the rocker image for R. Let's take a look at our Dockerfile:

<script src="https://gist-it.appspot.com/github/chipoglesby/rbaseplus/blob/master/Dockerfile"></script>

If you want to run this image locally on your machine, it's available here:
[hub.docker.com/r/chipogelsby/rbaseplus](https://hub.docker.com/r/chipoglesby/rbaseplus/)
or use `docker pull chipoglesby/rbaseplus`.

We're going to use
[Google Cloud's Source Repo](https://source.cloud.google.com/repo/new) to store
our Dockerfile so it can be built using
[Google Cloud Build](https://cloud.google.com/cloud-build/).

Let's create a new
[source repository called rbaseplus](https://source.cloud.google.com/repo/new).

Next let's create a [Cloud Build Trigger.](https://cloud.google.com/cloud-build/docs/running-builds/automate-builds)

This trigger will automatically build a new Docker image based on our previous
Dockerfile. This base image includes R, various Linux files and all of the
packages for our next project.

Next, let's clone the
[searchconsole project from Github](https://github.com/chipoglesby/searchconsole)
and upload it to a new google source repo in our project. You should update the
Dockerfile with your own project id.

<script src="https://gist-it.appspot.com/github/chipoglesby/searchconsole/blob/master/Dockerfile"></script>

You should also update `search.R` with your own information. The `search.R`
script pulls data from Webmaser Tools and uploads it into BigQuery. Before you
run the script, make sure you've created a dataset in BigQuery to store your
data. Give the dataset and tables descriptive names.

<script src="https://gist-it.appspot.com/github/chipoglesby/searchconsole/blob/master/r/searchConsole/code/search.R"></script>

Now let's create a new
[service account in our Google Cloud project](https://cloud.google.com/iam/docs/understanding-service-accounts).
Give it a memorable name and create a `json` key. You'll also want to add the
service account email as a full user in the webmaster tools project that you
want to pull data from.

We also want to build a  create a [Cloud Build Trigger.](https://cloud.google.com/cloud-build/docs/running-builds/automate-builds)
for this repo as well, but this time we are going to use Google's `cloudbuild.yaml`
to build the docker image.

Once this is done building, you will be able to deploy this image to Google
Compute Engine from the Google Container Registry. Google also launched
[Shielded VM's](https://cloud.google.com/shielded-vm/) which you should take
advantage of. You can also deploy your image from within the
[Google Container Registry](https://cloud.google.com/container-registry/).

If you run a `f1-micro (1 vCPU, 0.6 GB memory)` VM, you can run this for free
every month on Google Cloud. This will be enough to get you started.

Once your VM is up and running, you can SSH into it using
[Google Cloud Shell](https://cloud.google.com/shell/docs/) and checkout your
Docker image. You can also set up a cronjob to run the script automatically
at any given time, if you'd like.
