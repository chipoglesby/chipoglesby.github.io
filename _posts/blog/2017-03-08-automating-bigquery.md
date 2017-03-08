---
title: "How To: Automating BigQuery jobs"
author: "chipoglesby"
date: '2017-03-08'
excerpt: A short example of how I automate my BigQuery jobs using bash.
layout: post
published: true
slug:
categories:

- Coding

tags:

- github
- bash
- BigQuery

---

One of my favorite tools that I've been using for the past few months is the 
[Google BigQuery command line tool](https://cloud.google.com/bigquery/bq-command-line-tool).
The `bq` tool lets you interact with Google BigQuery through the command line interface. It's a part of the 
[Google Cloud SDK](https://cloud.google.com/sdk/gcloud/reference/). 

## So, why would you want to use this tool? 

Great question. With this tool, you can run queries like
`bq query "SELECT name,count FROM mydataset.babynames WHERE gender = 'M' ORDER BY count DESC LIMIT 6"`
and it will return a result programmatically for you.

At my job though, we use BigQuery for our data warehouse. We also have specific tables that need to be built
or rebuilt on a daily basis using the same queries. With that in mind, I was able to set up a `cronjob` that runs
on a given interval that will automatically build datasets for me.

## Example
Here's an example that will walk through.

```
#!/bin/bash

# Variables
token='token'
url='https://github.com'
table='table'

sql=$(curl -H "Content-Type: application/json" -H "Authorization: token $token" $url | jq '.content' | sed -e 's/\\n/ /g' -re 's/"//g' | base64 --decode)

bq query --q --destination_table '$table --allow_large_results --replace $sql
```

In this script, I'm remotely calling a large sql file that's stored on Github.
The `bq` query will then run the `$sql` variable and save the output to a given table.
The flags `--allow_large_results` lets you return large query results and
`--replace` will replace all of the data in the destination table.

If you're interested in how the `sql` variable is set up, you can check out
[my post from yesterday](http://www.chipoglesby.com/2017/03/github-and-bash/).
