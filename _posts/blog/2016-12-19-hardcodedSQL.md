---
title: "Please don't hardcode your SQL values"
author: "chipoglesby"
date: '2016-12-19'
excerpt: Let's try to make our queries more dynamic, shall we?
layout: post
published: no
slug: stop-hardcoding-sql
categories:

- Coding

tags:

- Bigquery
---

Let me get this out of the way right now: I freaking love Google BigQuery!! It's
one of the best tools I have in my tool belt right now. It has a no-sql
structure that you can run sql queries over. It is blazing fast and costs us
less than $200 per month to run it at work. We don't have huge petabytes of
data sets, our data is more wide than it is deep, but it is literally the best.

Okay, phew, I just had to share that. It's not the point of the blog post, but
I have to share that kind of stuff when I can.

Recently I wrote about [automating marketing list requests using R.](http://www.chipoglesby.com/2016/12/complex-list-requests/)
This post is going to expand on that topic some and we'll discuss how I prefer
to write sql queries for requests and analysis.

Let's start with a simple example. A coworker comes to you and wants you to know
how much gross sales were since the beginning of the year. You might easily whip
up a query like

````
SELECT
  sum(sales) demand
FROM
  [dataset.table]
WHERE
  date(date) between '2016-01-01' AND '2016-12-19'
````

That's straightforward enough, right? It's simple and it gets the job done, but
we could probably do a much better job. The cool thing is that BigQuery has its
[own sql language and supports legacy sql as well](https://cloud.google.com/bigquery/docs/reference/legacy-sql).

## Before you begin, think
Work with the person who is requesting this information to figure out if this is
just a one off query, or if it's something that they would like to know daily
weekly or monthly.

Fortunaley, BigQuery can handle all three of these. Let's take a look:

For each of our queries, we'll be wrapping the dates in a date() function. By
default, BigQuery uses an `iso-8601` date format like `2016-12-19T00:00:00Z`.
Using the `date(2016-12-19T00:00:00Z)` will give use `2016-12-19`.

## Daily:
This query uses the `CURRENT_DATE()` function that simply returns today in the
`%Y-%M-%D` format. I use the date function so that I don't have to worry about
timestamp issues.

````
SELECT
  sum(sales) demand
FROM
  [dataset.table]
WHERE
  date(date) == CURRENT_DATE()
````

## Weekly or Monthly:
This query simply builds on our last query. You can use the `DATE_ADD()`
function to your query to add or subtract
`YEAR, MONTH, DAY, HOUR, MINUTE, and SECOND` intervals. Here we're just looking
at revenue between seven days ago and yesterday. You can add or subtract time
with `+/-`.

````
SELECT
  sum(sales) demand
FROM
  [dataset.table]
WHERE
DATE(date) BETWEEN DATE(DATE_ADD(CURRENT_DATE(), -7, 'DAY'))
AND DATE(DATE_ADD(CURRENT_DATE(), -1, 'DAY')))
````

It's not just dates, you can also use other vales as well. Here we're going to
find some guid's that have a sum of demand that's great than the average demand.

````
SELECT
  guid
FROM
  [dataset.table]
GROUP BY
  guid
HAVING
  SUM(sales) > AVG(sales)
````

# Why you will want to do this

It's really easy to just do something. It requires more effort to do it properly.
Let's say that a coworker asks for a marketing list that needs to be mined so
that a campaign can be sent out. In addition to your normal models you may run,
the first question that you'll want to ask is always "Are you going to run this
more that one, say maybe next year?" If their answer is yes, you'll
know to at least make your date variables dynamic.

I should also note that your modelling set up may be very different so your
mileage may vary.
